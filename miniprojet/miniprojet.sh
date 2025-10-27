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

	# HTTP
	CODE=$(curl -s -o/dev/null -w "%{http_code}" "$line")

	# Encoding
	ENCODING=$(curl -i -s -L "$line" | grep -i "charset")
	
	# Nombre de mots
	WORDS=$(curl -s -L "$line" | wc -w)
	
	echo -e "${N}\t${line}\t${CODE}\t${ENCODING}\t${WORD}" >> tableaux/tableau-fr.tsv

done < "$FICHIER_URLS"

