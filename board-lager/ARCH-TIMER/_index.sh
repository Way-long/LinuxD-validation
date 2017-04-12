#!/bin/bash
# this program is run in /root. Please login /root with 'su' command

LOGS="$(dirname $0)/logs"
mkdir -p "$LOGS"
chmod 777 "$LOGS"

# arguments
# - no specific test case: test all
# - 1 argument: specifix test case or arrange of test case in form [start:end]
# - list of test case


# constant
CONFIG_FILE=$(dirname $0)/../config.sh
PRINT_BEGIN=$(dirname $0)/../common/test_begin.sh
PRINT_END=$(dirname $0)/../common/test_end.sh

# config
source "$CONFIG_FILE"

prepare(){
	if [[ "$ENV" == "board" ]]; then
		$(dirname $0)/_prepare.sh
	else
		path=`getRunPath "_prepare.sh"`
		ssh $SSH_AUTHEN "$path"
	fi
}
# declaration
doTest(){
	# arguments
	file_name=$1
	# todo
	TEST_NUMBER=`getTestNumber $file_name`
	#define log file
	log_file="$LOGS/${file_name%.sh}"
	# caller="$(ps -o command= -p "$PPID" | awk '{print $2}')"
	{
		$PRINT_BEGIN "NUMBER $TEST_NUMBER                                               $(date)"
		if [[ "$ENV" == "board" ]]; then
			if [[ "$file_name" == *"-.sh" ]]; then
				echo "untested because it's on board environment. please do this test on PC"
			else
				$(dirname $0)/$file_name
			fi
		else
			if [[ "$file_name" == *"-.sh" ]]; then
				$(dirname $0)/$file_name
			else
				path=`getRunPath "$file_name"`
				ssh $SSH_AUTHEN "$path"
			fi
		fi
		$PRINT_END "End of Number $TEST_NUMBER"
	} | tee "$log_file"
	chmod 666 "$log_file"
	# $PRINT_BEGIN "NUMBER $TEST_NUMBER                                               $(date)"
	# $(dirname $0)/$file_name
	# $PRINT_END "End of Number $TEST_NUMBER"
}

getRunPath(){
	absolutePath=`readlink -m $0`
	absolutePath=${absolutePath%/*}
	path=${absolutePath#$SSH_ROOT_PATH}/$1
	echo "$path"
}

getTestNumber(){
	#argument
	file_name=$1
	# todo
	LIT=$(echo $file_name | grep -o "[0-9]*" | head -1)
	VAL=$(expr $LIT + 0)
	echo $VAL
}


# -------------------------------- get environment ----------------------
if [[ `whoami` == "root" ]]; then
	if uname -a | grep -io "$ENV_BOARD" > /dev/null; then
		ENV="board"
	elif uname -a | grep -io "$ENV_PC" > /dev/null; then
		ENV="pc"
	else
		echo "unknown environment"
		exit 1
	fi
else
	ENV="pc"
fi

# -------------------------------- todo ---------------------------------
folder=$(dirname $0)
if [ $# -eq 0 ]; then #test all
	echo "test automatically"
	for file in "$folder"/* ;do
		file_name=${file##*/}
		if [[ "$file_name" == [0-9][0-9][0-9]_* ]]; then
			if [[ "$file_name" != *_.sh ]]; then
				doTest "$file_name"
			fi	
		fi
	done;

	echo "test manually with script supported"
	for file in "$folder"/* ;do
		file_name=${file##*/}
		if [[ "$file_name" == [0-9][0-9][0-9]_* ]]; then
			if [[ "$file_name" == *_.sh ]]; then
				doTest "$file_name"
			fi	
		fi
	done;
else if [[ $1 == *":"* ]]; then #test arrange
	str=$1
	start=${str%%:*}
	end=${str##*:}
	for file in "$folder"/* ;do
		file_name=${file##*/}
		if [[ "$file_name" == [0-9][0-9][0-9]_* ]]; then
			test_case=$(getTestNumber "$file_name")
			# if [[ "$file_name" != *_.sh ]]; then
				if [[ $test_case -ge $start && $test_case -le $end ]]; then
					doTest "$file_name"
				fi	
			# fi	
		fi
	done;

else
	for file in "$folder"/* ;do
		file_name=${file##*/}
		if [[ "$file_name" == [0-9][0-9][0-9]_* ]]; then
			test_case=$(getTestNumber "$file_name")
			for toTest in $@;do
				if [[ $test_case -eq $toTest ]]; then
					doTest "$file_name"
				fi	
			done
		fi
	done;

	fi #end of test arrange
fi

