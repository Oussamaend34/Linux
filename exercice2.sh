#!/bin/bash
echo -n "Entrez la note : "
read note
if [ $note -ge 0 ] && [ $note -lt 10 ]; then
	echo "insuffisant"
elif [ $note -ge 10 ] && [ $note -lt 12 ]; then
	echo "moyen"
elif [ $note -ge 12 ] && [ $note -lt 14 ]; then
	echo "assez bien"
elif [ $note -ge 14 ] && [ $note -lt 16 ] ; then
        echo "bien"
elif [ $note -ge 16 ] && [ $note -le 20 ] ; then
        echo "très bien"
else 
	echo "note n'est pas valide"
fi