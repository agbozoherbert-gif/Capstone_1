# Oregon Online Sales Analysis

## Project Overview

This project analyzes online sales for the **Oregon territory** using SQL and Excel. The goal is to answer the sales manager's questions about overall revenue, revenue trends, regional performance, product-category purchasing activity, and opportunities for the next quarter.

The analysis uses the `sample_sales` database and focuses on transactions where `ShiptoState = 'Oregon'`.

## Tools

- **MySQL Workbench** — querying and analyzing the sales database
- **SQL** — filtering, joining, aggregating, and ranking sales data
- **Microsoft Excel** — organizing query results and creating visualizations
- **Git and GitHub** — version control and project documentation

## Project Files

| File | Description |
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
- **Last transaction date:** December 30, 2025

These dates describe the earliest and latest Oregon online sales records in the dataset.

### 2. Revenue by Year and Month

Monthly revenue was grouped by calendar year and month for 2022 through 2025. The results are provided in `oregon_monthly_revenue.csv` and visualized in the Excel workbook.

The monthly comparison chart helps show how Oregon's online revenue varied over the reporting period. The 2025 results cover a substantially smaller number of transactions than the earlier years in the supplied data, so comparisons with full prior years should be interpreted carefully.

### 3. Oregon Compared with the West Region

- **Oregon online revenue:** $7,646,700.17
- **West-region online revenue:** $68,004,827.05
- **Oregon share of West-region online revenue:** approximately 11.24%

This comparison uses online sales for both Oregon and the West region.

### 4. Product-Category Purchasing Activity

The category analysis measures total transactions and average transaction amount for each product category across Oregon online sales.

| Product Category | Transactions | Average Transaction Amount |
| Books (General) | 7,216 | $151.08 |
| Apparel and Merchandise | 3,218 | $142.31 |
| Textbooks | 2,546 | $798.71 |
| Art Supplies | 1,924 | $166.71 |
| Technology & Accessories | 1,917 | $1,906.57 |
| Stationery and Supplies | 1,683 | $53.11 |
| **Total** | **18,504** | — |

**Key observations:**

- Books (General) has the highest transaction volume, with 7,216 transactions.
- Technology & Accessories has the highest average transaction amount, at $1,906.57, despite having fewer transactions than Books (General).
- Textbooks also have a comparatively high average transaction amount, at $798.71.
- Stationery and Supplies has the lowest average transaction amount, at $53.11.

The product-category chart focuses on average transaction amount. The supporting PivotTable retains the transaction counts and category averages.

### 5. State-Level Online Sales Ranking

The SQL analysis includes a state-level online sales ranking to provide context for Oregon's performance within the broader online sales territory. Refer to the query results in `agbozo_sales_analysis.sql` and MySQL Workbench for the complete ranking.

## Business Recommendation

For the next quarter, prioritize Oregon online sales opportunities in **Books (General)** and **Technology & Accessories**, using different approaches for each category.

- **Books (General):** Its leading transaction volume indicates substantial customer purchasing activity. Consider targeted promotions intended to sustain engagement and encourage additional purchases.
- **Technology & Accessories:** Its much higher average transaction amount makes it a category worth investigating for revenue-growth opportunities. Consider focused campaigns and product offers while monitoring transaction volume and total revenue.
- Use the monthly revenue results to plan campaign timing and monitor performance over time.
- Compare Oregon's results with other states in the West region to identify opportunities to improve its regional contribution.

These are recommendations based on transaction volume, average transaction amount, and revenue patterns. The analysis does not directly measure profit margins or customer retention, so those should be evaluated before making decisions based on profitability or repeat-purchase behavior.

## Excel Visualizations

The workbook `Agbozo_territory_chart.xlsx` contains two analyses:

1. **Oregon Monthly Revenue Comparison by Year (2022–2025)** — a PivotChart showing monthly revenue patterns across years.
2. **Oregon Average Transaction Amount by Product Category** — a category chart comparing average transaction amounts. Its supporting table includes transaction counts and category averages.

The monthly revenue PivotChart satisfies the project requirement to use Excel PivotChart options to visualize query results. The product-category visualization is an additional chart.

## Video Walkthrough

**Video link:** 

The walkthrough will explain the SQL analysis, findings for each business question, the recommendation, and the Excel visualizations.