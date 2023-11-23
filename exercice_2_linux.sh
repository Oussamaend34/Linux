#!/bin/bash
echo -n "Entrez la note : "
read note
if [ [ $note -gt 0 ] && [ $note -lt 10 ] ] || [ $note -eq 10 ] then
	echo "insuffisant"
elif [ [ $note -gt 10 ] && [ $note -lt 12 ] ] || [ $note -eq 12 ] then
	echo "moyen"
elif [ [ $note -gt 12 ] && [ $note -lt 14 ] ] || [ $note -eq 14 ] then
	echo "assez bien"
elif [ [ $note -gt 14 ] && [ $note -lt 16 ] ] || [ $note -eq 16 ] then
        echo "assez bien"
elif [ [ $note -gt 16 ] && [ $note -lt 20 ] ] || [ $note -eq 20 ] then
        echo "assez bien"
else 
	echo "note n'est pas valide"
