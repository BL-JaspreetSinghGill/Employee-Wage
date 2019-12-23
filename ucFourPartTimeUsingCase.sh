#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 4 -> MODIFIED THE PART TIME EMPLOYEE WAGE FUNCTIONALITY USING CASE.

isPartTime=1;
isFullTime=2;
employeeHourRate=20;
randomValue=$(( RANDOM%3 ));

case $randomValue in
			$isPartTime)
				echo "EMPLOYEE IS PRESENT : PART TIME";
				employeeWorkingHours=4;
				;;
			$isFullTime)
				echo "EMPLOYEE IS PRESENT : FULL TIME";
				employeeWorkingHours=8;
				;;
			*)
				echo "EMPLOYEE IS ABSENT";
				employeeWorkingHours=0;
				;;
esac;

salary=$(( $employeeWorkingHours*$employeeHourRate ));
echo "SALARY : "$salary;
