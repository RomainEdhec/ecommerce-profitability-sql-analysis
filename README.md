# ecommerce-profitability-sql-analysis
SQL-based profitability analysis using PostgreSQL (data modeling, KPI analysis, margin optimization).
Project Overview

This project analyzes a simulated e-commerce dataset (5,000 transactions, 2024–2025) to evaluate overall profitability and identify potential improvement levers.

The objective was to approach the dataset as a data analyst would in a real business context: structure the data, compute key performance indicators (KPIs), and interpret the results from a strategic perspective.

All analyses were conducted using PostgreSQL (pgAdmin).

Business Problem :

How can the company improve its overall profitability?

The analysis focuses on identifying structural imbalances across categories, regions, discounts, and products that could explain variations in profit margins.

Tools Used : PostgreSQL (pgAdmin), SQL (data modeling, cleaning, KPI analysis)

Data Preparation & Modeling :

The raw CSV dataset was first imported into PostgreSQL using a staging table.
Data types were explicitly casted (dates, numeric fields, integers) to ensure analytical consistency.
The dataset was then normalized into four relational tables:

customers, products, orders, order_items

Primary and foreign keys were implemented to guarantee relational integrity and allow efficient analytical queries.
This structure enabled clean aggregation and KPI computation.

KPI Analysis

The following key metrics were calculated:

Overall Profitability :

Global revenue and total profit
Overall profit margin: 14.94%

Category Analysis :

Margin range: 14.2% – 15.35%
Balanced revenue distribution across categories
No significant structural imbalance detected

Regional Analysis :

Margin range: 14.81% – 15.12%
North region generates the highest total profit due to higher sales volume
Limited variation in regional profitability

Discount Impact :

Discounts between 0% and 20%
No major margin collapse at higher discount levels
Margins remain relatively stable across discount brackets

Product-Level Analysis :

Individual product margins range from ~5% to ~25%
Distribution is relatively uniform
Potential optimization could rely on product mix adjustments

Key Insights :

The dataset presents a structurally balanced profitability model.
No major structural inefficiencies were identified across categories or regions.

Profitability remains stable around ~15%.

Improvements would likely require micro-optimizations (e.g., product mix strategy) rather than large structural adjustments.
