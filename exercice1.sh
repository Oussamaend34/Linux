#!/bin/bash
while true
do
echo -e "1_JAVA?\n2_C++?\n3_PASCAL?\n0_Quitter\nReponse ?"
read var 
case $var in
	1)echo "vous avez choisi JAVA!";;
	2)echo "vous avez choisi C++!";;
	3)echo "vous avez choisi PASCAL!";;
	0)break;;
esac
done
