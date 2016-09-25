
#!/bin/bash
# Here is a little script if you want to have 
# everyday a notification from scan work !

# adding the filelog path :
LOGFILE="/var/log/clamav/clamav-$(date +'%Y-%m-%d').log";

# adding title message
EMAIL_MSG="XXXXXXXXXXXX";

# adding the from 
EMAIL_FROM="XXXX@XXXX";

# adding the dest 
EMAIL_TO="XXXX@XXXX";

# dir
DIRTOSCAN="/var/www";

for S in ${DIRTOSCAN}; do
 DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);

 echo "Starting a daily scan of "$S" directory.
 Amount of data to be scanned is "$DIRSIZE".";

 clamscan -ri "$S" >> "$LOGFILE";

 # get the value of "Infected lines"
 MALWARE=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);

 # if the value is not equal to zero, send an email with the log file attached
 if [ "$MALWARE" -ne "0" ];then
 # using heirloom-mailx below
 echo "$EMAIL_MSG"|mail -a "$LOGFILE" -s "Malware on system !!!!" -r "$EMAIL_FROM" "$EMAIL_TO";
 fi 
 echo "$EMAIL_MSG"|mail -a "$LOGFILE" -s "Scan OK" -r "$EMAIL_FROM" "$EMAIL_TO";
done

exit 0
