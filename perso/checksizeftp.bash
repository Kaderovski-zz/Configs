#!bin/bash
# 
# Dev : F00b4rch
# Date: Dec 2016
################

# On récupère la valeur de la taille du backup
a=$(du -sh /mnt/backup_ftp | awk '{print $1}' | tr -d 'G')
# On indique la limite
b="88"
email="votre_mail_ici"

	# Si le retour est sup à 88
	if [ "$a" -ge "$b" ]  
		
	then	
		# On envoit un mail d'alerte :
		mail -s "[ALERTE] ESPACE FTP" "$email" <<EOF 
		$(echo 'ALERTE il y a '$a'G despace occupe sur le backup storage!')
		$(echo -e '\n')
		$(ls -alh /mnt/backup_ftp/dump/*gz | cut -d ' ' -f 5- | column -t)
EOF
	else
		# On monitore juste
                mail -s "[INFO] ESPACE FTP" "$email" <<EEOF 
                $(echo 'Il y a '$a'G despace occupe sur le backup storage.')
		$(echo -e '\n')
		$(ls -alh /mnt/backup_ftp/dump/*gz | cut -d ' ' -f 5- | column -t)
EEOF

fi
