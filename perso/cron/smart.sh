#!/bin/sh
# Ce script a pour but de vérifier l'état du RAID SOFT 
# Si l'état du RAID est détecté comme deffectueux 
# Une notification par email peut alors être envoyée.
# Dev par Corentin 

# Il faut tout d'abord ajouter votre adresse mail dans la varible email 
email="ton@mail"


# Nous allons ensuite vérifier l'état du RAID :
cat /proc/mdstat

# Puis il faut regarder si [U_] ou [_U] sont renvoyés en retour
# de commande

if ! egrep "\[.*_.*\]" /proc/mdstat > /dev/null
then exit
fi

# Si un problème est detecté alors il faut avertir par email :

mail -s "Attention, RAID deffectueux sur `hostname`" "$email" << EOF

`cat /proc/mdstat`

EOF

➜  cdiez cat monito/smart.sh 
#!/bin/sh
# Ce script a pour but de vérifier l'état du RAID SOFT 
#  
# Une notification par email peut alors être envoyée.
# Dev par Corentin 

# Il faut tout d'abord ajouter votre adresse mail dans la varible email 
email="sysadmin@metal-cunt.com"

# Les résultats seront envoyés par mail :

mail -s "Smart disque sur  `hostname`" "$email" << EOF


SMART SDA


`/usr/sbin/smartctl -a /dev/sda`


SMART SDB


`/usr/sbin/smartctl -a /dev/sdb`


EOF
