-- Capstone 1: ANALYSIS W/ SQL & EXCEL
-- SALES TERRITORY: OREGON
-- HERBERT AGBOZO
-- DATA BOOTCAMP: NIGEL CALDON

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(SalesTotal) AS Total_Revenue,
    AVG(SalesTotal) AS Average_Transaction,
    MIN(Date) AS First_Transaction,
    MAX(Date) AS Last_Transaction
FROM Online_Sales;

SELECT
    YEAR(Date) AS Sales_Year,
    COUNT(*) AS Total_Transactions,
    SUM(SalesTotal) AS Total_Revenue
FROM Online_Sales
GROUP BY YEAR(Date)
ORDER BY Sales_Year;

-- SUMMARY STATISTICS AND ANNUAL SALES TRENDS
--
-- I used COUNT() to count transactions, SUM() to calculate
-- total revenue, and AVG() to find the average transaction amount.
--
-- MIN() and MAX() helped identify the first and last transaction dates.
--
-- I used WHERE to focus on Oregon when analyzing my territory.
-- YEAR() extracts the year from each transaction date, while
-- GROUP BY organizes the results by year.
--
-- These queries helped me understand overall sales performance
-- and compare Oregon's results with the entire database.


-- 1. What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?

SELECT COUNT(*) AS Total_Transactions,
       SUM(SalesTotal) AS Total_Revenue,
       MIN(Date) AS Start_Date,
       MAX(Date) AS End_Date
FROM online_Sales
WHERE ShiptoState = 'Oregon';

SELECT COUNT(*) AS Total_Transactions,
       SUM(SalesTotal) AS Total_Revenue,
       CAST(AVG(SalesTotal) AS DECIMAL(12,2))
       AS Average_Transaction_Value,
       MAX(SalesTotal) AS Largest_Transaction,
       MIN(SalesTotal) AS Smallest_Transaction,
       MIN(Date) AS Start_Date,
       MAX(Date) AS End_Date
FROM online_sales
WHERE ShiptoState = 'Oregon';


-- Average can be influenced by big, outlier transactions that can mislead an analysis.

WITH Ranked_Transactions AS 
( SELECT  SalesTotal,
       ROW_NUMBER() OVER ( 
       ORDER BY SalesTotal
       ) AS Transaction_Rank,
       COUNT(*) OVER () AS Total_Transactions
FROM online_sales
WHERE ShiptoState = 'Oregon'
       )
SELECT CAST(AVG(SalesTotal) AS DECIMAL(12,2))
       AS Median_Transaction_Value
FROM Ranked_Transactions
WHERE Transaction_Rank IN ( 
       FLOOR((Total_Transactions + 1)/2),
       FLOOR((Total_Transactions + 2)/2)
);

-- Median Transaction Value: 142.24
-- Average Transaction Value: 413.25
-- Total Revenue: $7,646,700.17
-- Total Transactions: 18,504
-- Reporting Period: 2021-12-31 to 2025-12-30

-- I started by establishing a baseline for Oregon's online
-- sales performance. Before investigating individual trends
-- or categories, I wanted to understand the overall size of
-- the territory's sales activity.
--
-- I used COUNT() and SUM() to measure transaction volume
-- and total revenue, while MIN() and MAX() identified the
-- reporting period.
--
-- I also expanded the analysis to include average, median,
-- largest, and smallest transaction values. I wanted to
-- understand whether the average transaction value accurately
-- represented typical purchasing activity or was influenced
-- by unusually large transactions.

-- I used WITH to create a CTE (Common Table Expression)
-- called Ranked_Transactions. This allowed me to organize
-- the transaction data before using it in the main query.
--
-- I learned ROW_NUMBER() to assign a number to each
-- transaction after sorting the SalesTotal values.
--
-- I also learned OVER(), which allows window functions
-- like ROW_NUMBER() and COUNT() to work across the rows
-- without combining them into a single result.
--
-- I used these concepts together to identify the middle
-- transaction value and calculate the median.




-- 2. What is the revenue breakdown by year and month for the sales territory?

SELECT YEAR(Date) AS Oregon_Sales_Year,
       MONTH(Date) As Oregon_sales_Month,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY YEAR(Date),
       MONTH(Date)
ORDER BY Oregon_Sales_Year,
       Oregon_Sales_Month;

-- Expand Annual Analysis

