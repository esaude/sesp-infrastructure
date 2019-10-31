#!/bin/bash

# Create Directory 
cd /opt
sudo mkdir sesp_poc_repositories

# Clone Repos

cd /opt/sesp_poc_repositories

# Bahmni-config
sudo git clone https://github.com/esaude/esaude-poc-config.git --branch develop

# Openmrs-module-bahmniapps
sudo git clone https://github.com/esaude/openmrs-module-bahmniapps.git --branch develop

# Metadata
sudo git clone https://github.com/esaude/sesp-bahmni-metadata.git --branch develop

# Openerp-module
sudo git clone https://github.com/esaude/openerp-modules.git --branch develop

# Patient-status-scheduler
sudo git clone https://github.com/esaude/patient-status-scheduler.git --branch develop

# Bahmni-emr-hospital-service
sudo git clone https://github.com/esaude/bahmni-emr-hospital-service.git --branch develop

# Sesp-infrastructure
sudo git clone https://github.com/esaude/sesp-infrastructure.git --branch develop





