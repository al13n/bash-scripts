RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\e[33m'
NC='\033[0m' # No Color
BLUE='\e[94m'
BLUE_BACKGROUND='\e[104m'

spaces(){
	COUNTER=0
    while [  $COUNTER -lt $1 ]; do
        printf " "
        let COUNTER=COUNTER+1 
    done
}

pretty(){

	for FILENAME in $(ls)
	do
		spaces $1
		if [[ -d $FILENAME ]]; then
			printf "${BLUE}${FILENAME}${NC}\n"
			cd $FILENAME
			SPACES=$(($1 + 1))
			pretty $SPACES
			cd ..
		else
			printf "${YELLOW}${FILENAME}${NC}\n"
		fi
	done
}

pretty 0