SELECT YEAR(Date) AS Oregon_Sales_Year,
       COUNT(*) AS Total_Transactions,
       SUM(SalesTotal)
       AS Total_Revenue,
       CAST(AVG(SalesTotal) AS DECIMAL(12,2))
       AS Average_Transaction_Value
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY
       YEAR(Date)
ORDER BY Oregon_Sales_Year;  

-- Calculate Annual Revenue

WITH Annual_Revenue AS (
       SELECT YEAR(Date) AS Oregon_Sales_Year,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY YEAR(Date)
)
-- Compare each year with the previous

SELECT Oregon_Sales_Year,
       Total_Revenue,
-- Retrieve revenue of previous year

       LAG(Total_Revenue) OVER(
ORDER BY Oregon_Sales_Year
) AS Previous_Year_Revenue,
-- Calculate percentage increase or decrease

CAST( (
       (Total_Revenue - LAG(Total_Revenue) OVER(
       ORDER BY Oregon_Sales_Year
       ))
       / LAG(Total_Revenue) OVER(
       ORDER BY Oregon_Sales_Year
       )
) * 100 AS DECIMAL(10,2)
) AS Revenue_Growth_Percentage
FROM Annual_Revenue
ORDER BY Oregon_Sales_Year;

-- YEAR-OVER-YEAR ANALYSIS:
-- Oregon revenue declined by 10.53% in 2023 compared
-- with 2022. Revenue recovered slightly in 2024,
-- increasing by 2.23%.
--
-- In 2025, recorded revenue declined by 72.74%
-- compared with 2024. However, 2025 also had
-- substantially fewer transactions. Additional
-- investigation of monthly data coverage is needed
-- before interpreting this as a decline in business
-- performance.

-- Total Revenue & Transactions by Month

SELECT MONTH(Date) AS Oregon_Sales_Month,
       COUNT(*) AS Total_Transactions,
       SUM(SalesTotal) AS Total_Revenue,
       CAST(AVG(SalesTotal) AS DECIMAL(12,2))
       AS Average_Transaction_Value
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY MONTH(Date)
ORDER BY Oregon_Sales_Month;

-- Lastly, I felt the previous query displayed the monthly
-- breakdown well, but there can be a better way to present 
-- it.

SELECT YEAR(Date) AS Oregon_Sales_Year,
       MONTH(Date) AS Oregon_Sales_Month,
       COUNT(*) AS Total_Transactions,
       SUM(SalesTotal) AS Total_Revenue,
       CAST(AVG(SalesTotal) AS DECIMAL(12,2))
       AS Average_Transaction_Value
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY YEAR(Date),
       MONTH(Date)
ORDER BY Oregon_Sales_Year,
       Oregon_Sales_Month;     

-- After establishing Oregon's overall sales performance,
-- I wanted to understand how revenue changed over time.
-- Looking at total revenue alone would not reveal whether
-- sales were increasing, declining, or fluctuating.
--
-- I initially separated revenue by year and month to
-- identify changes in sales activity. I then expanded
-- the annual analysis to include transaction volume and
-- average transaction value.
--
-- I also learned and used LAG() to compare each year's revenue with
-- the previous year. This allowed me to calculate
-- year-over-year growth and identify significant changes.
--
-- Finally, I organized the monthly analysis by both year
-- and month so that each month's performance could be
-- compared across the reporting period.    


-- 3. Provide a comparison of total revenue for the specific sales territory and the 
-- region it belongs to.

-- OREGON ONLINE SALES REVENUE

SELECT 'Oregon' AS Territory,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales 
WHERE ShiptoState = 'Oregon'

UNION ALL

-- WEST REGION ONLINE SALES REVENUE

SELECT 'West Region' AS Territory,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales; 

-- Product category performance across California, Oregon, and Washington.

SELECT os.ShiptoState,
       ic.Category AS Product_Category,
       COUNT(*) AS Total_Transactions,
       ROUND(AVG(os.SalesTotal),2) AS Average_Transaction_Amount,
       ROUND(SUM(os.SalesTotal),2) AS Total_Revenue
FROM online_sales AS os
JOIN products AS p
       ON os.ProdNum = p.ProdNum
JOIN inventory_categories AS ic
       ON p.Categoryid = ic.Categoryid
WHERE os.ShiptoState IN ('California','Oregon','Washington')
GROUP BY os.ShiptoState,
       ic.Category
ORDER BY os.ShiptoState,
       Total_Revenue DESC;

