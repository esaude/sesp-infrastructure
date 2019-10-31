# Set environment variables required for the scripts
export OPENMRS_DB_USER=openmrs-user
export OPENELIS_DB_USER=clinlims
export OPENERP_DB_USER=openerp
export INVENTORY_FILE=local

# Add executable permission for the scripts
chmod a+x *

# Start the script execution
sh deletePatientData.sh
