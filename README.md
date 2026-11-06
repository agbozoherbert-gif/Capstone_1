# Oregon Online Sales Analysis

## Project Overview

This project analyzes EmporiUm's online sales performance in the Oregon territory using SQL and Excel. As a data analyst, I examined revenue trends, product-category performance, and Oregon's contribution to the West Region to identify business insights and recommend areas of focus for the next quarter.

The analysis uses the `sample_sales` database and focuses on transactions where `ShiptoState = 'Oregon'`.

**Reporting period:** December 31, 2021 through December 31, 2025.

## Tools

- **MySQL Workbench** — querying and analyzing the sales database
- **SQL** — filtering, joining, aggregating, and ranking sales data
- **Microsoft Excel** — organizing query results and creating visualizations
- **Git and GitHub** — version control and project documentation

## Key SQL Functions and Concepts

The analysis uses the following SQL functions and concepts:

- **COUNT()** — counts transactions and records.
- **SUM()** — calculates total sales revenue.
- **AVG()** — calculates average transaction amounts.
- **MIN() and MAX()** — identifies the earliest and latest transaction dates and compares values.
- **GROUP BY** — organizes sales data by year, month, state, and product category.
- **YEAR() and MONTH()** — extracts the year and month from transaction dates.
- **JOIN** — combines sales, product, and inventory category tables.
- **WITH (CTE)** — creates a temporary named result set to organize more complex queries.
- **ROW_NUMBER() and OVER()** — ranks individual transactions to calculate the median transaction amount.
- **LAG()** — compares annual revenue with the previous year's revenue.
- **RANK()** — ranks states based on total online sales.
- **UNION ALL** — combines results from separate queries.
- **CAST()** — converts calculated values into specific data types and formats.


## Project Files

| File | Description |
|---|---|
| `agbozo_sales_analysis.sql` | SQL queries for the Oregon online sales analysis |
| `Agbozo_territory_chart.xlsx` | Excel workbook containing the monthly revenue and product-category analyses and charts |
| `oregon_monthly_revenue.csv` | Monthly Oregon revenue results used for the monthly revenue PivotChart |
| `oregon_product_category_analysis.csv` | Oregon product-category transaction counts and average transaction amounts |
| `README.md` | Project overview, findings, and recommendation |

## Analysis and Findings

### 1. Overall Oregon Revenue and Reporting Period

- **Total transactions:** 18,504
- **Total revenue:** $7,646,700.17
- **First transaction date:** December 31, 2021
- **Last transaction date:** December 31, 2025
- **Average transaction amount:** $413.25
- **Median transaction amount:** $142.24

These dates describe the earliest and latest Oregon online sales records in the dataset.

### 2. Revenue by Year and Month

Monthly revenue was grouped by calendar year and month for 2022 through 2025. The results are provided in `oregon_monthly_revenue.csv` and visualized in the Excel workbook.

| Year | Transactions | Revenue |
|---|---:|---:|
| 2022 | 6,406 | $2,500,108.97 |
| 2023 | 5,362 | $2,236,753.75 |
| 2024 | 5,410 | $2,286,601.68 |
| 2025 | 1,326 | $623,235.77 |

Revenue declined by **72.74% in 2025 compared with 2024**. All 12 months of 2025 are represented in the dataset, so this is a full-year comparison. The analysis identifies the decline but does not establish its cause; further investigation is needed to understand what changed.

The monthly comparison chart helps show how Oregon's online revenue varied across the four years.

### 3. Oregon Compared with the West Region

- **Oregon online revenue:** $7,646,700.17
- **West-region online revenue:** $68,004,827.05
- **Oregon share of West-region online revenue:** approximately 11.24%

Oregon ranked **third among 29 states** in total online sales, behind California and Washington. This comparison uses online sales for both Oregon and the West region.

### 4. Product-Category Purchasing Activity

The category analysis measures transaction counts, average transaction amounts, and total revenue for each product category across Oregon online sales.

| Product Category | Transactions | Average Transaction Amount | Revenue |
|---|---:|---:|---:|
| Books (General) | 7,216 | $151.08 | $1,090,205.67 |
| Apparel and Merchandise | 3,218 | $142.31 | $457,957.25 |
| Textbooks | 2,546 | $798.71 | $2,033,514.02 |
| Art Supplies | 1,924 | $166.71 | $320,740.91 |
| Technology & Accessories | 1,917 | $1,906.57 | $3,654,893.37 |
| Stationery and Supplies | 1,683 | $53.11 | $89,388.95 |
| **Total** | **18,504** | **$413.25 overall average** | **$7,646,700.17** |

**Key observations:**

- Books (General) has the highest transaction volume, with 7,216 transactions.
- Technology & Accessories generates the most revenue and has the highest average transaction amount, at $1,906.57.
- Textbooks generate more than $2 million in revenue and have an average transaction amount of $798.71.
- Technology & Accessories and Textbooks together account for approximately **74% of Oregon revenue**.
- Stationery and Supplies has the lowest average transaction amount, at $53.11.

The product-category chart focuses on average transaction amount. The supporting PivotTable retains the transaction counts and category averages.

### 5. State-Level Online Sales Ranking

The SQL analysis ranks online sales across 29 states. Oregon placed **third**, with $7,646,700.17 in online revenue. California ranked first with $14,860,811.63, followed by Washington with $11,892,314.83.

## Business Recommendation

For the next quarter, prioritize Oregon online sales opportunities in **Technology & Accessories, Books (General), and Textbooks**, using different approaches for each category.

- **Technology & Accessories:** This category generates the highest revenue and average transaction amount in Oregon. Consider focused campaigns and product offers while monitoring transaction volume and total revenue.
- **Books (General):** Its leading transaction volume indicates substantial customer purchasing activity. Consider targeted promotions intended to sustain engagement and encourage additional purchases.
- **Textbooks:** With more than $2 million in revenue and an average transaction amount of $798.71, this category is another opportunity for targeted promotions.
- Use the monthly revenue results to plan campaign timing and monitor performance over time.
- Compare Oregon's results with California and Washington, particularly in Technology & Accessories, where both states generate higher revenue and transaction volume.

These are recommendations based on transaction volume, average transaction amount, and revenue patterns. The analysis does not directly measure profit margins or customer retention, so those should be evaluated before making decisions based on profitability or repeat-purchase behavior. The reason for the 2025 revenue decline should also be investigated before setting future targets.

## Excel Visualizations

The workbook `Agbozo_territory_chart.xlsx` contains four worksheets:

1. **Monthly Revenue Chart** — a PivotChart showing monthly revenue patterns across 2022–2025.
2. **Monthly Revenue Analysis** — supporting monthly revenue results.
3. **Product Category Chart** — a chart comparing average transaction amounts by category.
4. **Product Category Analysis** — supporting category transaction counts, average transaction amounts, and revenue.

The monthly revenue PivotChart satisfies the project requirement to use Excel PivotChart options to visualize query results. The product-category visualization is an additional chart.

## Video Walkthrough

**Video link:** 

The walkthrough will explain the SQL analysis, findings for each business question, the recommendation, and the Excel visualizations.