#!/bin/sh

set -e

S3_BUCKET_NAME=backup.mongo.appsmith.com
BACKUP_NAME=$(date +%y%m%d_%H%M%S).gz
DB=appsmith

MONGO_USER=appsmithuser
MONGO_PASS=SV5fgKTN6rLykj
date
echo "Backing up MongoDB database to S3 Bucket: $S3_BUCKET_NAME"

echo "Dumping MongoDB $DB database to compressed archive"
mongodump --db $DB --archive=$HOME/backups/mongo_dump.gz --gzip -u $MONGO_USER -p $MONGO_PASS --authenticationDatabase $DB

echo "Copying compressed archive to S3 Bucket: $S3_BUCKET_NAME"
aws s3 mv $HOME/backups/mongo_dump.gz s3://$S3_BUCKET_NAME/prod/$BACKUP_NAME

echo "Backup complete!"
