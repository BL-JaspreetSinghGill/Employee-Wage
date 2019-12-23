#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 3 -> PART TIME EMPLOYEE WAGE.

isPartTime=1;
isFullTime=2;
employeeHourRate=20;
randomValue=$(( RANDOM%3 ));

if [ $randomValue -eq $isPartTime ]
then
	echo "EMPLOYEE IS PRESENT : PART TIME";
	employeeWorkingHours=4;
elif [ $randomValue -eq $isFullTime ]
then
	echo "EMPLOYEE IS PRESENT : FULL TIME";
	employeeWorkingHours=8;
else
	echo "EMPLOYEE IS ABSENT";
	employeeWorkingHours=0;
fi;

salary=$(( $employeeWorkingHours*$employeeHourRate ));
echo "SALARY : "$salary;
