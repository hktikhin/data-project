# Kafka Stock Market Project

## Overview

This project is a demonstration of how to use Kafka to stream real-time stock market data and store it in an S3 bucket. The project includes a producer script that simulates stock market data and sends it to a Kafka server, and a consumer script that listens to the Kafka server and stores the data in an S3 bucket using the S3FS library. The project also includes instructions for setting up an EC2 instance, installing Kafka and Java, and running the producer and consumer scripts.

## Architecture Diagram

![Kafka Project Architecture Diagram](./Architecture.jpg)


## Technology Used

- Apache Kafka
- Java
- Python
- AWS EC2
- AWS S3
- AWS Glue
- AWS Athena

## Skills Demonstrated

- Setting up an EC2 instance in AWS
- Installing and configuring Kafka and Java
- Writing a Kafka producer script in Python
- Writing a Kafka consumer script in Python
- Storing data in an S3 bucket using S3FS
- Using AWS Glue to infer data schema
- Querying S3 data using AWS Athena

## Steps

1. Launch an EC2 instance with at least 2GB of RAM and create a key pair.
2. SSH into the instance and install Java and Kafka.
3. Start the ZooKeeper server and Kafka server.
4. Create a Kafka topic.
5. Run the producer script to send simulated stock market data to the Kafka server.
6. Run the consumer script to listen to the Kafka server and store the data in an S3 bucket using S3FS.
7. Use AWS Glue to infer the data schema.
8. Use AWS Athena to query the data in the S3 bucket.
9. Clean up by shutting down the EC2 instance and deleting the S3 bucket.

Note: Make sure to configure the inbound connection rules in your EC2 instance security group to allow client requests, and to allocate enough memory to the Kafka server to avoid crashes. Also, don't forget to configure AWS credentials on your local machine and specify a query result location when using Athena.


