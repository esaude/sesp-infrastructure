#GITHUB_URL="https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/deletePatientData/0.91"

OPENMRS_SQL_FILE="deletePatientDataForOpenMRS.sql"
OPENELIS_SQL_FILE="deletePatientDataForOpenElis.sql"
OPENERP_SQL_FILE="deletePatientDataForOpenERP.sql"
CURDIR=$(pwd)


RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NOCOLOR='\033[0m'

stop_all_bahmni_services()
{

	echo -e "${CYAN}Stopping all bahmni related services${NOCOLOR}"
	bahmni -i $INVENTORY_FILE stop

}

download_and_delete_openmrs_patient_data(){
    echo -e "${CYAN}downloading openmrs delete patient data sql file${NOCOLOR}"
	if [ -z $OPENMRS_DB_USER ];then
	    echo -e "${RED}OPENMRS_DB_USER is unset.Please set the ENVIRONMENT VARIABLE OPENMRS_DB_USER ${NOCOLOR}"
	else
	    echo -e "${CYAN} deleting openmrs patient data${NOCOLOR}"
	    mysql -u$OPENMRS_DB_USER -p$PASSWORD openmrs < $OPENMRS_SQL_FILE
	    exitcode=$?
	    if [ $exitcode -ne 0 ]; then
	        echo -e "${RED}Failed to delete the openmrs patient data${NOCOLOR}"
	     else
	        echo -e "${GREEN} Successfully deleted the openmrs patient data${NOCOLOR}"
	     fi
	fi
}

download_and_delete_openelis_patient_data(){
    echo -e "${CYAN}downloading openelis delete patient data sql file${NOCOLOR}"
	if [ -z "$OPENELIS_DB_USER" ];
	    then echo -e "${RED}OPENELIS_DB_USER is unset. Please set the ENVIRONMENT VARIABLE OPENELIS_DB_USER${NOCOLOR}"
	else
	    echo -e "${CYAN}deleting openelis patient data ${NOCOLOR}"
	    psql -U$OPENELIS_DB_USER clinlims < $OPENELIS_SQL_FILE
	    exitcode=$?
	    if [ $exitcode -ne 0 ]; then
	        echo -e "${RED}Failed to delete the openelis patient data${NOCOLOR}"
	     else
	        echo -e "${GREEN} Successfully deleted the openelis patient data${NOCOLOR}"
	     fi
	fi
}

download_and_delete_openerp_patient_data(){
    echo -e "${CYAN}downloading openerp delete patient data sql file${NOCOLOR}"
	if [ -z "$OPENERP_DB_USER" ];
	    then echo -e "${RED}OPENERP_DB_USER is unset. Please set the ENVIRONMENT VARIABLE OPENERP_DB_USER${NOCOLOR}"
	else
	    echo -e "${CYAN}deleting openerp patient data${NOCOLOR}"
	    psql -U$OPENERP_DB_USER openerp < $OPENERP_SQL_FILE
	    exitcode=$?
	    if [ $exitcode -ne 0 ]; then
	        echo -e "${RED}Failed to delete the openerp patient data${NOCOLOR}"
	     else
	        echo -e "${GREEN} Successfully deleted the openerp patient data${NOCOLOR}"
	     fi
	fi
}

start_all_bahmni_services()
{
	echo -e "${CYAN}Starting all bahmni related services${NOCOLOR}"
    bahmni -i $INVENTORY_FILE start
}

stop_all_bahmni_services
download_and_delete_openmrs_patient_data
download_and_delete_openelis_patient_data
download_and_delete_openerp_patient_data
start_all_bahmni_services
