#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 7 -> REFACTORING THE CODE AND WRITING A FUNCTION TO GET WORKING HOURS.

IS_PART_TIME=1;
IS_FULL_TIME=2;
EMPLOYEE_HOUR_RATE=20;
EMPLOYEE_PER_DAY_SHIFT=8;
EMPLOYEE_TOTAL_WORKING_DAYS=20;
EMPLOYEE_TOTAL_HOURS=$(($EMPLOYEE_TOTAL_WORKING_DAYS*$EMPLOYEE_PER_DAY_SHIFT));

salary=0;
empWorkingDays=0;
empWorkingHours=0;

getWorkingHours () {
	randomValue=$1;

	case $randomValue in
				$IS_PART_TIME)
					employeeWorkingHours=4;
					;;
				$IS_FULL_TIME)
					employeeWorkingHours=8;
					;;
				*)
					employeeWorkingHours=0;
					;;
	esac;

	echo $employeeWorkingHours;
}

while [[ $empWorkingDays -lt $EMPLOYEE_TOTAL_WORKING_DAYS && $empWorkingHours -lt $EMPLOYEE_TOTAL_HOURS ]]
do
	employeeWorkingHours=$(getWorkingHours $(( RANDOM%3 )));
	if [ $employeeWorkingHours -ne 0 ]
	then
		(( empWorkingDays++ ));
	fi;

	empWorkingHours=$(( $empWorkingHours+$employeeWorkingHours ));
	salary=$(( $salary+$(( $employeeWorkingHours*$EMPLOYEE_HOUR_RATE )) ));
done;

if [ $empWorkingHours -gt $EMPLOYEE_TOTAL_HOURS ]
then
	empWorkingHours=$(($empWorkingHours-$EMPLOYEE_TOTAL_HOURS));
	salary=$(( $salary-$(( $empWorkingHours*$EMPLOYEE_HOUR_RATE )) ));
fi;

echo "EMPLOYEE WORKING HOURS: " $empWorkingHours;
echo "EMPLOYEE WORKING DAYS: " $empWorkingDays;
echo "SALARY : " $salary;
