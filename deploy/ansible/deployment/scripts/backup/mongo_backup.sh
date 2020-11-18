#!/bin/sh
DIR=`date +%Y-%m-%d_%H%M%S`
mkdir $DIR
mongodump -h localhost -d appsmith -u $mongo_root_user -p $mongo_root_pass --forceTableScan -o $DIR