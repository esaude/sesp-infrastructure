
#!/bin/bash
# #for daily midnight 12.00
(sudo crontab -l 2>/dev/null; echo "0 0 * * * sudo /opt/sesp_poc_repositories/sesp-infrastructure/backup-admin/backup-bahmni-cronjob.sh") | crontab -

