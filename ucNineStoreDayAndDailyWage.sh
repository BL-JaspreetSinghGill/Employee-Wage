#!/bin/bash -x

#EMPLOYEE WAGE : USE CASE 9 -> STORED THE DAY AND DAILY WAGE.

#CONSTANTS
IS_PART_TIME=1;
IS_FULL_TIME=2;
EMPLOYEE_HOUR_RATE=20;
EMPLOYEE_PER_DAY_SHIFT=8;
EMPLOYEE_TOTAL_WORKING_DAYS=20;
EMPLOYEE_TOTAL_HOURS=$(($EMPLOYEE_TOTAL_WORKING_DAYS*$EMPLOYEE_PER_DAY_SHIFT));

#VARIABLES
salary=0;
empWorkingDays=0;
empWorkingHours=0;

declare -A wageDictionary;

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

calculateHours () {
	employeeWorkingHours=$1;
	employeeHours=$2;
	operation=$3;

	echo $(( $empWorkingHours $operation $employeeHours ));
}

calculateWage () {
	employeeWorkingHours=$1;

	echo $(( $employeeWorkingHours*$EMPLOYEE_HOUR_RATE ));
}

storeWageInDictionary () {
	eachDayWage=$1;

	wageDictionary[$empWorkingDays]=$eachDayWage;
}

calculateSalary () {
	dailyWage=$1;
	operation=$2;

	salary=$(( $salary $operation $dailyWage ));
}

employeeWageMain () {
	while [[ $empWorkingDays -lt $EMPLOYEE_TOTAL_WORKING_DAYS && $empWorkingHours -lt $EMPLOYEE_TOTAL_HOURS ]]
	do
		employeeWorkingHours=$(getWorkingHours $(( RANDOM%3 )));
		if [ $employeeWorkingHours -ne 0 ]
		then
			(( empWorkingDays++ ));
			empWorkingHours=$(calculateHours $employeeWorkingHours $employeeWorkingHours +);
			dailyWage=$(calculateWage $employeeWorkingHours);
			storeWageInDictionary $dailyWage;
			calculateSalary $dailyWage +;
		fi;
	done;

	if [ $empWorkingHours -gt $EMPLOYEE_TOTAL_HOURS ]
	then
		extraWorkingHours=$(calculateHours $employeeWorkingHours $EMPLOYEE_TOTAL_HOURS -);
		empWorkingHours=$(calculateHours $employeeWorkingHours $extraWorkingHours -);
		dailyWage=$(calculateWage $extraWorkingHours);
		calculateSalary $dailyWage -;
	fi;
}

employeeWageMain;

echo "EMPLOYEE WORKING HOURS: " $empWorkingHours;
echo "EMPLOYEE WORKING DAYS: " $empWorkingDays;
echo "SALARY : " $salary;
echo "EMPLOYEE WAGE KEYS: " ${!wageDictionary[@]}
echo "EACH DAY EMPLOYEE WAGE : " ${wageDictionary[@]};
