#!/bin/bash


## Make sure db migration file name started with V1__
S3_URI=s3://li-sql-migration-files/V1__rentzone-db.sql
RDS_ENDPOINT=
RDS_DB_NAME=
RDS_DB_USERNAME=
RDS_DB_PASSWORD=

# Update all packages
sudo yum update -y

# Download and extract Flyway
sudo wget -qO- https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline/11.3.0/flyway-commandline-11.3.0-linux-x64.tar.gz | tar -xvz


# Create a symbolic link to make Flyway accessible globally
sudo ln -s $(pwd)/flyway-11.3.0/flyway /usr/local/bin

# Create the SQL directory for migrations
sudo mkdir sql

# Download the migration SQL script from AWS S3
# make sure you attach S3FullAccess Role to EC2 instance to make S3 bucket accessible.
sudo aws s3 cp "$S3_URI" sql/


# Run Flyway migration
flyway \
  -url="jdbc:mysql://$RDS_ENDPOINT:3306/$RDS_DB_NAME?allowPublicKeyRetrieval=true&useSSL=false" \
  -user="$RDS_DB_USERNAME" \
  -password="$RDS_DB_PASSWORD" \
  -locations="filesystem:sql" \
  migrate