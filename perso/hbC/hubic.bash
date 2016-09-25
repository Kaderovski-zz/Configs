#!/bin/bash
#
# Dev par Cdiez50
#
## Les retours sont Ã  implÃ©menter au fur et Ã  mesure
## des problÃ©matiques recherchÃ©es
#
# 


#
# VÃ©rification de la prÃ©sence du paramÃ¨tre

if [[ $# -eq 0 ]] ; then
    echo -e "\n"
    echo -e 'Erreur ! \nVous devez indiquer en paramÃ¨tre votre fichier log ou son path' 
    echo -e '\nExemple : bash script.bash mon_fic\n'
    exit 0
fi

#
# DÃ©finition des catch
#

timeout=$(cat $1 | grep -io "timeout" | wc -l)
warning=$(cat $1 | grep -io "warning" | wc -l)
alert=$(cat $1 | grep -io "alert" | wc -l)
error=$(cat $1 | grep -io "error" | wc -l)

#
# Condition de recherche
# Si supÃ©rieur = proposition d'affichage logs

cndt=0

clear

#  Si $cndc != 0
echo -e "\n"

echo "**** Analyse des logs ****"
sleep 1 


echo -e "\n"

#Affichage du nombre d'occurences trouvÃ©es
echo "Timeout : $timeout"
echo "Warning : $warning"
echo "Alert : $alert"
echo "Error : $error"

echo -e "\n"

#
#
## On vÃ©rifie si des occurrences sont prÃ©sentes
#
#

result=$(($timeout+$warning+$alert+$error))

if [[ "$result" != 0 ]]; 
	then

		#On lance l'anayse
		read -r -p "Voulez-vous le dÃ©tail des logs ? [y/N] : " REPLY

		    # VÃ©rification de l'entrÃ©e utilisateur
		    # 
		    # Si choix positif
				
		    if [[ "$REPLY" == "y" || "$REPLY" == "Y" || "$REPLY" == "yes" || "$REPLY" == "Yes" || "$REPLY" == "YES" ]]
				
				then	

					echo -e "\n"
					echo -e "\n"

					sleep 1
					
					# Annonce et affichage
					echo "**** Plus d'informations ****"

					echo -e "\n"

					if [ "$timeout" !=  "$cndt" ]
						then
							#On affiche les retours
							echo -e "\n****Logs Timeout****"
							sleep 1
							cat $1 | grep -i --color "timeout"
							echo -e "\n"
					fi

					if [ "$warning" !=  "$cndt" ]
						then
							#On affiche les retours
							echo -e "\n****Logs Warning****"
							sleep 1
							cat $1 | grep -i --color "warning"
							echo -e "\n"
					fi

					if [ "$alert" !=  "$cndt" ]
						then
							#On affiche les retours
							echo -e "\n****Logs Alerte****"
							sleep 1
							cat $1 | grep -i --color "alert"
							echo -e "\n"
					fi

					if [ "$error" !=  "$cndt" ]
						then
							#On affiche les retours
							echo -e "\n****Logs Error****"
							sleep 1
							cat $1 | grep -i --color "error"
							echo -e "\n"
					fi 

					read -r -p "Voulez-vous effectuer une recherche personnalisÃ© ou quitter l'application ? [y/N] : " REPONSE

					# VÃ©rification de l'entrÃ©e utilisateur
					# 
					# Si choix positif

					while true; do
										
						if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										
							then

							# On demande le mot 
							echo -e "\n"
							read -r -p "Veuillez insÃ©rer le mot Ã  trouver dans le fichier : " MOT

							# On dÃ©finit le nombre d'occurrences
							total=$(cat $1 | grep -io "$MOT" | wc -l)
							#Â On affiche 
							echo -e "\nRÃ©sultat : \n"
							echo -e "$MOT : $total\n"


							#Â Si le retour est nÃ©gatif
							if [ "$total" ==  "$cndt" ]
								then

								# On indique la sortie 
								read -r -p  "Rien n'a Ã©tÃ© trouvÃ©. RecommencerÂ ? [y/N] : " REPONSE
								if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
									then
										continue 
									else
										echo -e "\nVous quittez le script\n"
										sleep 1
										exit 0
								fi

							fi

							# On propose de montrer le dÃ©tail 
							echo -e "\n"
							read -r -p "Voulez-vous le dÃ©tail des logs ? [y/N] : " REPONSE
								#Si validation par l'utilisateur 
								if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
									then

										#On affiche les retours
										echo -e "\n****Logs****\n"
										sleep 1
										cat $1 | grep -i --color "$MOT"  
										echo -e "\n"

										# On demande de rejouer 
										read -r -p "Voulez-vous continuer ? [y/N]" REPONSE
											if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
												then
													continue
											else
												echo -e "\nVous quittez le script\n"
												sleep 1
												exit 0
											fi
						fi

						else
						# On quitte
						echo -e "\nVous quittez le script\n"
						sleep 1
						exit 0
						fi

					done

			else
				read -r -p "Voulez-vous effectuer une recherche personnalisÃ© ou quitter l'application ? [y/N] : " REPONSE

					# VÃ©rification de l'entrÃ©e utilisateur
					# 
					# Si choix positif

						while true; do
										
							if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										
								then

								# On demande le mot 
								echo -e "\n"
								read -r -p "Veuillez insÃ©rer le mot Ã  trouver dans le fichier : " MOT

								# On dÃ©finit le nombre d'occurrences
								total=$(cat $1 | grep -io "$MOT" | wc -l)
								#Â On affiche 
								echo -e "\nRÃ©sultat : \n"
								echo -e "$MOT : $total\n"


								#Â Si le retour est nÃ©gatif
								if [ "$total" ==  "$cndt" ]
									then

									# On indique la sortie 
									read -r -p  "Rien n'a Ã©tÃ© trouvÃ©. RecommencerÂ ? [y/N] : " REPONSE
									if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										then
											continue 
										else
											echo -e "\nVous quittez le script\n"
											sleep 1
											exit 0
									fi

								fi

								# On propose de montrer le dÃ©tail 
								echo -e "\n"
								read -r -p "Voulez-vous le dÃ©tail des logs ? [y/N] : " REPONSE

									#Si validation par l'utilisateur 
									if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										then

											#On affiche les retours
											echo -e "\n****Logs****\n"
											sleep 1
											cat $1 | grep -i --color "$MOT" 
											
											echo -e "\n"

												# On demande de rejouer 
												read -r -p "Voulez-vous continuer ? [y/N]" REPONSE
												if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
													then
														continue
												else
													echo -e "\nVous quittez le script\n"
													sleep 1
													exit 0
												fi

							fi

							else

							# On quitte
							echo -e "\nVous quittez le script\n"
							sleep 1
							exit 0
							fi

						done
			fi
else 
# Le retour est Ã  0 
# On indique
echo -e "Pas d'occurences trouvÃ©es dans le fichier. \n"
sleep 1

# On propose une recherche personnelle

read -r -p "Voulez-vous effectuer une recherche personnalisÃ© ou quitter l'application ? [y/N] : " REPONSE

# VÃ©rification de l'entrÃ©e utilisateur
# 
# Si choix positif

	while true; do
					
		if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
					
			then

			# On demande le mot 
			echo -e "\n"
			read -r -p "Veuillez insÃ©rer le mot Ã  trouver dans le fichier : " MOT

			# On dÃ©finit le nombre d'occurrences
			total=$(cat $1 | grep -io "$MOT" | wc -l)
			#Â On affiche 
			echo -e "\nRÃ©sultat : \n"
			echo -e "$MOT : $total\n"


			#Â Si le retour est nÃ©gatif
			if [ "$total" ==  "$cndt" ]
				then

				# On indique la sortie 
				read -r -p  "Rien n'a Ã©tÃ© trouvÃ©. RecommencerÂ ? [y/N] : " REPONSE
				if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
					then
						continue 
					else
						echo -e "\nVous quittez le script\n"
						sleep 1
						exit 0
				fi

			fi

			# On propose de montrer le dÃ©tail 
			echo -e "\n"
			echo -e "*** Logs de votre recherche ***\n"

						#On affiche les retours
						sleep 1
						cat $1 | grep -i --color "$MOT"
						echo -e "\n"

							# On demande de rejouer 
							read -r -p "Voulez-vous continuer ? [y/N]" REPONSE
							if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
								then
									continue
							else
								echo -e "\nVous quittez le script\n"
								sleep 1
								exit 0
							fi

		else
		# On quitte
		echo -e "\nVous quittez le script\n"
		sleep 1
		
		fi

	done

fi
