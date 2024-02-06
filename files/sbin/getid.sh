#!/bin/sh

LOW_preUID=`cat /sys/fsl_otp/HW_OCOTP_CFG0 |cut -c 3-`
HIGH_preUID=`cat /sys/fsl_otp/HW_OCOTP_CFG1 |cut -c 3-`
echo $HIGH_preUID$LOW_preUID > /tmp/unique_id.txt
