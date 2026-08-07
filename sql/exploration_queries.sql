-- Chocolate Sales Database Exploration
-- ==========================================
-- View tables
SHOW TABLES;

-- Examine table structures
DESCRIBE sales;
DESCRIBE products;
DESCRIBE customers;
DESCRIBE stores;
DESCRIBE calendar;

-- Count records 
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_stores FROM stores;
SELECT COUNT(*) AS total_orders FROM sales;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_dates FROM calendar;

-- Preview tables
SELECT * FROM sales LIMIT 10;
SELECT * FROM stores LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM customers LIMIT 10;
SELECT * FROM calendar LIMIT 10;

-- Checking missing values in key columns
SELECT COUNT(*) AS missing_revenue FROM sales WHERE revenue IS NULL;
SELECT COUNT(*) AS missing_ids
FROM sales
WHERE order_id IS NULL 
   OR product_id IS NULL 
   OR store_id IS NULL
   OR customer_id IS NULL;

-- Check for invalid values
SELECT * FROM sales WHERE quantity<=0;
SELECT * FROM customers WHERE age < 0 OR age > 120;
SELECT * FROM products WHERE cocoa_percent < 0 OR cocoa_percent > 100;

-- Checking duplictes in ID columns
SELECT order_id, COUNT(*) FROM sales GROUP BY order_id HAVING COUNT(*) > 1;
SELECT customer_id, COUNT(*) FROM customers GROUP BY customer_id HAVING COUNT(*)>1;
SELECT store_id, COUNT(*) FROM stores GROUP BY store_id HAVING COUNT(*)>1;
SELECT product_id, COUNT(*) FROM products GROUP BY product_id HAVING COUNT(*)>1;

-- Explore date range
SELECT MIN(order_date) AS first_order, MAX(order_date) AS last_order FROM sales;

-- Explore categorical values
SELECT DISTINCT category FROM products ORDER BY category;
SELECT DISTINCT brand FROM products ORDER BY brand;
SELECT DISTINCT country FROM stores ORDER BY country;
SELECT DISTINCT store_name FROM stores ORDER BY store_name;
SELECT DISTINCT gender FROM customers;
SELECT DISTINCT loyalty_member FROM customers;
