
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    region VARCHAR(100),
    city VARCHAR(100),
    UNIQUE (customer_name, region, city)
);


INSERT INTO customers (customer_name, region, city)
SELECT DISTINCT customer_name, region, city
FROM clean_sales;


CREATE TABLE products (product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(100),
sub_category VARCHAR(100),
UNIQUE(product_name, category, sub_category));

INSERT INTO products (product_name, category, sub_category)
SELECT DISTINCT product_name, category, sub_category
FROM clean_sales;


CREATE TABLE orders (order_id INTEGER PRIMARY KEY,
order_date DATE,
payment_mode VARCHAR(100),
customer_id INTEGER REFERENCES customers(customer_id));

INSERT INTO orders(order_id, order_date, customer_id, payment_mode)
SELECT DISTINCT
cs.order_id, 
cs.order_date, 
c.customer_id,
cs.payment_mode
FROM clean_sales cs
JOIN customers c
ON cs.customer_name = c.customer_name
AND cs.region = c.region
AND cs.city = c.city;


CREATE TABLE order_items(order_items_id SERIAL PRIMARY KEY,
order_id INTEGER REFERENCES orders(order_id),
product_id INTEGER REFERENCES products(product_id),
quantity INTEGER,
unit_price NUMERIC(10,2),
discount NUMERIC(6,4),
sales NUMERIC(10,2),
profit NUMERIC(10,2));

INSERT INTO order_items(order_id,
product_id,
quantity,
unit_price,
discount,
sales,
profit)
SELECT cs.order_id,
p.product_id,
cs.quantity,
cs.unit_price,
cs.discount,
cs.sales,
cs.profit
FROM clean_sales cs
JOIN products p
ON cs.product_name = p.product_name
AND cs.category = p.category
AND cs.sub_category = p.sub_category;
