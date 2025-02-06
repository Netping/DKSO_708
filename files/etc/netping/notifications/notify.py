#!/usr/bin/python3
import sys
import enum
import ubus
import os
import re
import requests
import json
from datetime import datetime
from threading import Thread
from threading import Lock
from journal import journal
try:
    from modemproto import ModemProto
except ImportError as e:
    ModemProto = None




class notify_type(enum.Enum):
    empty = 0
    email = 1
    syslog = 2
    snmptrap = 3
    sms = 4
    webhook = 5

class event_type(enum.Enum):
    empty = 0
    temperature = 1
    userlogin = 2
    userlogout = 3
    configchanged = 4
    operation = 5
    error = 6
    statechanged = 7
    humidity = 8

class event:
    name = ""
    active = False
    ubus_event = event_type.empty
    date_time = []
    expression = ''
    notify_method = notify_type.empty
    settings = {}

module_name = "Notifications"

events = []
pollThread = None
ubusConnected = False
confName = 'notifyconf'
default_event = event()

notify_type_map = { 'email' : notify_type.email,
                    'syslog' : notify_type.syslog,
                    'snmptrap' : notify_type.snmptrap,
                    'sms' : notify_type.sms,
                    'webhook' : notify_type.webhook }

event_type_map = { 'temperature' : event_type.temperature,
                    'userlogin' : event_type.userlogin,
                    'userlogout' : event_type.userlogout,
                    'configchanged' : event_type.configchanged,
                    'operation' : event_type.operation,
                    'error' : event_type.error,
                    'statechanged' : event_type.statechanged, 
                    'humidity' : event_type.humidity}

weekday_map = {
    'Пн': 'Mon',
    'Вт': 'Tue',
    'Ср': 'Wed',
    'Чт': 'Thu',
    'Пт': 'Fri',
    'Сб': 'Sat',
    'Вс': 'Sun'
}

weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

mutex = Lock()

def check_notification_time(date_time, now):
    today_weekday = weekdays[now.weekday()]
    result = False
    now_time = now.time()

    for t in date_time:
        start_time = t['time'][0].time()
        end_time = t['time'][1].time()
        time_match = (now_time >= start_time and now_time <= end_time)
        day_match = (today_weekday in t['days'])
        if time_match and day_match:
            result = True
            break
    return result

def handle_event(event, data):
    now = datetime.now()
    mutex.acquire()

    if not events:
        mutex.release()
        return

    for e in events:
        if e.active:
            #check event

            if e.ubus_event != event_type_map[data['event']]:
                continue
            #check expression
           
            expr = expression_convert(e.expression)

            try:
                expr_res = eval(expr)
            except:
                expr_res = False

            if not expr_res:
                continue
            #check time
            if check_notification_time(e.date_time, now):
                send_notify(e, data)

    mutex.release()

def reconfigure(event, data):
    if data['config'] == confName:
        mutex.acquire()

        del events[:]

        mutex.release()

        journal.WriteLog(module_name, "Normal", "notice", "Config changed!")

        applyconfig()

def poll():
    global ubusConnected

    mutex.acquire()

    ubus.connect()

    ubusConnected = True

    ubus.listen(("signal", handle_event))
    ubus.listen(("commit", reconfigure))

    mutex.release()

    ubus.loop()

    ubus.disconnect()

    ubusConnected = False

def parse_timetable(value):
    ret = []

    # records = value.split(' ')
    for r in value:
        parts = r.split(' ')
        if len(parts) == 0:
            continue
        days = [weekday_map[d] for d in parts[0].split(',')]
        t = parts[1].split('-')

        start_time = t[0]
        end_time = t[1]

        now = datetime.now()
        time_format = '%H:%M:%S'
        start_time_dt = datetime.strptime(start_time, time_format)
        start_time_dt = start_time_dt.replace(day=now.day, month=now.month, year=now.year)

        end_time_dt = datetime.strptime(end_time, time_format)
        end_time_dt = end_time_dt.replace(day=now.day, month=now.month, year=now.year)
        new = {'days': days, 'time': [start_time_dt, end_time_dt]}
        ret.append(new)

    return ret

