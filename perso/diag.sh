#!/bin/sh
# Ce script a pour but de vérifier si le serveur
# répond au ping et fait un scan de ports sur ce 
# dernier
# Dev par Corentin


echo -e "\n\n\n"

read -p "Host/IP : " ip


echo -e '\n# OUTPUT=$(host $ip | awk '{print $4}') ; echo "IP : ${OUTPUT}" ; ping $ip -c 5 -i 0.2 ; nmap $ip -Pn \n' 

OUTPUT=$(host $ip | awk '{print $4}')
echo "IP : ${OUTPUT}" 
echo -e '\n'
ping -i 0.2 -c 5 $ip
#echo -e '\n'
nmap $ip -Pn 


echo -e '\n'

exit
