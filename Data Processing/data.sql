--- This is to check if my table is properly uploaded and how my data looks before i start interogating it
SELECT *
FROM bright.coffe_shop.sales
LIMIT 100;

---- checking the opening time and closing time
--- what are the business hours of the shop
SELECT MIN(transaction_time) AS opening_time,
       MAX(transaction_time) AS closing_time
FROM bright.coffe_shop.sales;

---- How many stores do we have?
--- To check the name of store locations that i have
SELECT DISTINCT store_location
FROM bright.coffe_shop.sales;

--- what is the period of this data
-- whe did we start collecting data, and when did we stop collecting data
SELECT MIN(transaction_date) AS first_day,
       MAX(transaction_date) AS last_day
FROM bright.coffe_shop.sales;

--- How many products are we selling per store
SELECT store_location, 
COUNT(DISTINCT product_id) AS number_of_products
FROM bright.coffe_shop.sales
GROUP BY store_location;
--- how many products are we selling in total
SELECT COUNT(DISTINCT product_id) AS number_of_products
FROM bright.coffe_shop.sales;

--- what are the different product categories do we have
SELECT DISTINCT product_category
FROM bright.coffe_shop.sales;
--- how many products are we selling in each category
SELECT DISTINCT product_category, product_type, product_detail
FROM bright.coffe_shop.sales;

SELECT DISTINCT product_category, product_type, product_detail
FROM bright.coffe_shop.sales
WHERE product_category= 'Coffee'
ORDER BY product_type;

--- droping the table
DROP TABLE IF EXISTS bright.coffe_shop.sales;
--- This is to check if my table is properly uploaded and how my data looks before i start interogating it
SELECT *
FROM bright.coffe_shop.sales;
