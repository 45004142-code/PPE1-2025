if [ $# -ne 1 ];
then
	echo "ce programme demande un argument"
	exit 1
fi

FICHIER_URLS=$1
N=0

while read -r line;
do
	N=$(expr $N + 1)

	# URL
	if [[ "$line" != https://* ]]; 
	then
		line="https://$line"
	fi

	echo -e "${N}\t${line}"

	# HTTP
	status=$(curl -s -o/dev/null -w ${http_code}" "$line:)

	if [[ "$status" = "200" ]]; then
		echo "HTTP OK"
	else
		echo "Erreur HTTP:$status"
		continue
	fi

	# Encoding
	charset=$(curl -i -s "$line" | grep -i "charset")
	
	# Nombre de mots
	word_count=$(curl -s "$line" | wc -w)
	echo "Nombre de mots dans la page : $word_count"
	

done < "$FICHIER_URLS"

