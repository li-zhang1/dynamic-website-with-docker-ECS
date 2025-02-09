#!/bin/bash

  

  

S3_URI=s3://li-sql-migration-files/V1__rentzone-db.sql
## Make sure db migration file name started with V1__


  

RDS_ENDPOINT=<rds_endpoint_url>

  

RDS_DB_NAME=<db_name>

  

RDS_DB_USERNAME=<db_username>

  

RDS_DB_PASSWORD=<db_password>

  

  

# Update all packages

  

sudo yum update -y

  

  

# Download and extract Flyway

  

sudo wget -qO- https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline/11.3.0/flyway-commandline-11.3.0-linux-x64.tar.gz | tar -xvz

  

  

# Create a symbolic link to make Flyway accessible globally

  

sudo ln -s $(pwd)/flyway-11.3.0/flyway /usr/local/bin

  
# Create the SQL directory for migrations

  

sudo mkdir sql

  
# Download the migration SQL script from AWS S3

  

sudo aws s3 cp "$S3_URI" sql/
# Note:
  ## make sure you attach S3FullAccess Role to EC2 instance to make S3 bucket accessible.
  

# Run Flyway migration

flyway \

-url="jdbc:mysql://$RDS_ENDPOINT:3306/$RDS_DB_NAME?allowPublicKeyRetrieval=true&useSSL=false" \

-user="$RDS_DB_USERNAME" \

-password="$RDS_DB_PASSWORD" \

-locations="filesystem:sql" \

-cleanDisabled=false \

migrate