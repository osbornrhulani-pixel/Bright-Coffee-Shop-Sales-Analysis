--- This is to check if my table is properly uploaded and how my data looks before i start interogating it
SELECT *
FROM bright.coffe_shop.sales
LIMIT 100;
---- big code
    SELECT transaction_date,--- from original table
           DAYNAME(transaction_date) AS Day_name,      --- this gives the name of a specific date. this will be a new column
           MONTHNAME(transaction_date) AS Month_name,    ---- this gives the name of a month. this will be a new column
    ---- sales metrics 
           COUNT(transaction_id) AS number_of_sales,    ---- counting all the rows. this will be a new column
           SUM(transaction_qty) AS units_sold,          ---- calculating the total units sold. this will be a new column
           COUNT(DISTINCT product_id) AS unique_products, --- counting the number of unique product. this will be a new column
           COUNT(DISTINCT store_id) AS number_of_stores,    ---- counting the number of stores. this will be a new column
    ---- Total revenue
           ROUND(SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)),2) AS total_amount,--- calculating the total revenue. this is the new column.
     --- 1. case statement always create buckets for enhanced analyses       
     ---- this case statement is classifying the DAYNAME column into day classification      
           CASE 
               WHEN Day_name IN('Sun','Sat') THEN 'Weekend'
               WHEN Day_name IN('Mon','Tue','Wed','Thu','Fri') THEN 'Weekday'
           END AS day_classification,
     ---- this case statement is classifying the transaction time into day time buckets
           CASE
               WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN '01. Morning'
               WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN '02. Afternoon'
               WHEN transaction_time BETWEEN '18:00:00' AND '20:59:59' THEN '03. Evening'
           END AS time_classification,
           store_location,
           product_category,
           product_type,
           product_detail
FROM bright.coffe_shop.sales
GROUP BY transaction_date,
       store_location,
       product_category,
       product_type,
       product_detail,
       transaction_time,
       day_name,
       month_name;
       
    
       --transaction_date,
       --store_location,
       --product_category,
       --product_type,
       --product_detail,
       --transaction_time,
       --day_name,
       --month_name;
----- total revenue 
SELECT
       SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS total_revenue
FROM bright.coffe_shop.sales;
