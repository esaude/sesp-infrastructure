#!/bin/bash

# Stop OpenERP service
sudo service openerp stop
# Start OpenERP service
sudo su - openerp -c "cd /opt/bahmni-erp/ && nohup ./openerp-server --addons-path=/opt/bahmni-erp/bahmni-addons,/usr/lib/python2.6/site-packages/openerp-7.0_20130301_002301-py2.6.egg/openerp/addons &"
echo "OpenERP started"


