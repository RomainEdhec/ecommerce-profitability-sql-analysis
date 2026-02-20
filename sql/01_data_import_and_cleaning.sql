CREATE TABLE raw_sales(
order_id VARCHAR(100),
order_date VARCHAR(100),
customer_name VARCHAR(100),
region VARCHAR(100),
city VARCHAR(100),
category VARCHAR(100),
sub_category VARCHAR(100),
product_name VARCHAR(100),
quantity VARCHAR(100),
unit_price VARCHAR(100),
discount VARCHAR(100),
sales VARCHAR(100),
profit VARCHAR(100),
payment_mode VARCHAR(100)
);



CREATE TABLE clean_sales AS
SELECT CAST(order_id AS INTEGER) AS order_id,
CAST(order_date AS DATE) AS order_date,
customer_name,
region,
city,
category,
sub_category,
product_name,
CAST(quantity AS INTEGER) AS quantity,
CAST(unit_price AS NUMERIC) AS unit_price,
CAST(discount AS NUMERIC)/100 AS discount,
CAST(sales AS NUMERIC) AS sales,
CAST(profit AS NUMERIC) AS profit,
payment_mode
FROM raw_sales;
