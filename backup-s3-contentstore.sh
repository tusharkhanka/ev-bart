#!/bin/sh

# Load properties
#ALFBRT_PATH=/opt/alfresco_installer/eisenvault_installations/backup_tenants/BART/aws-bart-backup
#if [ -f ${ALFBRT_PATH}/alfresco-bart.properties ]; then
 #       . ${ALFBRT_PATH}/alfresco-bart.properties
#else
 #       echo alfresco-bart.properties file not found, edit $0 and modify ALFBRT_PATH
#fi

if [ -f ./alfresco-bart.properties ]; then
        . ./alfresco-bart.properties
else
        echo alfresco-bart.properties file not found, edit $0 and modify ALFBRT_PATH
fi

BACKUP_LOCATION=$(echo ${S3FILESYSLOCATION}| cut -d'/' -f 4)
# Echo script initialization
echo "$LOG_DATE_LOG - $BART_LOG_TAG Backing up the Alfresco ContentStore from ${S3CONTENTSTORE_SOURCELOCATION} to $BACKUP_LOCATION" >> $ALFBRT_LOG_FILE
echo "$LOG_DATE_LOG - $BART_LOG_TAG Starting backup - S3 ContentStore" >> $ALFBRT_LOG_FILE
echo "$LOG_DATE_LOG - $BART_LOG_TAG Running command ..." >> $ALFBRT_LOG_FILE
aws s3 cp s3://${S3CONTENTSTORE_SOURCELOCATION} s3://$BACKUP_LOCATION --recursive
echo "$LOG_DATE_LOG - $BART_LOG_TAG S3 ContentStore backup done!" >> $ALFBRT_LOG_FILE
