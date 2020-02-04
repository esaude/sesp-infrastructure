#!/bin/sh

# Adding executable permission to the script
chmod a+x /opt/sesp-repository/sesp-infrastructure/backup-admin/backup-bahmni-cronjob.sh

# #for daily at 20.00
(crontab -l 2>/dev/null; echo "0 20 * * * sudo sh /opt/sesp-repository/sesp-infrastructure/backup-admin/backup-bahmni-cronjob.sh") | crontab -

