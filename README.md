# 🍫 Chocolate Sales SQL Database Project

## Project Overview

This project demonstrates the process of designing and creating a relational database for analysing chocolate sales data using **MySQL**. It focuses on database design, table creation, data organisation, and exploratory SQL analysis.

The database was built from a sales dataset and organised into a relational schema consisting of dimension tables and a fact table to support efficient data analysis.

---

## Project Objectives

* Design and create a relational SQL database from a raw sales dataset
* Create tables with appropriate data types and relationships
* Implement primary and foreign keys to maintain data integrity
* Import data from CSV files
* Explore the dataset using SQL queries
* Build a foundation for business-focused sales analysis

---

## Database Design

The database consists of five related tables:

### Dimension Tables

* **Products** – product details, including brand, category, cocoa percentage and weight
* **Customers** – customer demographics and loyalty membership
* **Stores** – store information and location
* **Calendar** – date attributes for time-based analysis

### Fact Table

* **Sales** – transactional data including orders, products, customers, stores, quantities, revenue, costs and profit

Relationships between the tables are enforced using **primary keys** and **foreign keys** to ensure data consistency.

### Database Schema

```markdown
![Database Schema](schema.png)
```

---

## Current Progress

The following stages have been completed:

* ✅ Created the database
* ✅ Designed and created relational tables
* ✅ Defined primary and foreign keys
* ✅ Imported data from CSV files
* ✅ Performed initial data exploration using SQL queries
* ✅ Generated a database schema
---

## Project Status

🚧 **Work in Progress**

This project is actively being developed. Future updates will include more advanced SQL analysis and business insights.

### Planned Improvements

* Sales trend analysis
* Product performance analysis
* Customer purchasing behaviour analysis
* Store performance analysis
* Profitability analysis
* Business insights and recommendations

---

## Tools & Technologies

* MySQL
* MySQL Workbench
* SQL
* Git & GitHub

---

## Dataset

The project uses a chocolate sales dataset containing information about products, customers, stores and sales transactions.
