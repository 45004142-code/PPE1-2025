#!/usr/bin/bash

if [ -f output.txt]
then
	# le fichier existe
	echo "le fichier existe deja"
	exit
else
	# ou pas
fi




echo "salut" > output.txt
ls >> output.txt 

