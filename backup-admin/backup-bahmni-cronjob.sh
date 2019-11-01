#!/bin/sh

#Definir variaveis

# Preparacao das variaveis.
###########################

# Atribui o ano atual a variavel ano.

ano=$(date +%y)

# Atribui o mes atual a variavel mes.

mes=$(date +%m)

# Atribui o dia atual a variavel dia.

dia=$(date +%d)

# Cria o diretorio de backup.
sudo mkdir /opt/sesp
sudo mkdir /opt/sesp/$dia$mes$ano

#date %F\ %T

# Para backup do mysql
cd /data/openmrs/
#Executar o comando as todos dias as 00hrs

# run the comand
sudo  bahmni -i local backup --backup_type=db --options=openmrs

#Para backup no postgres
 #cd /var/lib/pgbackrest/new_backup

# run the comand
# sudo bahmni -i local backup --backup_type=db --options=postgres



#copia os arquivos para o diretorio de backup neste caso o sesp.
# Em vez de copia pode ser feito também um TAR.

sudo cp -R /data/openmrs/2019* /opt/sesp/$dia$mes$ano
sudo cp -R /var/lib/pgbackrest/* /opt/sesp/$dia$mes$ano

# Zipar todos os arquivos existentes nessa pasta
cd /opt/sesp/$dia$mes$ano
#find . -type d -exec zip {}.zip {} \; 
#sudo tar -czvf backup.tar.gz -r ./
sudo zip backup_$dia$mes$ano -r 2019* 
ls -l