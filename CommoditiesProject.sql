USE projectFinance;

SELECT * 
FROM commodities;

--Selected Commodities for Analysis
SELECT 
	Date 
	,NATURAL_GAS
	,GOLD
	,WTI_CRUDE
	,BRENT_CRUDE
	,GASOLINE 
FROM commodities;


--Looking at the average price per year for the different commodities
SELECT 
	YEAR(Date) AS YEAR 
	,ROUND(AVG(NATURAL_GAS),2) AS GAS
	,ROUND(AVG(GOLD),2) AS GOLD 
	,ROUND(AVG(WTI_CRUDE),2) AS CRUDE 
	,ROUND(AVG(BRENT_CRUDE),2) AS BRENT_CRUDE
	,ROUND(AVG(GASOLINE),2) AS PETROL
FROM commodities
GROUP BY YEAR(Date) ORDER BY YEAR(Date);


--Comparing the Lowest and the Highest Value for each commodity
SELECT 
	YEAR(Date) AS YEAR 
	,ROUND(AVG(NATURAL_GAS),2) AS NATURAL_GAS
	,ROUND(MAX(NATURAL_GAS),2) AS highest_value_gas
	,ROUND(MIN(NATURAL_GAS),2) AS lowest_value_gas
	,ROUND(AVG(GOLD),2) AS GOLD
	,ROUND(MAX(GOLD),2) AS highest_value_gold
	,ROUND(MIN(GOLD),2) AS lowest_value_gold
	,ROUND(AVG(WTI_CRUDE),2) AS CRUDE 
	,ROUND(MAX(WTI_CRUDE),2) AS highest_value_crude
	,ROUND(MIN(WTI_CRUDE),2) AS lowest_value_crude
	,ROUND(AVG(BRENT_CRUDE),2) AS BRENT_CRUDE
	,ROUND(MAX(BRENT_CRUDE),2) AS highest_value_brent
	,ROUND(MIN(BRENT_CRUDE),2) AS lowest_value_brent
	,ROUND(AVG(GASOLINE),2) AS GASOLINE
	,ROUND(MAX(GASOLINE),2) AS highest_value_gasoline
	,ROUND(MIN(GASOLINE),2) AS lowest_value_gasoline
FROM commodities
GROUP BY YEAR(Date) ORDER BY YEAR(Date);


--Looking at the percentage change of the commodities Per Year
SELECT 
	YEAR(Date) AS YEAR 
	,ROUND(AVG(NATURAL_GAS),2) AS NATURAL_GAS
	,ROUND(MAX(NATURAL_GAS),2) AS highest_value_gas
	,ROUND(MIN(NATURAL_GAS),2) AS lowest_value_gas
	,ROUND(((MAX(NATURAL_GAS)  -  MIN(NATURAL_GAS)) / MAX(NATURAL_GAS)) * 100,2) AS percent_change
	,ROUND(AVG(GOLD),2) AS GOLD
	,ROUND(MAX(GOLD),2) AS highest_value_gold
	,ROUND(MIN(GOLD),2) AS lowest_value_gold
	,ROUND(((MAX(GOLD)  -  MIN(GOLD)) / MAX(GOLD)) * 100,2) AS percent_change
	,ROUND(AVG(WTI_CRUDE),2) AS CRUDE 
	,ROUND(MAX(WTI_CRUDE),2) AS highest_value_crude
	,ROUND(MIN(WTI_CRUDE),2) AS lowest_value_crude
	,ROUND(((MAX(WTI_CRUDE)  -  MIN(WTI_CRUDE)) / MAX(WTI_CRUDE)) * 100,2) AS percent_change
	,ROUND(MAX(BRENT_CRUDE),2) AS highest_value_brent
	,ROUND(MIN(BRENT_CRUDE),2) AS lowest_value_brent
	,ROUND(((MAX(BRENT_CRUDE)  -  MIN(BRENT_CRUDE)) / MAX(BRENT_CRUDE)) * 100,2) AS percent_change
	,ROUND(AVG(GASOLINE),2) AS GASOLINE
	,ROUND(MAX(GASOLINE),2) AS highest_value_gasoline
	,ROUND(MIN(GASOLINE),2) AS lowest_value_gasoline
	,ROUND(((MAX(GASOLINE)  -  MIN(GASOLINE)) / MAX(GASOLINE)) * 100,2) AS percent_change
FROM commodities
GROUP BY YEAR(Date) ORDER BY YEAR(Date);




------Gasoline Analysis
--SELECT  
--	Date
--	,GASOLINE 
--FROM commodities 
--ORDER BY Date;


----The avarage price of gasoline per year
--SELECT 
--	YEAR(Date) AS year
--	,ROUND(AVG(GASOLINE),2) AS avg_gasoline_cost 
--FROM commodities
--GROUP BY YEAR(Date) ORDER BY 1;

----Comparing the percentage change per year for gasoline
--SELECT 
--	YEAR(Date) AS YEAR
--	,ROUND(AVG(GASOLINE),2) AS avg_gasoline_cost 
--	,ROUND(MAX(GASOLINE),2) AS highest_value
--	,ROUND(MIN(GASOLINE),2) AS lowest_value
--	,ROUND(((MAX(GASOLINE)  -  MIN(GASOLINE)) / MAX(GASOLINE)) * 100,2) AS percent_change
--FROM commodities
--GROUP BY YEAR(Date) ORDER BY 1;





