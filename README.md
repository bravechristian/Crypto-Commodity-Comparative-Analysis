# Crypto-Commodity Comparative Analysis: Unveiling Market Dynamics

<br/><br/>
## Table of Content
- [Overview](#overview)
- [Project Goals](#project-goals)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Analysis Methods](#analysis-methods)
- [Result and Findings](#result-and-findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [References](#references)

  
<br/><br/>
### Overview
This project aims to compare the stability and volatility of cryptocurrencies to commodities, particularly focusing on gold and Brent crude. It utilizes two different datasets covering 12 years: one from crypto trading and the other from commodity trading. <br/><br/>

### Project Goals
To compare the stability of cryptocurrencies and commodities.
Analyze the volatility of the crypto market compared to commodities over 5 years.
Perform various analyses using complex SQL queries, including window functions, WITH clauses, subqueries, and joins. <br/><br/>

### Data Sources
Crypto Trading Dataset: Contains historical data on cryptocurrency trading over a 12-year period, the primary dataset is the "cryptoTrade.csv" file.
Commodity Trading Dataset: Includes historical data on commodity trading, focusing on gold and Brent crude oil, also spanning 12 years, the dataset is a "commodities.csv" file. <br/><br/>

### Tools
- Excel used for data cleaning
- Microsoft SQL Studio (SQL) used for the data analysis [Download here](https://www.bing.com/search?q=sql+server+management+studio+download&filters=dtbk:%22MCFjZ192NV9kb3dubG9hZCFjZ192NV9kb3dubG9hZCExMGFjNzM3YS1hMGQ2LTNhYmQtZDJlOC02Yzg4OTcxMzBhOTM%3d%22+sid:%2210ac737a-a0d6-3abd-d2e8-6c8897130a93%22&FORM=DEPNAV)
- Power BI for data visualization [Download here](https://www.bing.com/ck/a?!&&p=5d6550d22355fe53JmltdHM9MTcwNzYwOTYwMCZpZ3VpZD0zZWI2MzJiYS0wYmI2LTY2NzUtMDAxNi0yMDU0MGFhYjY3MGMmaW5zaWQ9NTQ5NQ&ptn=3&ver=2&hsh=3&fclid=3eb632ba-0bb6-6675-0016-20540aab670c&psq=power+bi+desktop+download&u=a1aHR0cHM6Ly93d3cubWljcm9zb2Z0LmNvbS9lbi11cy9kb3dubG9hZC9kZXRhaWxzLmFzcHg_aWQ9NTg0OTQ_b2NpZD1PUlNFQVJDSF9CaW5n&ntb=1) <br/><br/>

### Data Cleaning and Preparation
#### 1. Importing Data into Excel
I opened Excel and imported the raw data from the CSV files (cryptoTrading.csv and commodities.csv) using the "Data" tab and selecting "From Text/CSV".
I followed the prompts to select the appropriate delimiter (e.g., comma) and import the data into separate worksheets.
#### 2. Data Inspection:
I reviewed the structure and content of each dataset by navigating through the worksheets and checking for any obvious inconsistencies, missing values, or formatting issues in the data.
#### 3. Handling Missing Values:
Identify missing values in each dataset by visually inspecting the cells and using Excel functions like COUNTBLANK() or IF(ISBLANK()). I identified the number of blanks, missing, and null values and deleted them from the dataset.
#### 4. Data Filtering:
Filtered out irrelevant and incomplete data points by using Excel's built-in filtering capabilities. Select the dataset range, go to the "Data" tab, and click on "Filter" to apply filters to individual columns.

### Exploratory Data Analysis (EDA)
#### Overview:
I started by gaining a general understanding of the datasets, including the variables, data types, and overall structure, Identifying the key variables in each dataset for my analysis, such as price data, trading volumes, or other relevant indicators.
#### Descriptive Statistics:
Calculated summary statistics for key variables, such as mean, median, standard deviation, minimum, maximum, and quartiles, to understand the central tendency and variability of the data. Finally, I explored the data to answer the following key questions

- Percentage change of commodities with-respect-to various crypto-currencies within a 5-year timeframe
- Calculated descriptive statistics and visualized distributions of cryptocurrency and commodity prices.
- Visualised time series analysis to identify trends and patterns in price movements.
- Investigated volatility measures to assess the stability of cryptocurrencies compared to commodities.
- Finally, gold was compared with bitcoin to assess: stability and volatility, performance, and correlation.  <br/><br/>



### Analysis Methods
Utilizes statistical measures to compare the stability of cryptocurrencies and commodities, with a focus on gold and Brent crude oil.
Calculates and compares volatility metrics for the crypto market and commodities over a 5-year timeframe.

```SQL
WITH gold_btc AS (

SELECT
	c.Date AS date
	,ROUND(AVG(GOLD),2) AS gold_price
	,ROUND(AVG(Adj_Close_BTC),2) AS btc_price
FROM crypto c
JOIN  commodities cd
ON c.Date = cd.Date GROUP BY c.Date

)
SELECT 
	YEAR(date) AS year
	,ROUND(AVG(gold_price),2) AS avg_gold_price
	,ROUND(MAX(gold_price),2) AS gold_max
	,ROUND(MIN(gold_price),2) AS gold_min
	,ROUND(((MAX(gold_price)  -  MIN(gold_price)) / MAX(gold_price)) * 100,2) AS percent_change_gold
	,ROUND(AVG(btc_price),2) AS avg_btc_price
	,ROUND(MAX(btc_price),2) AS btc_max
	,ROUND(MIN(btc_price),2) AS btc_min
	,ROUND(((MAX(btc_price)  -  MIN(btc_price)) / MAX(btc_price)) * 100,2) AS percent_change_btc
FROM gold_btc
GROUP BY YEAR(date) ORDER BY 1;


SELECT
	c.Date AS date
	,ROUND(AVG(GOLD),2) AS gold_price
	,ROUND(AVG(Adj_Close_BTC),2) AS btc_price
FROM crypto c
JOIN  commodities cd
ON c.Date = cd.Date GROUP BY c.Date

)
SELECT 
	YEAR(date) AS year
	,ROUND(AVG(gold_price),2) AS avg_gold_price
	,ROUND(((MAX(gold_price)  -  MIN(gold_price)) / MAX(gold_price)) * 100,2) AS percent_change_gold
	,ROUND(AVG(btc_price),2) AS avg_btc_price
	,ROUND(((MAX(btc_price)  -  MIN(btc_price)) / MAX(btc_price)) * 100,2) AS percent_change_btc
FROM gold_btc
GROUP BY YEAR(date) ORDER BY 1;


--Calculate the standard deviation of bitcoin
SELECT STDEV(Adj_Close_BTC) AS standard_deviation
FROM dbo.cryptoTradeCSV;



```
<br/><br/>

### Result and Findings
The data analysis provided valuable insights into the stability and volatility of cryptocurrencies and commodities markets. Summarised as follows;
- The crypto market is very volatile and thus can quickly change over a very short time
- The commodities market is less volatile and therefore, could serve as a potential store of wealth
<br/><br/>

### Visuals

![Gold vs Bitcoin](https://github.com/bravechristian/Finance-Project/assets/113802347/8859d3cc-3ca0-437f-a7a2-a5358a427e67)
<br/><br/>

![Gold   Bitcoin](https://github.com/bravechristian/Finance-Project/assets/113802347/018ea694-9d7e-427d-8b3a-59b327dd449e)
<br/><br/>


![Commodities and Crypto](https://github.com/bravechristian/Finance-Project/assets/113802347/1140db22-e3d3-43c6-807c-cc98c39bbab7)

<br/><br/>


![Treemap for Crypto](https://github.com/bravechristian/Finance-Project/assets/113802347/ef8bf0c5-d369-44a9-92cf-1e58aa45ee99)

<br/><br/>

### Recommendations
- Monitoring market trends and developments in cryptocurrencies and commodities markets.
- Consider incorporating both asset classes(Commodities & Crypto-currencies) into investment portfolios for diversification and risk management.
- Further research and analysis are to be conducted to explore factors influencing asset prices and market dynamics.
<br/><br/>

### Limitations
I had to remove all zero and null values from my datasets because they would have imparted the accuracy of my analysis and conclusions. Even then the result displayed a positive correlation between commodities and crypto-currencies.
<br/><br/>

### References
1. [MYSQL Documentation](https://dev.mysql.com/doc/)
2. [W3 Schools](https://www.w3schools.com/sql/sql_quickref.asp)
3. [Microsoft T-SQL](https://learn.microsoft.com/en-us/sql/tools/overview-sql-tools?view=sql-server-ver16)



<br/><br/><br/><br/>


