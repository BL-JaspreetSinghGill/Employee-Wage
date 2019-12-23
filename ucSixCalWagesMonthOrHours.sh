#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 6 -> CALCULATE WAGES TILL A CONDITION OF TOTAL WORKING HOURS OR DAYS IS REACHED.

IS_PART_TIME=1;
IS_FULL_TIME=2;
EMPLOYEE_HOUR_RATE=20;
EMPLOYEE_PER_DAY_SHIFT=8;
EMPLOYEE_TOTAL_WORKING_DAYS=20;
EMPLOYEE_TOTAL_HOURS=$(($EMPLOYEE_TOTAL_WORKING_DAYS*$EMPLOYEE_PER_DAY_SHIFT));

salary=0;
empWorkingDays=0;
empWorkingHours=0;

while [[ $empWorkingDays -ne $EMPLOYEE_TOTAL_WORKING_DAYS && $empWorkingHours -ne $EMPLOYEE_TOTAL_HOURS ]]
do
	randomValue=$(( RANDOM%3 ));

	case $randomValue in
				$IS_PART_TIME)
					echo "EMPLOYEE IS PRESENT : PART TIME";
					employeeWorkingHours=4;
					(( empWorkingDays++ ));
					;;
				$IS_FULL_TIME)
					echo "EMPLOYEE IS PRESENT : FULL TIME";
					employeeWorkingHours=8;
					(( empWorkingDays++ ));
					;;
				*)
					echo "EMPLOYEE IS ABSENT";
					employeeWorkingHours=0;
					;;
	esac;

	empWorkingHours=$(( $empWorkingHours+$employeeWorkingHours ));
	salary=$(( $salary+$(( $employeeWorkingHours*$EMPLOYEE_HOUR_RATE )) ));
done;

echo "EMPLOYEE WORKING HOURS: " $empWorkingHours;
echo "EMPLOYEE WORKING DAYS: " $empWorkingDays;
echo "SALARY : " $salary;