--Selecting all from the crypto dataset
SELECT * FROM crypto;

--Extracting the average price for each currency per year and the total volume purchased
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
	,SUM(Volume_BNB) AS volume_of_bnb
	,ROUND(AVG(Adj_Close_BTC),2) AS btc
	,SUM(Volume_BTC) AS volume_of_btc
	,ROUND(AVG(Adj_Close_USDT),2) AS usdt
	,SUM(Volume_USDT) AS volume_of_usdt
	,ROUND(AVG(Adj_Close_ETH),2) AS eth
	,SUM(Volume_ETH) AS volume_of_eth
FROM crypto GROUP BY YEAR(Date) ORDER BY 1;


--Extracting the lowest and highest value of the currencies per year
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
	,ROUND(MAX(Adj_Close_BNB),2) AS max_value_bnb
	,ROUND(MIN(Adj_Close_BNB),2) AS min_of_bnb
	,ROUND(AVG(Adj_Close_BTC),2) AS btc
	,ROUND(MAX(Adj_Close_BTC),2) AS max_btc
	,ROUND(MIN(Adj_Close_BTC),2) AS min_of_btc
	,ROUND(AVG(Adj_Close_USDT),2) AS usdt
	,ROUND(MAX(Adj_Close_USDT),2) AS max_of_usdt
	,ROUND(MIN(Adj_Close_USDT),2) AS min_of_usdt
	,ROUND(AVG(Adj_Close_ETH),2) AS eth
	,ROUND(MAX(Adj_Close_ETH),2) AS max_of_eth
	,ROUND(MIN(Adj_Close_ETH),2) AS min_of_eth
FROM crypto GROUP BY YEAR(Date) ORDER BY 1;



--Price change for each currency
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
	,ROUND(MAX(Adj_Close_BNB),2) AS max_value_bnb
	,ROUND(MIN(Adj_Close_BNB),2) AS min_of_bnb
	,ROUND((MAX(Adj_Close_BNB)  -  MIN(Adj_Close_BNB)),2) AS price_change_bnb
	,ROUND(AVG(Adj_Close_BTC),2) AS btc
	,ROUND(MAX(Adj_Close_BTC),2) AS max_btc
	,ROUND(MIN(Adj_Close_BTC),2) AS min_of_btc
	,ROUND((MAX(Adj_Close_BTC)  -  MIN(Adj_Close_BTC)),2) AS price_change_btc
	,ROUND(AVG(Adj_Close_USDT),2) AS usdt
	,ROUND(MAX(Adj_Close_USDT),2) AS max_of_usdt
	,ROUND(MIN(Adj_Close_USDT),2) AS min_of_usdt
	,ROUND((MAX(Adj_Close_USDT)  -  MIN(Adj_Close_USDT)),2) AS price_change_usdt
	,ROUND(AVG(Adj_Close_ETH),2) AS eth
	,ROUND(MAX(Adj_Close_ETH),2) AS max_of_eth
	,ROUND(MIN(Adj_Close_ETH),2) AS min_of_eth
	,ROUND((MAX(Adj_Close_ETH)  -  MIN(Adj_Close_ETH)),2) AS price_change_eth
FROM crypto GROUP BY YEAR(Date) ORDER BY 1;





--Percentage change for each currency
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
	,ROUND(((MAX(Adj_Close_BNB)  -  MIN(Adj_Close_BNB)) / MAX(Adj_Close_BNB)) * 100,2) AS percent_change_bnb
	,ROUND(AVG(Adj_Close_BTC),2) AS btc
	,ROUND(((MAX(Adj_Close_BTC)  -  MIN(Adj_Close_BTC)) / MAX(Adj_Close_BTC)) * 100,2) AS percent_change_btc
	,ROUND(AVG(Adj_Close_USDT),2) AS usdt
	,ROUND(((MAX(Adj_Close_USDT)  -  MIN(Adj_Close_USDT)) / MAX(Adj_Close_USDT)) * 100,2) AS percent_change_usdt
	,ROUND(AVG(Adj_Close_ETH),2) AS eth
	,ROUND(((MAX(Adj_Close_ETH)  -  MIN(Adj_Close_ETH)) / MAX(Adj_Close_ETH)) * 100,2) AS percent_change_eth
FROM crypto GROUP BY YEAR(Date) ORDER BY 1;




--SELECT
--	YEAR(Date) AS year
--	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
--	,ROUND(MAX(Adj_Close_BNB),2) AS max_value_bnb
--	,ROUND(MIN(Adj_Close_BNB),2) AS min_of_bnb
--	,ROUND((MAX(Adj_Close_BNB)  -  MIN(Adj_Close_BNB)) ,2) AS price_change
--FROM crypto GROUP BY YEAR(Date) ORDER BY 1;

