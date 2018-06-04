#!/bin/sh

BACKUP_NAME=website-`date +%d-%m-%Y`.tar.gz

# BACKUP TO ARCHIVE
/bin/tar -cvpzf ~/backup/${BACKUP_NAME} ~/website

# push the files to S3
/usr/local/bin/aws s3 cp ~/backup/${BACKUP_NAME} s3://project-1-website/sites/

# delete the contents of the other directories as we don't need to store them once backed up
rm ~/backup/${BACKUP_NAME}
