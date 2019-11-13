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
sesp_backup='/sesp-backup'

# Cria o diretorio de backup.
mkdir -p $sesp_backup/$day$month$year

#date %F\ %T

echo "Backing up OpenMRS database"

# OpenMRS backup

# Para backup do mysql
cd /data/
#Executar o comando as todos dias as 00hrs

# run the comand
bahmni -i local backup --backup_type=db --options=openmrs

# compress the backup folder
tar -zcvf openmrs-$day$month$year.tar.gz openmrs/

# move the compressed openmrs backup folder to SESP-TR backup directory
mv openmrs-$day$month$year.tar.gz $sesp_backup/$day$month$year

echo "Backing up Postgres database"

# Postgres OpenELIS/OpenERP backup
cd /var/lib/

# remove existing backup folder
rm -rf pgbackrest/

# Create backup of postgres
bahmni -i local backup --backup_type=db --options=postgres

# compress postgres backup
tar -zcvf -r pgbackrest-$day$month$year.tar.gz pgbackrest/

# move the compressed postgres backup folder to SESP-TR backup directory
mv pgbackrest-$day$month$year.tar.gz $sesp_backup/$day$month$year