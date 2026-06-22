# TheLook-Ecommerce-Analytics project
Overview
## Executive Dashboard

![Executive Dashboard](dashboards/executive_overview.png)

## Product Analytics Dashboard

![Product Analytics](dashboards/product_analytics.png)
This project analyzes the TheLook Ecommerce Dataset from Google BigQuery to uncover insights into customer behavior, product performance, revenue trends, retention, and conversion funnels. The goal is to transform raw ecommerce data into actionable business insights through SQL analysis and interactive dashboards.
Business Problem
Ecommerce companies generate large amounts of transactional and behavioral data. However, without proper analysis, it is difficult to understand:
Which products generate the most revenue
Who the most valuable customers are
How customer retention changes over time
Where customers drop off in the purchase journey
Which business areas require optimization
This project addresses these questions using data analytics and business intelligence techniques.
Dataset
Source: TheLook Ecommerce Dataset (https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sbigquery-public-data!2sthelook_ecommerce)

Main Tables
Users
Orders
Order Items
Products
Inventory Items
Events
Distribution Centers

#Tools & Technologies
SQL
Google BigQuery
Power BI
Looker Studio

#Analytics Framework
1. Executive Overview
Key business KPIs:
Total Revenue
Total Orders
Total Customers
Active Customers
Purchase Rate
Repeat Purchase Rate
2. Product Analytics
Analyzed:
Revenue by category
Best-selling products
Top-performing categories
Inventory vs sales performance
Product contribution to revenue
3. Customer Analytics
Analyzed:
Customer segmentation
Customer lifetime value indicators
Purchasing behavior
Gender and age distribution
High-value customer groups
4. Retention Analytics
Analyzed:
Cohort retention
Repeat purchase behavior
Customer retention trends
Customer churn indicators
5. Funnel Analytics
Analyzed:
Session → View
View → Cart
Cart → Purchase
Funnel conversion rates
Drop-off analysis
6. Geographic Analytics
Analyzed:
Revenue by country
Customer distribution
Regional performance
Geographic sales trends
Key Results
Business KPIs
KPI
Value
Total Revenue
$2.66M+
Total Orders
181,042
Total Customers
31,141
Active Customers
27,387
Purchase Rate
85.53%
Repeat Purchase Rate
12.39%

#Insights
Revenue exceeded $2.6 million during the analysis period.
A small group of customers generated a significant share of total revenue.
Product category performance varied considerably across segments.
Retention rates declined over time, highlighting opportunities for customer engagement strategies.
Funnel analysis identified stages with the highest customer drop-off.
Dashboard Preview
Executive Overview
Product Analytics
Customer Analytics
Retention Analytics
Funnel Analytics
Geographic Analytics
Project Structure
thelook-ecommerce-analytics/
│
├── README.md
├── sql/
│   ├── executive_overview.sql
│   ├── product_analytics.sql
│   ├── customer_analytics.sql
│   ├── retention_analysis.sql
│   └── funnel_analysis.sql
│
├── dashboards/
│   ├── executive_overview.png
│   ├── product_analytics.png
│   ├── customer_analytics.png
│   ├── retention_analytics.png
│   ├── funnel_analytics.png
│
├── presentation/
│   └── Ecommerce_Analytics_Presentation.pdf
│
└── docs/
    └── Project_Report.pdf

#Skills Demonstrated
SQL Querying
Data Cleaning
Data Analysis
Business Intelligence
Data Visualization
Dashboard Design
Customer Analytics
Cohort Analysis
Funnel Analysis
Data Storytelling

Author
Muhiddin
MBA in IT |Big Data Analytics Enthusiast
Connect With Me
LinkedIn:
⭐️ If you found this project interesting, feel free to star the repository and connect with me on LinkedIn.
