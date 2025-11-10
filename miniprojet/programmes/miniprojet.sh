#!/bin/bash

if [ $# -ne 1 ]; then
    echo "ce programme demande un argument"
    exit 1
fi

FICHIER_URLS=$1
N=0

mkdir -p tableaux

# HTML 테이블 헤더
echo "<table border=\"1\">" > tableaux/tableau-fr.html
echo "<tr><th>N°</th><th>URL</th><th>HTTP Code</th><th>Encoding</th><th>Word Count</th></tr>" >> tableaux/tableau-fr.html

while read -r line; do
    N=$((N+1))

    # HTTP code
    CODE=$(curl -s -o /dev/null -w "%{http_code}" "$line")

    # Encoding
    ENCODING=$(curl -s -I "$line" | grep -i "Content-Type" | awk -F'charset=' '{print $2}' | tr -d '\r')
    [ -z "$ENCODING" ] && ENCODING="NA"

    # Nombre de mots (HTML 태그 제거)
    WORDS=$(curl -s -L "$line" | sed 's/<[^>]*>//g' | wc -w)

    # HTML 테이블 row 추가
    echo "<tr><td>${N}</td><td>${line}</td><td>${CODE}</td><td>${ENCODING}</td><td>${WORDS}</td></tr>" >> tableaux/tableau-fr.html

done < "$FICHIER_URLS"

echo "</table>" >> tableaux/tableau-fr.html
