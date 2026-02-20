#Overall profitability 

CREATE OR REPLACE VIEW overall_profitability AS
SELECT SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND((SUM(profit) / NULLIF(SUM(sales),0)) * 100, 2) AS margin_rate
FROM order_items;

#Margin rate per category


CREATE OR REPLACE VIEW profitability_per_category AS
SELECT p.category, ROUND(SUM(oi.profit) / NULLIF(SUM(oi.sales), 0) * 100, 2) AS margin_rate_per_category
FROM order_items AS oi
JOIN products p
ON p.product_id = oi.product_id
GROUP BY p.category;

SELECT category, margin_rate_per_category
FROM profitability_per_category;

#Total sales per category

CREATE OR REPLACE VIEW sales_per_category AS
SELECT p.category, SUM(oi.sales) AS total_sales
FROM products p
JOIN order_items oi
ON oi.product_id = p.product_id
GROUP BY p.category;


#Order amount per category

CREATE OR REPLACE VIEW order_amount AS
SELECT p.category, COUNT(order_id) AS total_order
FROM products p
JOIN order_items oi
ON oi.product_id = p.product_id
GROUP BY p.category;

#Comparison between margin rate, total profit and total sales per region


CREATE OR REPLACE VIEW margin_rate_vs_profit_vs_ca_per_region AS
SELECT c.region, ROUND(SUM(oi.profit)/NULLIF(SUM(oi.sales), 0) * 100, 2) AS margin_rate, 
SUM(oi.profit) AS total_profit, 
SUM(oi.sales) AS total_sales
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
JOIN order_items oi
ON oi.order_id = o.order_id
GROUP BY c.region;

#Discount impact on margin

CREATE OR REPLACE VIEW discount_rate_vs_margin AS
SELECT COUNT(*) AS number_of_order_lines, ROUND(discount, 2) AS discount_rate,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS margin_rate
FROM order_items 
GROUP BY discount_rate;

#10 most profitable products

CREATE OR REPLACE VIEW ten_most_profitable AS
SELECT COUNT(*) AS number_of_order_lines, 
ROUND(SUM(oi.profit) / NULLIF(SUM(oi.sales), 0) * 100, 2) AS margin_rate
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id
LIMIT 10;


#10 least profitable products

CREATE OR REPLACE VIEW ten_less_profitable AS
SELECT COUNT(*) AS number_of_order_lines, 
ROUND(SUM(oi.profit) / NULLIF(SUM(oi.sales), 0) * 100, 2) AS margin_rate
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id
LIMIT 10;
