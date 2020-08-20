/*
 * Copyright (C) 2017 starterkit.ru
 *
 * Based on simple driver for PWM (Pulse Width Modulator) controller
 * Sascha Hauer <s.hauer@pengutronix.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/interrupt.h>
#include <linux/fs.h>
#include <linux/clk.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <linux/of_device.h>

#include <sound/core.h>
#include <sound/initval.h>
#include <sound/pcm.h>
#include <sound/control.h>

MODULE_LICENSE("GPL v2");
MODULE_AUTHOR("starterkit.ru <info@starterkit.ru>");

static const struct of_device_id imx_snd_pwm_dt_ids[] = {
	{ .compatible = "fsl,imx-snd-pwm", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, imx_snd_pwm_dt_ids);

#define dbg(fmt, arg...) \
	printk("imx-snd-pwm: %s: " fmt, __func__, ## arg);

/* i.MX27, i.MX31, i.MX35 share the same PWM function block: */
#define MX3_PWMCR			0x00    /* PWM Control Register */
#define MX3_PWMSR			0x04    /* PWM Status Register */
#define MX3_PWMIR			0x08    /* PWM Interrupt Register */
#define MX3_PWMSAR			0x0C    /* PWM Sample Register */
#define MX3_PWMPR			0x10    /* PWM Period Register */
#define MX3_PWMCR_FWM(x)		(((x) & 0x3) << 26)
#define MX3_PWMCR_PRESCALER(x)		((((x) - 1) & 0xFFF) << 4)
#define MX3_PWMCR_DOZEEN		(1 << 24)
#define MX3_PWMCR_WAITEN		(1 << 23)
#define MX3_PWMCR_DBGEN			(1 << 22)
#define MX3_PWMCR_CLKSRC_IPG_HIGH	(2 << 16)
#define MX3_PWMCR_CLKSRC_IPG		(1 << 16)
#define MX3_PWMCR_SWR			(1 << 3)
#define MX3_PWMCR_EN			(1 << 0)
#define MX3_PWMSR_FIFOAV_4WORDS		0x4
#define MX3_PWMSR_FIFOAV_MASK		0x7
#define MX3_PWMIR_FIE			(1 << 0)

struct imx_snd_dev {
	struct platform_device *pdev;
	struct clk *clk_per;
	struct clk *clk_ipg;
	void __iomem *mmio_base;
	int irq;
	struct snd_card *snd_card;
	struct snd_pcm_substream *ss;
	spinlock_t lock;
	unsigned int data_ptr;
	unsigned int period_ptr;
	unsigned int is_on;
};

#define MX3_PWM_SWR_LOOP		5

static int imx_pwm_enable(struct imx_snd_dev *imx)
{
	unsigned char *data = imx->ss->runtime->dma_area;
	int wait_count = 0, ret;
	u32 cr;

	ret = clk_prepare_enable(imx->clk_per);
	if (ret)
		return ret;

	writel(0, imx->mmio_base + MX3_PWMCR);
	writel(MX3_PWMCR_SWR, imx->mmio_base + MX3_PWMCR);
	do {
		udelay(200);
		cr = readl(imx->mmio_base + MX3_PWMCR);
	} while ((cr & MX3_PWMCR_SWR) &&
		 (wait_count++ < MX3_PWM_SWR_LOOP));

	if (cr & MX3_PWMCR_SWR)
		dbg("software reset timeout\n");

	cr = MX3_PWMCR_FWM(3) |
		MX3_PWMCR_PRESCALER(clk_get_rate(imx->clk_per) / (256 * 8000) + 1) |
		MX3_PWMCR_DOZEEN | MX3_PWMCR_WAITEN |
		MX3_PWMCR_DBGEN | MX3_PWMCR_CLKSRC_IPG_HIGH;
	writel(cr, imx->mmio_base + MX3_PWMCR);

	writel(data[0], imx->mmio_base + MX3_PWMSAR);
	writel(data[1], imx->mmio_base + MX3_PWMSAR);
	writel(data[2], imx->mmio_base + MX3_PWMSAR);
	imx->data_ptr = 2;
	imx->period_ptr = 2;

	writel(readl(imx->mmio_base + MX3_PWMSR),
			imx->mmio_base + MX3_PWMSR);

	writel(MX3_PWMIR_FIE, imx->mmio_base + MX3_PWMIR);

	/* the real period value should be PERIOD value in PWMPR plus 2 */
	writel(256 - 2, imx->mmio_base + MX3_PWMPR);

	cr = readl(imx->mmio_base + MX3_PWMCR);
	cr |= MX3_PWMCR_EN;
	writel(cr, imx->mmio_base + MX3_PWMCR);

	return 0;
}

