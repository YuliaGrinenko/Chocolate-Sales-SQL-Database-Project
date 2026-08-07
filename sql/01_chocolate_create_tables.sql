-- Chocolate Sales Database
-- Database and Table Creation
-- ==========================================
-- Create database
CREATE DATABASE IF NOT EXISTS chocolate_db;
USE chocolate_db;

-- Create tables
-- 1. Products Table
CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
    category VARCHAR(50),
    cocoa_percent DECIMAL(5,2),
    weight_g INT
);

-- 2. Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    loyalty_member BOOLEAN,
    join_date DATE
);

-- 3. Calendar Table
CREATE TABLE calendar (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    week INT,
    day_of_week VARCHAR(15)
);

   -- 4. Stores Table
CREATE TABLE stores (
    store_id VARCHAR(20) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_type VARCHAR(50),  
    city VARCHAR(50),
    country VARCHAR(50)
);
-- 5. Sales Table
CREATE TABLE sales (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE NOT NULL,
    product_id VARCHAR(20) NOT NULL,
    store_id VARCHAR(20) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(4,2) DEFAULT 0.00,
    revenue DECIMAL(10,2) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    profit DECIMAL(10,2) NOT NULL,
    
    -- Defining Foreign Keys to establish table relationships
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_sales_calendar FOREIGN KEY (order_date) REFERENCES calendar(date),
    CONSTRAINT fk_sales_store FOREIGN KEY (store_id) REFERENCES stores(store_id)
);
