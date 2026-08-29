# 🛒 E-Commerce Sales Analysis | SQL + Power BI

A complete data analysis project on a 34,500-order e-commerce dataset — from writing SQL queries to answer real business questions, to building an interactive Power BI dashboard for stakeholder-style reporting.

---

## 📌 Project Overview

This project analyzes e-commerce transaction data (2023–2025) across **7 product categories**, **5 regions**, and **6 payment methods** to uncover insights around revenue, customer behavior, product performance, and returns.

**Goal:** Simulate a real data analyst workflow — clean/structure data, write SQL to answer business questions, then visualize the findings in a dashboard a manager could actually use.

---

## 🧰 Tools & Skills Used

| Category | Tools / Concepts |
|---|---|
| Database | MySQL / SQLite |
| Querying | Aggregations, `GROUP BY`, `CASE WHEN`, Joins |
| Advanced SQL | CTEs (`WITH`), Window Functions (`RANK()`, `LAG()`, `SUM() OVER`) |
| Visualization | Power BI (DAX, slicers, KPI cards) |


## 📊 Dataset

- **Rows:** 34,500 orders
- **Columns:** order_id, customer_id, product_id, category, price, discount, quantity, payment_method, order_date, delivery_time_days, region, returned, total_amount, shipping_cost, profit_margin, customer_age, customer_gender
- **Time range:** 2023 – 2025

---

## ❓ Business Questions Solved (20 SQL Queries)

<details>
<summary><b>🟢 Beginner (Q1–Q6)</b></summary>

1. Total number of orders and total revenue
2. Orders and revenue by category
3. Revenue by region (highest to lowest)
4. Most-used payment method
5. Average order value
6. Total number of returned orders

</details>

<details>
<summary><b>🟡 Intermediate (Q7–Q15)</b></summary>

7. Monthly revenue trend (2023–2025)
8. Top 10 customers by total spend
9. Revenue by customer age group (18-24, 25-34, 35-44, 45-54, 55+)
10. Average order value by gender
11. Average discount % per category
12. Return rate % per category
13. Return rate % per payment method
14. Average delivery time per region
15. Total profit per category (identifying loss-making categories)

</details>

<details>
<summary><b>🔴 Advanced — CTEs & Window Functions (Q16–Q20)</b></summary>

16. Month-over-month revenue growth % (`LAG()`)
17. Top 3 customers per region (`RANK() OVER PARTITION BY`)
18. Cumulative running-total revenue by month (`SUM() OVER`)
19. Top 3 categories by revenue per region
20. Return rate by delivery-speed bucket (Fast / Medium / Slow)

## 💡 Key Insights

- 💰 **Total revenue:** ₹58.6L+ across 34,500 orders, average order value of ₹170
- 📦 **Electronics** is the dominant category — generating **~3x more revenue** than the next highest category (Home)
- 🌍 **South region** leads in revenue, while **Central region trails ~27% behind** — a potential area for targeted marketing
- 🔄 **Overall return rate: 5.52%**, but **Fashion (8.28%) and Electronics (7.3%)** have notably higher return rates — worth investigating for sizing/quality issues
- 🚚 Delivery speed shows **little correlation with returns** (Fast: 5.24%, Medium: 5.57%, Slow: 5.49%) — returns are more likely product-driven than shipping-driven
- 👥 Customers aged **55+ contribute the highest revenue** by age group
- 📈 Revenue shows **seasonal fluctuation** month-to-month rather than a steady trend, useful for demand planning

---

## 📈 Power BI Dashboard

An interactive dashboard was built on top of the SQL analysis, featuring:

- **KPI cards:** Total Orders, Total Revenue, Avg Order Value, Returned Orders
- **Filters/Slicers:** Category, Region, Month-Year
- **Monthly Trend Analysis** — revenue trend line chart
- **Payment Method by Orders** — bar chart
- **Age Group by Revenue** — bar chart
- **Region by Total Profit** — donut chart
- **Top 10 Customers by Total Amount** — bar chart
- **Category-wise & Payment-method-wise Return Rate** — tables
- **Category by Revenue** — icicle/treemap chart

## 🚀 How to Use

1. **Run the SQL:** Open `ecommerce.db` in MySQL Workbench / DB Browser for SQLite and run queries from `analysis_queries.sql`
2. **View the dashboard:** Open `ecommerce_dashboard.pbix` in Power BI Desktop (free)

---

## 🎯 What This Project Demonstrates

- Ability to translate business questions into SQL logic
- Comfort with advanced SQL (CTEs, window functions, ranking, running totals)
- End-to-end workflow: raw data → analysis → visualization
- Data storytelling — turning numbers into decisions a business could act on

---

*Built as part of a Data Analyst portfolio.*
