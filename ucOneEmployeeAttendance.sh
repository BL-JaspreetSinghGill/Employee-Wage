#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 1 -> TO CHECK WHETHER THE EMPLOYEE IS PRESENT OR NOT

isPresent=1;
randomValue=$(( RANDOM%2 ));

if [ $randomValue -eq $isPresent ]
then
	echo "EMPLOYEE IS PRESENT";
else
	echo "EMPLOYEE IS ABSENT";
fi;
