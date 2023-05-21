## Overview

This project demonstrates how to use Python as Infrastructure as Code (IaC) to create a Redshift cluster and ingest sample data from an S3 bucket using psycopg2. The project also includes instructions on how to set up IAM users, S3 buckets, VPC security groups, and CloudWatch billing alarms.

## Tools

The following tools were used in this project:

- Python 3
- Boto3
- Psycopg2
- AWS Redshift
- AWS S3
- AWS IAM
- AWS VPC
- AWS CloudWatch

## Steps

To use this project, follow these steps:

1. Set up an AWS account and create an IAM user with admin access.
2. Create an S3 bucket for the Redshift data and make it public.
3. Create a VPC security group for the Redshift practice and allow inbound traffic from anywhere (for practice purposes only).
4. Create billing alarms in CloudWatch and set up email notifications.
5. Define the cluster configuration file and assign cluster creation information to the config file, along with the IAM role name that can access S3.
6. Write a Python script using Boto3 to build the resource in AWS and interact with the S3 bucket.
7. Connect to the AWS Redshift cluster with Python using psycopg2 and a connection string.
8. Create a table in the Redshift cluster usingthe `CREATE TABLE IF NOT EXISTS` command.
9. Ingest data into the Redshift cluster using the `COPY` command and the S3 bucket credentials.

## Skills Demonstrated

This project demonstrates the ability to:

- Use Python as Infrastructure as Code (IaC) to create AWS resources
- Ingest data from an S3 bucket into Redshift using psycopg2
- Set up IAM users and permissions in AWS
- Create and configure S3 buckets and VPC security groups
- Set up CloudWatch billing alarms and notifications
- Connect to AWS resources using Boto3 and psycopg2
- Write SQL commands to create tables and load data into a Redshift cluster.