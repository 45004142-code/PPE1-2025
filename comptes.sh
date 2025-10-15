#!/usr/bin/bash

echo "argument donnée : $1"
CHEMIN=$1

echo "Nombre de lieux en 2016:"
find "$CHEMIN/2016" -type f -name "*.ann" -exec cat {} + | grep Location | wc -l

echo "Nombre de lieux en 2017:"
find "$CHEMIN/2017" -type f -name "*.ann" -exec cat {} + | grep Location | wc -l

echo "Nombre de lieux en 2018:"
find "$CHEMIN/2018" -type f -name "*.ann" -exec cat {} + | grep Location | wc -l
