#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 2 -> TO CALCULATE EMPLOYEE DAILY WAGE.

isPresent=1;
employeeHourRate=20;
randomValue=$(( RANDOM%2 ));

if [ $randomValue -eq $isPresent ]
then
   echo "EMPLOYEE IS PRESENT";
	employeeWorkingHours=8;
	salary=$(( $employeeWorkingHours*$employeeHourRate ));
else
   echo "EMPLOYEE IS ABSENT";
	salary=0;
fi;

echo "SALARY : "$salary;