-- Oregon generated $7,646,700.17 compared with
-- $68,004,827.05 across the West Region's Online Sales.
-- This means Oregon contributed approximately 11.24%
-- of the region's total online revenue.

-- I wanted to understand how Oregon's online sales
-- contributed to the broader West Region.
--
-- I calculated Oregon's total online revenue separately and compared it with the total 
-- revenue generated across the Online Sales territory.
--
-- I used UNION ALL to present both figures together
-- so that the results could be compared directly.
--
-- I also explored product category performance across California, Oregon, and Washington. 
-- I wanted to identify similarities and differences in purchasing patterns across these 
-- three states.

-- 4. What is the number of transactions per month and average transaction amount by product
-- category for the sales territory? 

SELECT YEAR(os.Date) AS Oregon_Sales_Year,
       MONTH(os.DATE) AS Oregon_Sales_Month,
       ic.Category AS Product_Category,
       COUNT(*) AS Number_of_Transactions,
       CAST(AVG(os.SalesTotal) AS DECIMAL(12,2)) 
       AS Average_Transaction_Amount
FROM online_sales os
JOIN products p 
       ON os.ProdNum = p.ProdNum
JOIN inventory_categories ic 
       ON p.Categoryid = ic.Categoryid
WHERE os.ShiptoState = 'Oregon'
GROUP BY YEAR(os.Date),
       MONTH(os.Date),
       ic.Category
ORDER BY Oregon_Sales_Year,
       Oregon_Sales_Month,
       Product_Category;       

SELECT ic.category AS Product_Category,
       COUNT(*) AS Total_Transactions,
       CAST(AVG(os.SalesTotal) AS DECIMAL(12,2))
        AS Average_Transaction_Amount
FROM online_sales os
JOIN products p
    ON os.ProdNum = p.ProdNum
JOIN inventory_categories ic
    ON p.Categoryid = ic.Categoryid
WHERE os.ShiptoState = 'Oregon'
GROUP BY ic.Category
ORDER BY Total_Transactions DESC;       

-- I wanted to find out which product categories had the most transactions and which had the highest
-- average transaction amounts.
-- I used JOIN to connect Online_Sales, Products, and Inventory_Categories so I could identify
-- the category associated with each sale.
-- I used COUNT() to measure transaction volume, AVG()
-- to calculate average transaction amounts, and GROUP BY
-- to organize the results by category.
-- I first looked at the monthly results and then summarized the categories across the full 
-- reporting period to compare their overall performance.


-- 5. Can you provide a ranking of in-store sales performance by each store in the sales territory, 
-- or a ranking of online sales performance by state within an online sales territory?


SELECT ShiptoState AS State,
       CAST(SUM(SalesTotal) AS DECIMAL(12,2)) 
       AS Total_Revenue,
       RANK() OVER (ORDER BY SUM(SalesTotal) DESC)
       AS Sales_Rank
FROM Online_sales
GROUP BY ShiptoState
ORDER BY Sales_Rank;

-- Oregon ranked third among the 29 states, generating
-- $7,646,700.17 in online revenue. California ranked first,
-- followed by Washington in second place.

-- Being that Oregon is my assigned territory, I opted to rank the online sales by state.
-- I used SUM to calculate total revenue for each state and GROUP BY to organize the results.
-- After that, I used RANK paired with ORDER BY to rank every state from highest to lowest
-- revenue.
-- This helped me see where Oregon ranks amongst all shipping locations and also identify the
-- top performers in the region.


-- 6. Analysis: Sales are trending high in the Pacific Northwest, with California, Washington, 
-- and Oregon. What is your recommendation for where to focus sales attention in the next quarter?

-- SUMMARY ANALYSIS ANSWER:  For the next quarter, I recommend
-- prioritizing Oregon's online sales growth by focusing on
-- Technology & Accessories, Books (General), and Textbooks.
-- The analysis shows that Technology & Accessories generates
-- the highest revenue and average transaction amount in Oregon,
-- while Books (General) produces the highest number of
-- transactions. Textbooks also present an opportunity, with
-- over $2 million in revenue and an average transaction amount
-- of $798.71. I recommend exploring targeted promotions for
-- these categories while continuing to support the strong sales
-- activity in Books (General). California and Washington should
-- also serve as benchmarks, particularly in Technology &
-- Accessories, where both states generate higher revenue and
-- transaction volume than Oregon. By using these comparisons
-- alongside monthly sales trends, the business can identify
-- opportunities to increase Oregon's revenue and strengthen
-- its contribution to the West Region.

