#!/bin/bash
#
# Dev par Cdiez50

tput clear
tput cup 3 15
 

tput setaf 3
echo -e "Dev par Corentin :-)"

tput sgr0
 
tput cup 5 17

tput rev
echo "A P P L I C A T I O N --- H U B I C"
tput sgr0
 
tput cup 7 15
echo "1. Vérification générale des logs (mots clés + recherche personnalisées)"
 
tput cup 8 15
echo "2. Vérification par date (date + recherche personnalisées)"
 

# Indication du fichier log
echo -e "\n"
tput bold
read -e -p "		Indiquez le path du fichier log (ex : /Download/application.log) : " log
 

tput bold

echo -e "\n"
read -p "		Entrez votre choix [1-2] " choice
 
if [[ "$choice" == "1" ]] ; then 
	bash hubic.bash $log

elif [[ "$choice" == "2" ]]; then
	bash date.bash $log

else 
	echo "Vous n'avez pas indiqué de valeurs correctes"

fi
