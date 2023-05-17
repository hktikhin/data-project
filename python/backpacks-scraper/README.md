# REI Backpack Scraper

## Overview
This is a web scraper that extracts data about hiking backpacks from the REI website. The scraper navigates through the website's pagination to collect product data such as name, SKU, price, and rating. The data is then saved to a CSV file for easy analysis.

## Tool
This project is built using Python and makes use of the following libraries:
- httpx: for making HTTP requests
- selectolax: for parsing HTML
- dataclasses: for defining data structures
- csv: for writing data to a CSV file
- os: for checking if the CSV file exists and is not empty
- urllib: for joining URLs

## How to use
To use this scraper, you will need to have Python 3 installed on your computer. You can then follow these steps:

1. Clone this repository to your local machine.
2. Install the required libraries by running `pip install -r requirements.txt` in your terminal or command prompt.
3. Run the scraper by running `python main.py` in your terminal or command prompt. The scraper will start collecting data and writing it to a CSV file called `backpacks.csv`.
4. Once the scraper has finished running, you can open the `backpacks.csv` file in a spreadsheet application to analyze the data.

## Skill demonstrated
This project demonstrates the following skills:
- Web scraping: The scraper navigates through the REI website's pagination to collect product data.
- Data extraction: The scraper extracts data such as name, SKU, price, and rating from the website's HTML.
- Data modeling: The scraper uses dataclasses to define a model for the product data.
- Data storage: The scraper writes the collected data to a CSV file for easy analysis.
- Error handling: The scraper handles errors such as missing data or missing HTML elements.
