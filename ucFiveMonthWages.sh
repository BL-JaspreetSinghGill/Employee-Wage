#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 5 -> ADDED THE MONTHLY WAGES FUNCTIONALITY.

isPartTime=1;
isFullTime=2;
employeeHourRate=20;
workingDays=20;
salary=0;

for (( day=1; day<=$workingDays; day++ ))
do
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

	salary=$(( $salary+$(( $employeeWorkingHours*$employeeHourRate )) ));
done;

echo "SALARY : "$salary;
