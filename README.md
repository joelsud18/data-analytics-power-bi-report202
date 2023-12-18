# Data Analytics Power BI Report
By **Joel Sud**
## Table of Contents:
- [Description](#description)
- [Installation Instructions](#installation_instructions)
- [Usage Instructions](#usage_instructions)
- [File Structure](#file_structure)
    - [File Description](#understanding-the-files)
- [Project Documentation](#project-documentation)

## Description: 
This is an Ai Core project with the aim of conducting data analysis on a Orders database in Power BI.

## Installation Instructions:
1. **Download and clone repository:**
- copy the repository URL by clicking '*<> Code*' above the list of files in GitHub Repo. Then copy and paste the '*HTTPS*' URL:
- in your CLI go to the location where you wish to clone your directory.
- Type the following '***git clone***' command with the '*HTTPS*' URL:

***<p style="text-align: center;">git clone https://github.com/joelsud18/data-analytics-power-bi-report202.git***</p>

- Press 'Enter'.

## Usage Instructions

## File Structure:
- data_analytics_report.pbix
- Products.csv

### Understanding the Files:
- **data_analytics_report.pbix**: This is the Power BI file which contains the data models, queries and report with visuals.

## Project Documentation
### Milestone 2:
- Once the .pbix file was created, the first step was to import the 'Orders' fact table. This was imported from an Azure SQL database.
    - Confidential columns were deleted; Date columns were split between date and time and rows with missing values were removed.
- The following dimension tables were also imported into the model:
    - 'Product' table was imported from a .csv file.
        - Units were converted to kg.
    - 'Stores' table was imported from Azure Blob Storage.
    - 'Customers' table was improted by combining and transforming 3 .csv files following the same schema in a zip file.
- It was ensured that column names in all tables followed Power BI naming conventions.