#!/bin/python3
#
#
#########
# Dev by :  Cdiez50
# For    :  ATE
# Date   :  Oct 2016
##########


# -*- coding: utf-8 -*-

# Importing
import functools
import sys
import os
import pyinotify
import signal
import time
from pathlib import Path

# We will make a simple counter() function to get loop for each event
class Counter(object):
    """
    Simple counter.
    """
    def __init__(self):
        self.count = 0
    def plusone(self):
        self.count += 1

# Here is the loop that will be call when action in listening path
def on_loop(notifier, counter):
    if counter.count == -1:
        # Loops 5 times then exits.
        sys.stdout.write("Exit\n")
        notifier.stop()
        sys.exit(0)
    else:
        # Debug mode to have the loop count displaying
        #sys.stdout.write("Loop %d\n" % counter.count)

        # Need to display time to log users actions
        print(time.strftime("Last action (above) did at date : %d/%m/%Y %H:%M:%S"))
        counter.plusone()


### LOGS INFO ###

"""
CREATING FILE :
<Event dir=False mask=0x100 maskname=IN_CREATE name=test path=corentin pathna me=/corentin/test wd=1 >

DELETING FILE :
<Event dir=False mask=0x200 maskname=IN_DELETE name=test path=corentin pathname=/corentin/test wd=1 >

CREATING DIR :
<Event dir=True mask=0x40000100 maskname=IN_CREATE|IN_ISDIR name=test1 path=corentin pathname=/corentin/test1 wd=1 >

DELETING A DIR :
<Event dir=True mask=0x40000200 maskname=IN_DELETE|IN_ISDIR name=test1 path=corentin pathname=/corentin/test1 wd=1 >
"""


# Here is the welcome message that the user get at the start program
print("\n\n ===========================\n Welcome to PyNotif !\n ===========================\n\n",
      "Developed by :   Cdiez50\n",
      "Github :         https://github.com/Cdiez50/\n",
      "Version :        0.1\n\n",
      "Type \"help\" command to have informations !\n\n")

while True :

    # Waiting for user action :
    oInput = input("Cdiez50_PyNotif : ")

    # If User Input is empty, return to the beginning of while True :
    if oInput == "" :
        pass

    # We will define the help command first :
    # HELP : 
    elif oInput == "help" or oInput == "Help" :

	# We print function list
        print('\n'
	'---Specials Commands ---' '\n\n'
	'help      :       Giving you the help''\n'
	'start     :       Start the program. Two files will be created in the "logs".DIR : .log and .pid.''\n'
	'stop      :       Stop the program by removing pid file and doing pkill.''\n'
	'restart   :       Restart by checking if existing pid is presents and process restarting. ''\n'
        'status    :       Giving states (Running/Not).''\n'
        'exit      :       Exiting the program.''\n')

    # Start
    elif oInput == "Start" or oInput == "start" :

        # Here is variables that will be used to ajust the program
        wm = pyinotify.WatchManager()
        mask = pyinotify.IN_DELETE | pyinotify.IN_CREATE  # watched events
        notifier = pyinotify.Notifier(wm)

        # Place here the path you want to listen
        # In my case it will be 'corentin' directory
        wm.add_watch('corentin', mask, rec=True)
        wm.add_watch('corentin/TEST', mask, rec=True)
        on_loop_func = functools.partial(on_loop, counter=Counter())


        # Here is the init loop
        # Please notice that two files are created
        #
        # Log one and Pid one
        #
        # You can define a custom location foreach

        try:
            print("The Deamon is now start")
            notifier.loop(daemonize=True, callback=on_loop_func, pid_file='/home/cdiez50/python_Inotify/Python_Inotify/logs/pyinotify.pid', stdout='/home/cdiez50/python_Inotify/Python_Inotify/logs/pyinotify.log')

        except pyinotify.NotifierError as err:
            print('Error : Can not start deamon')

    # Stop
    # The stop will make a pkill and will rm the pid_file
    elif oInput == "Stop" or oInput == "stop" :

        # We need to check if the pyinotify.pid exists
        file_pid = Path('logs/pyinotify.pid')

        # If yes
        # We read the pid file to save it as pid_read variable
        if file_pid.is_file():
            f = open('logs/pyinotify.pid')
            pid_read = f.read()
            f.close

	    # The we can delete file and pkill
            print('Killing process with PID : ', pid_read)
            os.remove('logs/pyinotify.pid')
            os.kill(int(pid_read), signal.SIGKILL)

        else:
            print('Error : Process is not started')


    # Restart Function
    # It will firs check if the pid file exist, then delete and restart with the notifier.loop
    elif oInput == "restart" or oInput == "Restart" :

        file_pid = Path('logs/pyinotify.pid')
        # We need to check if the pyinotify.pid exists
        if file_pid.is_file():
            f = open('logs/pyinotify.pid')
            pid_read = f.read()
            f.close

	    # The we can delete file and pkill
            print('Killing process with PID : ', pid_read)
            os.remove('logs/pyinotify.pid')
            os.kill(int(pid_read), signal.SIGKILL)

            # Here is variables that will be used to ajust the program
            wm = pyinotify.WatchManager()
            notifier = pyinotify.Notifier(wm)

            # Place here the path you want to listen
            # In my case it will be 'corentin' directory
            wm.add_watch('corentin', pyinotify.ALL_EVENTS)
            on_loop_func = functools.partial(on_loop, counter=Counter())


            # Here is the init loop
            # Please notice that two files are created
            #
            # Log one and Pid one
            #
            # You can define a custom location foreach

            try:
                print("The Deamon is now start")
                notifier.loop(daemonize=True, callback=on_loop_func, pid_file='/home/cdiez50/python_Inotify/Python_Inotify/logs/pyinotify.pid', stdout='/home/cdiez50/python_Inotify/Python_Inotify/logs/pyinotify.log')

            except pyinotify.NotifierError as err:
                print('Can not start deamon')

        else:
            print('Error : Process is not started')


    # Status
    # The aim is to give the real statement of the program
    elif oInput == "status" or oInput == "Status":

        # If the pid file exist, the program is running
        file_pid = Path('logs/pyinotify.pid')
        if file_pid.is_file():
           f = open('logs/pyinotify.pid')
           pid_read = f.read()
           f.close

           # We say it's up
           print('Process running with PID : ', pid_read)

        # Telling is not running
        else:
            print('Process is not running')

    elif oInput == "exit" or oInput == "Exit" :
        exit()
