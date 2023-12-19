# Data Analytics Power BI Report
By **Joel Sud**
## Table of Contents:
- [Description](#description)
- [Installation Instructions](#installation_instructions)
- [Usage Instructions](#usage_instructions)
- [File Structure](#file_structure)
    - [File Description](#understanding-the-files)
- [Project Documentation:](#project-documentation)
    - [Milestone 2](#milestone-2)
    - [Milestone 3](#milestone-3)

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
- subsidiary_material
    - data_model.png

### Understanding the Files:
- **data_analytics_report.pbix**: This is the Power BI file which contains the data models, queries and report with visuals.
- **subsidiary_material**: This is a folder that contains subsidiary material such as .png screenshots of the data model.

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

### Milestone 3:
- To use Power BI's time intelligence functionality a continuous dates table was created. This was created for the period over 2010 to 2023 and included the dates, weekday, month name and number, quarter, year, start of year, start of quarter, start of month and start of week.

    To create the dates table, the following DAX formulas was used:

    ***<p style="text-align: center;">Dates = DATESBETWEEN(
    Orders[Order Date], 
    MIN(Orders[Order Date]), 
    DATE(2023,12,31)
    )***</p>   

    To create different calculated columns, here are some examples of the DAX formulas used:

    ***<p style="text-align: center;">Day of Week = FORMAT(DATES[Date],"dddd")***</p>
    ***<p style="text-align: center;">Quarter = QUARTER(Dates[Date])***</p>
    ***<p style="text-align: center;">Start of Week = Dates[Date] - WEEKDAY(Dates[Date],2) + 1***</p>

- Within this dates table a hierarchy was created from start of year down to the date.
- Following this the star schema was created, for this the relevant columns in the dimension tables were dragged to the relevant column in the fact table, this was done so that there would be a one-to-many relationship which allows for data to be filtered effectively. The columns that were related is shown below:
    - Products[Product Code] to Orders[Product Code]
    - Stores[store code] to Orders[Store Code]
    - Customers[User UUID] to Orders[User ID]
    - Dates[Date] to Orders[Order Date]
    - Dates[Date] to Orders[Shipping Date]

    These relationships are visible in the data model schema, shown in the image at the end of this milestone.
- A measures table was then generated to store key measures, these included:
    - Total Orders
    - Total Revenue
    - Total Profit
    - Total Customers
    - Total Quantity
    - Profit YTD
    - Revenue YTD

    These were generated using DAX formulas, some of which can be seen below:

    ***<p style="text-align: center;">Total Orders = COUNT(Orders[Order Date])***</p>
    ***<p style="text-align: center;">Total Revenue = SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price]))***</p>
    ***<p style="text-align: center;">Profit YTD = SUMX(
    FILTER(
        Orders,
        RELATED(Dates[Year]) = 2023
    ),
    (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])) * Orders[Product Quantity]
)***</p>
- After this, the following DAX expression was used to create the Country column in the Stores table:

    ***<p style="text-align: center;">Country = 
    SWITCH (
        [Country Code],
        "GB", "United Kingdom",
        "US", "United States",
        "DE", "Germany", 
        BLANK()
    )***</p>

    Following this a Geography column was created to represent both the country and region in the country together using the following DAX formula:

    ***<p style="text-align: center;">Geography = Stores[Country Region] & ", " & Stores[Country]***</p>

- Finally a Geography hierarchy was created with Region (continent) coming first, followed by Country, followed by the Country Region.

Below is a screenshot of the data model after this stage:

![Data Model](subsidiary_material/data_model.png)