# Overview
This project is based on the sample data obtained from the New York City Taxi and Limousine Commission. The data includes trip records of taxis and limousines in New York City. The objective of this project is to perform data transformation using Mage-ai, a data workflow management tool, and load the transformed data into Google BigQuery. The data is then analyzed using Google Looker to gain insights on various parameters such as top 10 pickup locations, total number of trips, and average fare amount.

# Architecture Diagram
The architecture of the project involves using Google Cloud Platform (GCP) services such as Google Compute Engine, Google Cloud Storage, Google BigQuery, and Google Looker. The data transformation is performed using the Mage-ai tool, and the final data is loaded into BigQuery. The architecture diagram is as follows:

![Architecture Diagram](./architecture.jpg)

# Tools Used
The following tools and technologies were used in this project:
- Google Cloud Platform (GCP)
- Google Compute Engine
- Google Cloud Storage
- Google BigQuery
- Google Looker
- Mage-ai

# Steps Taken
The following steps were taken in this project:
- Creating a dimensional modeling diagram: A dimensional modeling diagram was created using Lucidchart/Drawio to visualize the dimensional model.
- Data transformation using Mage-ai: The data was transformed using Mage-ai, which involved performing type conversion, creating dimension and fact tables, and creating a dictionary with the table names as keys.
- Loading data into BigQuery: The transformed data was loaded into Google BigQuery using a batch pipeline, which involved defining an API endpoint and specifying the table name and connection information in the YAML file.
- Analysis using Google Looker: The data in BigQuery was analyzed using Google Looker to gain insights on various parameters such as top 10 pickup locations, total number of trips, and average fare amount.
- Cleanup: The VM instance, GCS bucket, BigQuery dataset, and Looker report were deleted after the analysis was completed.

# Skills Demonstrated
The project involved the following skills:
- Data transformation using Mage-ai
- Loading data into Google BigQuery using a batch pipeline
- Analysis of data using Google Looker
- Working with Google Cloud Platform (GCP) services such as Google Compute Engine, Google Cloud Storage, Google BigQuery, and Google Looker
- Creating an architecture diagram using Lucidchart/Drawio
- Creating a README.md file to document the project.