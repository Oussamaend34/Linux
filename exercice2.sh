#!/bin/bash
echo -n "Entrez la note : "
read note
if [ $note -ge 0 ] && [ $note -lt 10 ]; then
	echo "insuffisant"
elif [ $note -lt 12 ]; then
	echo "moyen"
elif [ $note -lt 14 ]; then
	echo "assez bien"
elif [ $note -lt 16 ] ; then
        echo "bien"
elif [ $note -le 20 ] ; then
        echo "très bien"
else 
	echo "note n'est pas valide"
fi