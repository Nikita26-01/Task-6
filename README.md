# Task 6: Subqueries and Nested Queries

## 🎯 Objective
To apply subqueries in SELECT, WHERE, and FROM clauses to build advanced SQL logic.

## 🛠 Tools Used
- DB Browser for SQLite / MySQL Workbench

## 🧱 Tables Used

### Customers
- `CustomerID` (Primary Key)
- `CustomerName`
- `City`

### Orders
- `OrderID` (Primary Key)
- `OrderDate`
- `CustomerID` (Foreign Key)
- `Amount`

## 🧾 Sample Data

| CustomerID | CustomerName | City      |
|------------|---------------|-----------|
| 1          | Amit          | Mumbai    |
| 2          | Neha          | Delhi     |
| 3          | Rahul         | Bangalore |
| 4          | Priya         | Chennai   |

## 🔍 SQL Subquery Examples

### 1️⃣ Subquery in SELECT
Show total amount each customer has spent.

### 2️⃣ Subquery in WHERE
Get names of customers who have placed orders.

### 3️⃣ Subquery using EXISTS
Check if a customer has at least one order.

### 4️⃣ Scalar Subquery
Find the top customer who spent the most.

### 5️⃣ Correlated Subquery in FROM
List total order amount per customer.

### 6️⃣ Subquery in FROM (Derived Table)
Get average order amount per customer.

## ✅ Submission Note
This repository contains SQL subquery examples as per Task 6 instructions in the SQL Developer Internship.
