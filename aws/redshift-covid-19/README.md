# Overview
This project aims to extract, transform, and load COVID-19 related data from various public sources into an AWS data lake. The data is then modeled using dimensional modeling to enable efficient querying and analysis. The final data is stored in an Amazon Redshift cluster for further analysis.

# Skill demonstrated
This project demonstrates the ability to:
- Load data from an AWS data lake using Amazon S3 and AWS Glue
- Query data using Amazon Athena
- Transform data using dimensional modeling
- Automate the ETL process using AWS Glue
- Store data in an Amazon Redshift cluster

# Tools
The following tools were used in this project:
- AWS Glue
- Amazon S3
- Amazon Athena
- Amazon Redshift
- Python
- Jupyter Notebook
- Diagrams.net

# Architecture Diagram
```
          +--------------+             
          |              |             
          |  Amazon S3   |             
          |              |             
          +-------+------+             
                  |                    
                  |  Crawlers          
                  |                    
          +-------+------+             
          |              |             
          |    Amazon    |             
          |    Athena    |          
          |              |             
          +-------+------+             
                  |                    
                  |  Queries           
                  |                    
          +-------+------+             
          |              |             
          |   AWS Glue   |          
          |              |             
          +--------------+             
                  |                    
                  |  ETL Jobs          
                  |                    
          +-------+------+             
          |              |             
          |   Amazon     |             
          |   Redshift   |             
          |              |             
          +--------------+             
```

# Steps
The following steps were taken to complete this project:
1. Download data from [AWS Open Data COVID Data Lake](https://aws.amazon.com/tw/blogs/big-data/a-public-data-lake-for-analysis-of-covid-19-data/) and copy the files into an S3 bucket.
2. Use AWS Glue to create a Glue Crawler to infer the data schema from the S3 data and create and assign IAM roles for each table.
3. Use Amazon Athena to change the table name by providing an outer file path, then partition the data based on the subfolder structure. Copy the DDL statements into an ER diagram.
4. Create a relational model diagram and a dimensional model diagram for efficient querying.
5. Use AWS Glue to create a Python script to read data from Athena, transform the data with the proposed star schema, and save it to S3. Create a table if it doesn't exist and use the copy command for S3 data. Make sure the packages/dependencies are correctly installed in the Glue environment.

# Files
The following files were used in this project:
- covid_etl.ipynb: ETL code to deploy on AWS Glue to run regularly (from AWS Athena to AWS Redshift), i.e., transform raw data with dimensional modeling.
- er-model.drawio: Relational modeling for COVID data.
- star-model.drawio: Dimensional modeling for COVID data.