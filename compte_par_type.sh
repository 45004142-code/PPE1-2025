DATADIR=$1
ANNEE=$2
TYPE=$3

cat "$DATADIR/$ANNEE"/*.ann | grep "$TYPE" | wc -l