static void imx_pwm_disable(struct imx_snd_dev *imx)
{
	writel(0, imx->mmio_base + MX3_PWMCR);
	writel(0, imx->mmio_base + MX3_PWMIR);

	clk_disable_unprepare(imx->clk_per);
}

static irqreturn_t imx_irq_handler(int irq, void *dev_id)
{
	struct imx_snd_dev *imx = dev_id;
	unsigned int period_elapsed = 0;
	unsigned long flags;

	spin_lock_irqsave(&imx->lock, flags);
	if (imx->is_on) {
		unsigned char *data = imx->ss->runtime->dma_area;
		unsigned int buffer_size = imx->ss->runtime->buffer_size;
		unsigned int period_size = imx->ss->runtime->period_size;
		int i = 0;

		for (i = 0; i < 3; i++) {
			if (++imx->data_ptr >= buffer_size)
				imx->data_ptr = 0;
			writel(data[imx->data_ptr], imx->mmio_base + MX3_PWMSAR);

			if (++imx->period_ptr >= period_size) {
				imx->period_ptr = 0;
				period_elapsed = 1;
			}
		}
		writel(readl(imx->mmio_base + MX3_PWMSR),
			imx->mmio_base + MX3_PWMSR);
	}
	spin_unlock_irqrestore(&imx->lock, flags);

	if (period_elapsed)
		snd_pcm_period_elapsed(imx->ss);

	return IRQ_HANDLED;
}

/**
 * PCM Interface
 */
static int imx_pcm_hw_params(struct snd_pcm_substream *ss,
		struct snd_pcm_hw_params *hw_params)
{
	return snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(hw_params));
}

static int imx_pcm_hw_free(struct snd_pcm_substream *ss)
{
	return snd_pcm_lib_free_pages(ss);
}

static const struct snd_pcm_hardware imx_playback_hw = {
	.info			= (SNDRV_PCM_INFO_MMAP |
				   SNDRV_PCM_INFO_MMAP_VALID |
				   SNDRV_PCM_INFO_INTERLEAVED |
				   SNDRV_PCM_INFO_HALF_DUPLEX),
	.formats		= SNDRV_PCM_FMTBIT_U8,
	.rates			= SNDRV_PCM_RATE_8000,
	.rate_min		= 8000,
	.rate_max		= 8000,
	.channels_min		= 1,
	.channels_max		= 1,
	.buffer_bytes_max	= 8 * 1024,
	.period_bytes_min	= 4,
	.period_bytes_max	= 2 * 1024,
	.periods_min		= 4,
	.periods_max		= 512,
};

static int imx_pcm_open(struct snd_pcm_substream *ss)
{
	struct imx_snd_dev *imx = snd_pcm_substream_chip(ss);

	ss->runtime->hw = imx_playback_hw;
	imx->ss = ss;
	return 0;
}

static int imx_pcm_close(struct snd_pcm_substream *ss)
{
	return 0;
}

static int imx_pcm_prepare(struct snd_pcm_substream *ss)
{
	return 0;
}

static int imx_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
{
	struct imx_snd_dev *imx = snd_pcm_substream_chip(ss);
	int ret = 0;
	unsigned long flags;

	spin_lock_irqsave(&imx->lock, flags);
	switch (cmd) {
	case SNDRV_PCM_TRIGGER_START:
		if (imx_pwm_enable(imx) == 0)
			imx->is_on = 1;
		else
			ret = -EIO;
		break;
	case SNDRV_PCM_TRIGGER_STOP:
		if (!imx->is_on)
			break;
		imx->is_on = 0;
		imx_pwm_disable(imx);
		break;
	default:
		ret = -EINVAL;
	}
	spin_unlock_irqrestore(&imx->lock, flags);

	return ret;
}

static snd_pcm_uframes_t imx_pcm_pointer(struct snd_pcm_substream *ss)
{
	struct imx_snd_dev *imx = snd_pcm_substream_chip(ss);

	return imx->data_ptr;
}

