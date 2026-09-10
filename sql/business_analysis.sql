-- 1. Sales Analysis
-- Total Sales
SELECT SUM(revenue) as total_sales FROM sales;
-- Total Profit
SELECT SUM(profit) as total_profit FROM sales;
-- Total Orders
SELECT COUNT(*) as total_orders FROM sales;
-- Average order value
SELECT AVG(revenue) as average_value FROM sales;

-- 2. Product Analysis
-- Top 10 products by revenue
SELECT p.product_name, SUM(s.revenue) as revenue FROM sales s JOIN products p ON s.product_id=p.product_id GROUP BY p.product_name ORDER BY revenue DESC LIMIT 10;
-- Revenue by Category
SELECT p.category, SUM(s.revenue) as revenue FROM sales s JOIN products p ON s.product_id=p.product_id GROUP BY p.category ORDER BY revenue DESC;
-- Most profitable products
SELECT p.product_name, SUM(s.profit) as profit FROM sales s JOIN products p ON s.product_id=p.product_id GROUP BY p.product_name ORDER BY profit DESC LIMIT 10;

-- 3. Customer Analysis
-- Revenue by gender
SELECT c.gender, SUM(s.revenue) as revenue, ROUND(SUM(s.revenue)*100/(SELECT SUM(revenue) FROM SALES), 2) as '% of revenue'  FROM sales s JOIN customers c ON s.customer_id=c.customer_id GROUP BY c.gender ORDER BY revenue DESC;
-- Revenue by loyalty membership
SELECT c.loyalty_member, SUM(s.revenue) as revenue, ROUND(SUM(s.revenue)*100/(SELECT SUM(revenue) FROM SALES), 2) as '% of revenue' FROM sales s JOIN customers c ON s.customer_id=c.customer_id GROUP BY c.loyalty_member ORDER BY revenue DESC;
-- Top customers by spending
SELECT c.customer_id, SUM(s.revenue) as total_spent FROM sales s JOIN customers c ON s.customer_id=c.customer_id GROUP BY c.customer_id ORDER BY total_spent DESC LIMIT 10;

-- 4. Store Analysis
-- Revenue by country
SELECT st.country, SUM(s.revenue) as revenue FROM sales s JOIN stores st ON s.store_id=st.store_id GROUP BY st.country ORDER BY revenue DESC;
-- Top stores by profit
SELECT st.store_name, SUM(s.profit) as profit FROM sales s JOIN stores st ON s.store_id=st.store_id GROUP BY st.store_name ORDER BY profit DESC LIMIT 10;

-- 5. Time Analysis
-- Revenue by year
SELECT c.year, SUM(s.revenue) as revenue FROM sales s JOIN calendar c ON s.order_date=c.date GROUP BY c.year;
-- Revenue by months and years            
SELECT c.year, CASE c.month
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS month, 
    SUM(s.revenue) as revenue FROM sales s JOIN calendar c ON s.order_date=c.date GROUP BY c.year, month;
 -- The highest-revenue month across all years   
SELECT CASE c.month
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS month, 
   SUM(s.revenue) as revenue FROM sales s JOIN calendar c ON s.order_date=c.date GROUP BY c.month ORDER BY revenue DESC LIMIT 1;