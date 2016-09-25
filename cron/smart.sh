#!/bin/sh
# Here is a simple script  
# It will send your smart states by mail
# Dev by Cdiez50 

# First, put your mail adresse here
email="YOUR@MAIL"


# Then call results

mail -s "Smart disks of `hostname`" "$email" << EOF


SMART SDA


`/usr/sbin/smartctl -a /dev/sda`


SMART SDB


`/usr/sbin/smartctl -a /dev/sdb`


EOF

# Note that if the output is too long you can use the argument -H to have PASSED status :
# here is an exemple output :
# SMART overall-health self-assessment test result: PASSED
