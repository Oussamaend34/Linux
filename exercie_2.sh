#!/bin/bash

# Demander à l'utilisateur de saisir une note
echo "Veuillez saisir votre note :"
read note

# Vérifier la note et afficher le message approprié
if ((note >= 16 && note <= 20)); then
    echo "Très bien"
elif ((note >= 14 && note < 16)); then
    echo "Bien"
elif ((note >= 12 && note < 14)); then
    echo "Assez bien"
elif ((note >= 10 && note < 12)); then
    echo "Moyen"
elif ((note < 10)); then
    echo "Insuffisant"
else
    echo "Note invalide"
fi
