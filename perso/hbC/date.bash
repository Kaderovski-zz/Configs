#!/bin/bash
#
# Dev par Cdiez50

recuperation_date=$(cat $1 | grep -E "[0-9]{2}/[0-9]{2}/[0-9]{4}" > date.txt)
listdate=$(cat date.txt)
cndt=0
A=1

echo -e "\n"

while [ $A -ne 10 ]
	do

	read -r -p "Voulez-vous faire une recherche par date [y/N] : " REPLY

	    # Vérification de l'entrée utilisateur
	    # 
	    # Si choix positif
					
	    if [[ "$REPLY" == "y" || "$REPLY" == "Y" || "$REPLY" == "yes" || "$REPLY" == "Yes" || "$REPLY" == "YES" ]]
				
			then	

			echo -e "\n"
			read -r -p "Quelle date voulez-vous voir (entrez dd/mm) : " REPLY
			sleep 1
			cat date.txt | grep -E "$REPLY" 
			echo -e "\n"

			read -r -p "Voulez-vous effectuer une recherche personnalisé dans le résultat ou quitter l'application ? [y/N] : " REPONSE


					# Vérification de l'entrée utilisateur
					# 
					# Si choix positif

					while true; do
										
						if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										
							then

							# On demande le mot 
							echo -e "\n"
							read -r -p "Veuillez insérer le mot à trouver dans le fichier : " MOT

							# On définit le nombre d'occurrences
							total=$(cat $1 | grep -io "$MOT" | wc -l)
							# On affiche 
							echo -e "\nRésultat : \n"
							echo -e "$MOT : $total\n"


							# Si le retour est négatif
							if [ "$total" ==  "$cndt" ]
								then

								# On indique la sortie 
								read -r -p  "Rien n'a été trouvé. Recommencer ? [y/N] : " REPONSE
								if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
									then
										continue 
									else
										#echo -e "\nVous quittez le script\n"
										#sleep 1
									    #exit 0
									    A=$(($A+10))
									    break
								fi

							fi

							# On propose de montrer le détail 
							echo -e "\n"
							read -r -p "Voulez-vous le détail des logs ? [y/N] : " REPONSE
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
												# On retourne au début
												A=$(($A+10))
									    		break
											fi
						fi

						else
						# On retourne au début
						A=$(($A+10))
						break
						fi

					done

			else
				read -r -p "Voulez-vous effectuer une recherche personnalisé ou quitter l'application ? [y/N] : " REPONSE

					# Vérification de l'entrée utilisateur
					# 
					# Si choix positif

						while true; do
										
							if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										
								then

								# On demande le mot 
								echo -e "\n"
								read -r -p "Veuillez insérer le mot à trouver dans le fichier : " MOT

								# On définit le nombre d'occurrences
								total=$(cat $1 | grep -io "$MOT" | wc -l)
								# On affiche 
								echo -e "\nRésultat : \n"
								echo -e "$MOT : $total\n"


								# Si le retour est négatif
								if [ "$total" ==  "$cndt" ]
									then

									# On indique la sortie 
									read -r -p  "Rien n'a été trouvé. Recommencer ? [y/N] : " REPONSE
									if [[ "$REPONSE" == "y" || "$REPONSE" == "Y" || "$REPONSE" == "yes" || "$REPONSE" == "Yes" || "$REPONSE" == "YES" ]]
										then
											continue 
										else
											echo -e "\nVous quittez le script\n"
											sleep 1
											exit 0
									fi

								fi

								# On propose de montrer le détail 
								echo -e "\n"
								read -r -p "Voulez-vous le détail des logs ? [y/N] : " REPONSE

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
			done
	else 

	echo aurevoir 

	fi

done
