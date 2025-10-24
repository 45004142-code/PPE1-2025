# Journal de bord du projet encadré

## 05/10/2025 Aujourd'hui, j'ai crée le journal de bord sur github :D

## 14/10/2025 J'essaie de résoudre l'Exercice 2 (Arguments des scripts), mais j'ai rencontré plusieurs problèmes...

Problème 1 : cat : ann : est un répertoire  
Pour résoudre ce problème, j’ai utilisé grep avec l’option -r (récursive).  

Problème 2 : Quand j’exécute le script, il affiche « no such file or directory ».  
J’ai ajouté ./ devant ann pour pointer correctement vers le dossier ann dans le répertoire courant (PPE1-2025).

## 24/10/2025 Fin de l'Exercice 2
#!/usr/bin/bash 
if [ $# -ne 1 ] 
then 
  echo "ce programme demande un argument" 
  exit 
fi 

Si le nombre d'arguments ($#) n'est pas égal à 1, le programme affiche "ce programme demande un argument" et s’arrête. 

FICHIER_URLS=$1 
OK=0 
NOK=0

Le premier arugment ($1) est enregistré dans la variable “FICHIER_URLS”.

while read -r LINE
do 
  if [[ $LINE =~ ^https?:// ]] 
  then
    OK=$(expr $OK + 1) 
  else 
    NOK=$(expr $NOK + 1) 
  fi 
done < $FICHIER_URLS 

Le programme lit chaque ligne du fichier (read -r LINE).
Si la ligne correspond à la condition du if, on ajoute 1 à la variable OK.
Sinon, on ajoute 1 à la variable NOK.

echo "$OK URLs et $NOK lignes douteuses" 

Pour finir, le programme affiche le résultat avec echo.

+ Expression régulière 
if [[ $LINE =~ ^https?:// ]] 
 Cette condition signifie si la variable $LINE comment par http:// ou https://, alors la condition est :D

^ : Début de la ligne
https? : 's' est optionnel
 => http et https

 ## 24/10/2025 Miniprojet (1)

• Bien séparer les valeurs par des tabulations
J'avais d'abord écrit mon script comme suit :
echo "${N}\t${line}"

Mais la sortie n'était pas celle à laquelle je m'attendais...
Le résultat était quelque chose comme 1\thttps://fr.wikipedia.org/wiki/Robot, ce qui signifie que \t était considéré comme une chaîne de caractères.

Pour résoudre ce problème, j'ai ajouté l'option -e (pour l'escaping), c'est-à-dire echo -e "${N}\t${line}".
Maintenant, le problème est résolu ! 


 



