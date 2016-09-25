
#!/bin/sh
#This script will check RAID states
# Dev by Cdiez50

# First put your mail here
email="YOUR@MAIL"


# Then Check raid states :
cat /proc/mdstat

# Looking for [U_] or [_U] 

if ! egrep "\[.*_.*\]" /proc/mdstat > /dev/null
then exit
fi

# If found send mail

mail -s "WARNING, RAID not synchro on `hostname`" "$email" << EOF


`cat /proc/mdstat`

EOF