----Percentage change
--SELECT
--	YEAR(Date) AS year
--	,ROUND(AVG(Adj_Close_BNB),2) AS bnb
--	,ROUND(MAX(Adj_Close_BNB),2) AS max_value_bnb
--	,ROUND(MIN(Adj_Close_BNB),2) AS min_of_bnb
--	,ROUND(((MAX(Adj_Close_BNB)  -  MIN(Adj_Close_BNB)) / MAX(Adj_Close_BNB)) * 100,2) AS percent_change
--FROM crypto GROUP BY YEAR(Date) ORDER BY 1;



--COMPARING NATURAL RESOURCE WITH CRYPTO PER YEAR -- CREATING JOIN STATEMENTS 
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BTC),2) AS btc_price
	,ROUND(((MAX(Adj_Close_BTC)  -  MIN(Adj_Close_BTC)) / MAX(Adj_Close_BTC)) * 100,2) AS percent_change_btc
FROM crypto
GROUP BY YEAR(Date) ORDER BY 1;


SELECT TOP 6
	YEAR(Date) AS year
	,ROUND(AVG(GOLD),2) AS gold_price
	,ROUND(((MAX(GOLD)  -  MIN(GOLD)) / MAX(GOLD)) * 100,2) AS percent_change_gold
FROM commodities
GROUP BY YEAR(Date) ORDER BY 1 DESC;


--SELECT
--	c.Date
--	,ROUND(AVG(GOLD),2) AS gold_price
--FROM crypto c
--JOIN  commodities cd
--ON c.Date = cd.Date GROUP BY c.Date
--ORDER BY 1;



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



--Just the percentage change in price of gold to btc

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
	,ROUND(((MAX(gold_price)  -  MIN(gold_price)) / MAX(gold_price)) * 100,2) AS percent_change_gold
	,ROUND(AVG(btc_price),2) AS avg_btc_price
	,ROUND(((MAX(btc_price)  -  MIN(btc_price)) / MAX(btc_price)) * 100,2) AS percent_change_btc
FROM gold_btc
GROUP BY YEAR(date) ORDER BY 1;




--Creating Views to store data for visualization

CREATE VIEW btc_percentage_price_change AS
SELECT
	YEAR(Date) AS year
	,ROUND(AVG(Adj_Close_BTC),2) AS btc_price
	,ROUND(((MAX(Adj_Close_BTC)  -  MIN(Adj_Close_BTC)) / MAX(Adj_Close_BTC)) * 100,2) AS percent_change_btc
FROM crypto
GROUP BY YEAR(Date) --ORDER BY 1;



CREATE VIEW gold_percentage_price_change AS
SELECT TOP 6
	YEAR(Date) AS year
	,ROUND(AVG(GOLD),2) AS gold_price
	,ROUND(((MAX(GOLD)  -  MIN(GOLD)) / MAX(GOLD)) * 100,2) AS percent_change_gold
FROM commodities
GROUP BY YEAR(Date) ORDER BY 1 DESC;


CREATE VIEW commodities_price AS
SELECT 
	YEAR(Date) AS YEAR 
	,ROUND(AVG(NATURAL_GAS),2) AS NATURAL_GAS
	,ROUND(MAX(NATURAL_GAS),2) AS highest_value_gas
	,ROUND(MIN(NATURAL_GAS),2) AS lowest_value_gas
	,ROUND(((MAX(NATURAL_GAS)  -  MIN(NATURAL_GAS)) / MAX(NATURAL_GAS)) * 100,2) AS percent_change_gas
	,ROUND(AVG(GOLD),2) AS GOLD
	,ROUND(MAX(GOLD),2) AS highest_value_gold
	,ROUND(MIN(GOLD),2) AS lowest_value_gold
	,ROUND(((MAX(GOLD)  -  MIN(GOLD)) / MAX(GOLD)) * 100,2) AS percent_change_gold
	,ROUND(AVG(WTI_CRUDE),2) AS CRUDE 
	,ROUND(MAX(WTI_CRUDE),2) AS highest_value_crude
	,ROUND(MIN(WTI_CRUDE),2) AS lowest_value_crude
	,ROUND(((MAX(WTI_CRUDE)  -  MIN(WTI_CRUDE)) / MAX(WTI_CRUDE)) * 100,2) AS percent_change_crude
	,ROUND(MAX(BRENT_CRUDE),2) AS highest_value_brent
	,ROUND(MIN(BRENT_CRUDE),2) AS lowest_value_brent
	,ROUND(((MAX(BRENT_CRUDE)  -  MIN(BRENT_CRUDE)) / MAX(BRENT_CRUDE)) * 100,2) AS percent_change_brent
	,ROUND(AVG(GASOLINE),2) AS GASOLINE
	,ROUND(MAX(GASOLINE),2) AS highest_value_gasoline
	,ROUND(MIN(GASOLINE),2) AS lowest_value_gasoline
	,ROUND(((MAX(GASOLINE)  -  MIN(GASOLINE)) / MAX(GASOLINE)) * 100,2) AS percent_change_petrol
FROM commodities
GROUP BY YEAR(Date) --ORDER BY YEAR(Date);



CREATE VIEW gold_btc_cost AS
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
GROUP BY YEAR(date) --ORDER BY 1;
