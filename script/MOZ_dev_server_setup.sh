#!/bin/bash

# Link the app folder
sudo mv /opt/bahmni-web/etc/bahmniapps /opt/bahmni-web/etc/bahmniapps-original
sudo ln -s /opt/sesp_poc_repositories/openmrs-module-bahmniapps/ui/app  /opt/bahmni-web/etc/bahmniapps
sudo chown -h bahmni:bahmni /opt/bahmni-web/etc/bahmniapps

# Link the config folder
sudo mv -b /opt/bahmni-web/etc/bahmni_config /opt/bahmni-web/etc/bahmni_config-original
sudo ln -s /opt/sesp_poc_repositories/esaude-poc-config /opt/bahmni-web/etc/bahmni_config
sudo chown -h bahmni:bahmni /opt/bahmni-web/etc/bahmni_config

# Link the metadata folder
sudo ln -s  /opt/sesp_poc_repositories/sesp-bahmni-metadata/configuration /opt/openmrs/configuration
sudo chown -h bahmni:bahmni /opt/openmrs/configuration

# Link the module folder
sudo mv /opt/openmrs/modules /opt/openmrs/modules-original
sudo ln -s /opt/sesp_poc_repositories/sesp-infrastructure/Openmrs_Modules /opt/openmrs/modules
sudo chown -h bahmni:bahmni /opt/openmrs/modules

# Link the HTML folder
sudo mv -b /var/www/html /var/www/html-original
sudo ln -s /opt/sesp_poc_repositories/bahmni-emr-hospital-service/html /var/www/html
sudo chown -h bahmni:bahmni /var/www/html

# Link the Openerp-Modules
sudo mv -b /opt/bahmni-erp/bahmni-addons /opt/bahmni-erp/bahmni-addons-original
sudo ln -s  /opt/sesp_poc_repositories/modules /opt/bahmni-erp/bahmni-addons
sudo chown -h bahmni:bahmni /opt/bahmni-erp/bahmni-addons


# Run sql scripts
mysql -uroot -ppassword openmrs < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/mySQL/alter_visit_locatiion.sql
mysql -uroot -ppassword openmrs < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/mySQL/person_attribute_alter_value_column.sql

# Run postgresql scripts
#OpenElis
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/1_openElisUesrRole.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/2_removeHomeIcon.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/3_UpdateTestName.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/4_hideDepartment.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/5_hideSampleType.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/6_unitRanges.sql
psql -Uclinlims clinlims  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/elisPostgresql/7_visitType.sql
# OpenERP
psql -Uopenerp openerp  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/erpPostgresql/categoryNameUpdate.sql
psql -Uopenerp openerp  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/erpPostgresql/currencyUpdate.sql
psql -Uopenerp openerp  < /opt/sesp_poc_repositories/sesp-bahmni-metadata/sql/erpPostgresql/syncable_units.sql


# Restart OpenMRS
sudo service openmrs restart