def make_settings(method, dictionary, expression):
    ret = {}

    if method == notify_type.email:
        try:
            ret['message'] = dictionary['text']
            params = list(re.findall(r'%_(\S+)_%', expression))
            ret['params'] = params
        except:
            ret['message'] = ''
            params = list(re.findall(r'%_(\S+)_%', expression))
            ret['params'] = params

        try:
            ret['fromaddr'] = dictionary['from']
        except:
            ret['fromaddr'] = ''

        try:
            ret['subject'] = dictionary['subject']
        except:
            ret['subject'] = ''

        try:
            ret['signature'] = dictionary['signature']
        except:
            ret['signature'] = ''

        try:
            ret['toaddr'] = [ a for a in dictionary['sendto'].split(',')]
        except:
            ret['toaddr'] = []

    elif method == notify_type.syslog:
        try:
            ret['message'] = dictionary['text']
            params = list(re.findall(r'%_(\S+)_%', expression))
            ret['params'] = params
        except:
            ret['message'] = ''
            params = list(re.findall(r'%_(\S+)_%', expression))
            ret['params'] = params

        try:
            ret['level'] = dictionary['loglevel']
        except:
            ret['level'] = ''

        try:
            ret['prefix'] = dictionary['logprefix']
        except:
            ret['prefix'] = ''

    elif method == notify_type.snmptrap:
        try:
            ret['toaddr'] = [ a for a in dictionary['sendto'].split(',')]
        except:
            ret['toaddr'] = []

        try:
            ret['port'] = dictionary['port']
        except:
            ret['port'] = ''

        try:
            ret['oid'] = dictionary['oid']
        except:
            ret['oid'] = ''

    elif method == notify_type.sms:
        try:
            params = list(re.findall(r'%_(\S+)_%', expression))
            ret['message'] = dictionary['text']
            ret['params'] = params
        except:
            ret['message'] = ''

        try:
            ret['to_phone'] = [ a for a in dictionary['sendto'].split(',')]
        except:
            ret['to_phone'] = []

    elif method == notify_type.webhook:
        try:
            ret['toaddr'] = [ a for a in dictionary['sendto'].split(',')]
        except:
            ret['toaddr'] = []

        try:
            ret['request'] = dictionary['request']
        except:
            ret['request'] = 'WEBget'

    else:
        journal.WriteLog(module_name, "Normal", "error", "Bad notify type")

    return ret

def applyconfig():
    global pollThread
    global ubusConnected

    mutex.acquire()

    try:
        if not ubusConnected:
            ubus.connect()

        confvalues = ubus.call("uci", "get", {"config": confName})
        for confdict in list(confvalues[0]['values'].values()):
            if confdict['.type'] == 'notify' and confdict['.name'] == 'prototype':
                default_event.name = confdict['name']
                default_event.active = bool(int(confdict['state']))
                default_event.ubus_event = event_type_map[confdict['event']]
                try:
                    default_event.date_time = parse_timetable(confdict['timetable'])
                except:
                    default_event.date_time = []                
                try:
                    default_event.expression = confdict['expression']
                except:
                    default_event.expression = ''
                default_event.notify_method = notify_type_map[confdict['method']]

            if confdict['.type'] == 'notify' and confdict['.name'] != 'prototype':
                exist = False
                e = event()
                e.name = confdict['name']

                for element in events:
                    if element.name == e.name:
                        journal.WriteLog(module_name, "Normal", "error", "Event with name " + e.name + " is exists!")
                        exist = True
                        break

                if e.name == '':
                    journal.WriteLog(module_name, "Normal", "error", "Name can't be empty")
                    continue

                if exist:
                    continue

                try:
                    e.active = bool(int(confdict['state']))
                except:
                    e.active = default_event.active

                e.ubus_event = event_type_map[confdict['event']]
                e.expression = confdict['expression']

                e.notify_method = notify_type_map[confdict['method']]
                if not 'timetable' in confdict:
                    journal.WriteLog(module_name, "Normal", "error", "Failed to parse timetable!")
                    continue
                try:
                    e.date_time = parse_timetable(confdict['timetable'])
                except Exception as ex:
                    e.date_time = default_event.date_time
                    journal.WriteLog(module_name, "Normal", "error", "Fail to parse timetable field")
                    
                e.settings = make_settings(e.notify_method, confdict, e.expression)

                if e.ubus_event == event_type.empty:
                    e.ubus_event = default_event.ubus_event

                if e.expression == '':
                    e.expression = default_event.expression

                if e.notify_method == notify_type.empty:
                    e.notify_method = default_event.notify_method

                if not e.date_time:
                    e.date_time = default_event.date_time

                if not e.settings:
                    e.settings = default_event.settings

                events.append(e)

        if not ubusConnected:
            ubus.disconnect()

        if not pollThread:
            pollThread = Thread(target=poll, args=())
            pollThread.start()

    except Exception as ex:
        journal.WriteLog(module_name, "Normal", "error", "Can't connect to ubus " + str(ex))

    mutex.release()

