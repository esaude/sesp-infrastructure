#!/bin/sh

echo "Starting backup" 
#Definir variaveis

echo "Creating variables for backup"
# Preparacao das variaveis.
###########################

# Atribui o ano atual a variavel ano.

year=$(date +%Y)

# Atribui o mes atual a variavel mes.

month=$(date +%m)

# Atribui o dia atual a variavel dia.

day=$(date +%d)

# SESP backup folder

sudo mkdir /opt/sesp-backup
sudo mkdir /opt/sesp-backup/$day$month$year
sudo mkdir /opt/sesp-backup/$day$month$year/openmrs_backup
sudo mkdir /opt/sesp-backup/$day$month$year/postgres_backup

cd opt/sesp-backup


echo "Backing up OpenMRS database"

# run the comand
bahmni -i local backup --backup_type=db --options=openmrs

# copy the compressed openmrs backup folder to SESP-TR backup directory
sudo cp -R /data/openmrs /opt/sesp-backup/$day$month$year/openmrs_backup

echo "Backing up Postgres database"

# Postgres OpenELIS/OpenERP backup
cd /var/lib/

# remove existing backup folder
sudo rm -rf pgbackrest

# Create backup of postgres
bahmni -i local backup --backup_type=db --options=postgres

sudo cp -R /var/lib/pgbackrest /opt/sesp-backup/$day$month$year/postgres_backup

cd /opt/sesp-backup
# compress postgres backup
sudo zip  backup_$day$month$year  * 

#delete all only directories which are compressed 
sudo rm -R `ls -1 -d */`

#delete files more than 30 days
find /opt/sesp-backup -type f -mtime +30 -exec rm -f {} \;
ls -l