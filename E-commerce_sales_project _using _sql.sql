--          E-COMMERCE SALES ANALYSIS PROJECT BY USING SQL  ---

-- Requirement.
use project_db;
-- 1.What is the total number of orders and total revenue?
select count(*) as total_orders,
round(sum(total_amount),2) as total_amount
from sales_data;

-- 2.Find the number of orders and total revenue for each category.
select category,count(*) as total_orders,
round(sum(total_amount),2) as total_revenue from sales_data 
group by category;

-- 3.Find total revenue by region, sorted from highest to lowest.
select region,
round(sum(total_amount),2) as total_revenue from sales_data
group by region
order by total_revenue desc;

-- 4.Which payment method is used the most?
select payment_method,
count(*) as most_use from sales_data
group by payment_method
order by most_use desc limit 1;

-- 5.Find the average order value (total_amount).
select round(avg(total_amount),2) as avg_order_value from sales_data;

-- 6.How many orders have been returned (returned = 'Yes')?
select count(*) as returned_ord_count from sales_data
where returned='Yes';

-- 7.Find the monthly revenue trend (from 2023 to 2025).
select date_format(order_date,"%Y-%m") as month,round(sum(total_amount),2) as monthly_revenue_trend from sales_data
group by date_format(order_date,"%Y-%m")
order by date_format(order_date,"%Y-%m") asc;

-- 8.Find the top 10 customers who spent the most.
select customer_id,
round(sum(total_amount),2) as Most_spent_cust from sales_data
group by customer_id
order by Most_spent_cust desc limit 10;

-- 9.Group customer age into buckets (18-24, 25-34, 35-44, 45-54, 55+) and find revenue for each group.
with mytab as (select *,
case
when customer_age>=18 and customer_age<=24 then '18-24'
when customer_age>=25 and customer_age<=34 then '25-34'
when customer_age>=35 and customer_age<=44 then '35-44'
when customer_age>=45 and customer_age<=54 then '45-54'
when customer_age>=55 then '55+'
end age_group from sales_data)
select age_group,round(sum(total_amount),2) as Revenue from mytab
group by age_group
order by age_group;

-- 10.Compare average order value across Male vs Female vs Other.
select customer_gender,
round(avg(total_amount),2) as avg_gender_wise from sales_data
group by customer_gender
order by avg_gender_wise desc;

-- 11.Find the average discount % for each category.
select category,round(avg(discount)*100,2) as avg_percent_discount from sales_data
group by category;

-- 12.Find the return rate % for each category (what % of orders were returned).
select category,
count(*) as total_orders,
round(100.0*sum(case when returned='Yes' then 1 else 0 end)/count(*),2) as percent_return from sales_data
group by category
order by percent_return desc;

-- 13.Find the return rate % for each payment method.
select payment_method,
count(*) as total_orders,
round(100.0*sum(case when returned='Yes' then 1 else 0 end)/count(*),2) as percent_return from sales_data
group by payment_method
order by percent_return desc;

-- 14.Find the average delivery time for each region.
select region,round(avg(delivery_time_days),2) as avg_delivery_time from sales_data group by region;

-- 15.Find total profit (sum of profit_margin) for each category — which category is running at a loss?
select category,round(sum(profit_margin),2)as total_profit from sales_data
group by category
order by total_profit asc;

-- 16.Find the month-over-month revenue growth % (how much revenue increased/decreased vs the previous month).
with monthly as (
    select date_format(order_date,'%Y-%m') as month,
    sum(total_amount) as revenue
    from sales_data
    group by date_format(order_date,'%Y-%m')
)
select month,
    round(revenue,2) as revenue,
    round(revenue - lag(revenue) over(order by month), 2) as change_vs_prev,
    round(100.0 * (revenue - lag(revenue) over(order by month)) / lag(revenue) over(order by month), 2) as growth_pct
from monthly
order by month;
-- 17.Find the top 3 customers in each region based on their total spend.
select * from (
select region,
       customer_id,
       round(sum(total_amount),2) as total_spend,
       rank()over(partition by region order by sum(total_amount) desc) as rnk
       from sales_data group by region,customer_id) as ranked
where rnk<=3;

-- 18.Find the cumulative (running total) revenue month by month 
with my as (select date_format(order_date,'%Y-%m') as month,
sum(total_amount) as total_revenue from sales_data group by date_format(order_date,'%Y-%m')),
mytab as (select month,
				total_revenue,
sum(total_revenue)over(order by month) as running from my)
select * from mytab;

-- 19.Find the top 3 categories by revenue within each region.
select * from (select 
                region,
               category,
               round(sum(total_amount),2) as total_spend,
               rank()over(partition by region order by sum(total_amount) desc) as rnk
               from sales_data group by region,category) as ranked
where rnk<=3;

-- 20.Bucket delivery time into Fast (≤3 days), Medium (4-6 days), Slow (7+ days), and check which speed bucket has the highest return rate.
with my_buckets as (select *,
case
when delivery_time_days<=3 then 'Fast'
when delivery_time_days>=4 and delivery_time_days<=6 then 'Medium'
when delivery_time_days>=7 then 'Slow' end  delivery_bucket from sales_data)
select delivery_bucket,
      count(*) as total_orders,
      round(100.0*sum(case when returned='Yes' then 1 else 0 end)/count(*),2) as del_per_buck from my_buckets
      group by delivery_bucket
      order by del_per_buck desc;