def send_notify(e, data):

    if e.notify_method == notify_type.email:
        try:
            params = e.settings['params']
            text = substitute_params(e.settings['message'], params, data)
            for addr in e.settings['toaddr']:

                ubus.call("owrt_email", "send_mail", { "fromaddr":e.settings['fromaddr'], "toaddr":addr, "text":text, "subject":e.settings['subject'] ,"signature":e.settings['signature'], "ubus_rpc_session":"1" })
        except Exception as ex:
            journal.WriteLog(module_name, "Normal", "error", "Can't send mail " + str(ex) + ". Notification: " + e.name)

    elif e.notify_method == notify_type.syslog:
        try:
            params = e.settings['params']
            text = substitute_params(e.settings['message'], params, data)
            journal.WriteLog(e.settings['prefix'], "Normal", e.settings['level'], text)
        except:
            journal.WriteLog(module_name, "Normal", "error", "Can't write log. Notification: " + e.name)

    elif e.notify_method == notify_type.snmptrap:
        try:
            #send snmptrap via system call
            for addr in e.settings['toaddr']:
                os.system(f"snmptrap -c public -v 2c {addr}:{e.settings['port']} '' {e.settings['oid']} 1 s '{json.dumps(data)}'")
        except:
            journal.WriteLog(module_name, "Normal", "error", "Can't send snmptrap. Notification: " + e.name)

    elif e.notify_method == notify_type.webhook:
        try:
            for addr in e.settings['toaddr']:
                journal.WriteLog(module_name, "Normal", "notice", "send webhook to addr " + addr + " method " + e.settings['request'])

                if e.settings['request'] == 'WEBget':
                    requests.get(addr)
                elif e.settings['request'] == 'WEBpost':
                    requests.post(addr, data=json.dumps(data), headers={ 'Content-Type' : 'application/json' })
        except:
            journal.WriteLog(module_name, "Normal", "error", "Can't send webhook. Notification: " + e.name)
    elif e.notify_method == notify_type.sms:
        if ModemProto is None:
            return
        try:
            mp = ModemProto()
            params = e.settings['params']
            text = substitute_params(e.settings['message'], params, data)
            # send SMS
            for phone_number in e.settings['to_phone']:
                ret = mp.sendSMS(phone_number, text)
        except:
            journal.WriteLog(module_name, "Normal", "error", "Can't send sms. Notification: " + e.name)
    else:
        journal.WriteLog(module_name, "Normal", "error", "Unknown notify type")

def substitute_params(text, params, data):
    result = text
    for param in params:
        value = str(data[param])
        my_regex = r'%_' + re.escape(param) + r'_%'
        result = re.sub(my_regex, value, result)
    return result

def expression_convert(expression):
    result = re.findall(r'%_(\S+)_%', expression)
    result = set(result)

    for r in result:
        expression = expression.replace("%_" + r + "_%", "data['" + r + "']")

    logic_operands = [ 'AND', 'OR', 'NOT' ]

    for l in logic_operands:
        expression = expression.replace(l, l.lower())

    expression = expression.replace("=", "==")

    compare_operands = ["<=", ">="]
    for oper in compare_operands:
        start = 0
        while start < len(expression):
            start = expression.find(oper, start)
            if start == -1:
                break
            expression = expression[:start + 2] + expression[start + 3:]
            start += 1
 
    return expression

def main():
    journal.WriteLog(module_name, "Normal", "notice", "Start module!")

    if ModemProto is None:
        journal.WriteLog(module_name, "Normal", "notice", "SMS module not installed")
    applyconfig()

if __name__ == "__main__":
    main()
