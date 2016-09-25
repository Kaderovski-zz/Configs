
#!/bin/sh
# Perso
# Dev par Corentin

Ndd=$1
max=20

if [ $Ndd = 42 ]

  then
  echo "Its Life dude, don't panic !"

  elif [ $Ndd -ge $max  ]

  then
  echo "Tu ajoutes 1 mois"

  else
  result=$(($Ndd * 5))
  result2=$(($result * 30))

  result3=$(($result2 / 100))
  echo "Tu peux ajouter "$result3" jours"
fi

exit