static struct snd_pcm_ops imx_pcm_ops = {
	.open = imx_pcm_open,
	.close = imx_pcm_close,
	.ioctl = snd_pcm_lib_ioctl,
	.hw_params = imx_pcm_hw_params,
	.hw_free = imx_pcm_hw_free,
	.prepare = imx_pcm_prepare,
	.trigger = imx_pcm_trigger,
	.pointer = imx_pcm_pointer,
};

static int imx_snd_register(struct imx_snd_dev *imx)
{
	static struct snd_device_ops ops = { NULL };
	struct snd_card *card;
	struct snd_pcm *pcm;
	int ret;

	ret = snd_card_new(&imx->pdev->dev, SNDRV_DEFAULT_IDX1,
		SNDRV_DEFAULT_STR1,
		THIS_MODULE, 0, &card);
	if (ret < 0)
		return ret;

	imx->snd_card = card;
	strlcpy(card->driver, KBUILD_MODNAME, sizeof(card->driver));
	strlcpy(card->shortname, "imx-snd-pwm", sizeof(card->shortname));
	strlcpy(card->longname, "imx PWM audio", sizeof(card->longname));

	ret = snd_device_new(card, SNDRV_DEV_LOWLEVEL, imx, &ops);
	if (ret < 0)
		goto snd_error;

	ret = snd_pcm_new(card, card->driver, 0, 1, 0, &pcm);
	if (ret < 0)
		goto snd_error;

	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &imx_pcm_ops);
	snd_pcm_chip(pcm) = imx;
	pcm->info_flags = 0;
	snprintf(pcm->name, sizeof(pcm->name), "%s DAC", card->shortname);

	ret = snd_pcm_lib_preallocate_pages_for_all(pcm,
				SNDRV_DMA_TYPE_CONTINUOUS,
				snd_dma_continuous_data(GFP_KERNEL),
				8 * 1024, 8 * 1024);
	if (ret < 0)
		goto snd_error;

	ret = snd_card_register(card);
	if (ret == 0)
		return 0;

snd_error:
	snd_card_free(card);
	imx->snd_card = NULL;
	return ret;
}

static int imx_probe(struct platform_device *pdev)
{
	struct imx_snd_dev *imx;
	struct resource *r;
	int ret;

	imx = devm_kzalloc(&pdev->dev, sizeof(*imx), GFP_KERNEL);
	if (imx == NULL)
		return -ENOMEM;

	imx->pdev = pdev;
	spin_lock_init(&imx->lock);

	imx->clk_per = devm_clk_get(&pdev->dev, "per");
	if (IS_ERR(imx->clk_per)) {
		dev_err(&pdev->dev, "getting per clock failed with %ld\n",
				PTR_ERR(imx->clk_per));
		return PTR_ERR(imx->clk_per);
	}

	imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
	if (IS_ERR(imx->clk_ipg)) {
		dev_err(&pdev->dev, "getting ipg clock failed with %ld\n",
				PTR_ERR(imx->clk_ipg));
		return PTR_ERR(imx->clk_ipg);
	}

	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	imx->mmio_base = devm_ioremap_resource(&pdev->dev, r);
	if (IS_ERR(imx->mmio_base))
		return PTR_ERR(imx->mmio_base);

	imx->irq = platform_get_irq(pdev, 0);
	if (imx->irq < 0) {
		dev_err(&pdev->dev, "no irq defined in platform data\n");
		return imx->irq;
	}

	ret = devm_request_irq(&pdev->dev, imx->irq, imx_irq_handler,
			0, KBUILD_MODNAME, imx);
	if (ret) {
		dev_err(&pdev->dev, "request_irq failed\n");
		return ret;
	}

	ret = imx_snd_register(imx);
	if (ret)
		return ret;

	platform_set_drvdata(pdev, imx);
	return 0;
}

static int imx_remove(struct platform_device *pdev)
{
	struct imx_snd_dev *imx = platform_get_drvdata(pdev);

	snd_card_free(imx->snd_card);
	imx->snd_card = NULL;
	return 0;
}

static struct platform_driver imx_snd_pwm_driver = {
	.driver		= {
		.name	= "imx-snd-pwm",
		.of_match_table = imx_snd_pwm_dt_ids,
	},
	.probe		= imx_probe,
	.remove		= imx_remove,
};

module_platform_driver(imx_snd_pwm_driver);

