-- Task 6: Subqueries and Nested Queries

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Neha', 'Delhi'),
(3, 'Rahul', 'Bangalore'),
(4, 'Priya', 'Chennai');

-- Insert Orders
INSERT INTO Orders VALUES
(101, '2024-06-01', 1, 250.00),
(102, '2024-06-03', 2, 400.50),
(103, '2024-06-05', 1, 180.75),
(104, '2024-06-07', 3, 99.99),
(105, '2024-06-08', NULL, 120.00);

-- 1️⃣ Subquery in SELECT: Show each customer's total order amount
SELECT CustomerName,
       (SELECT SUM(Amount) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS TotalSpent
FROM Customers;

-- 2️⃣ Subquery in WHERE: Customers who have placed an order
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE CustomerID IS NOT NULL);

-- 3️⃣ Subquery in WHERE with EXISTS: Customers with at least one order
SELECT CustomerName
FROM Customers C
WHERE EXISTS (
    SELECT 1 FROM Orders O WHERE O.CustomerID = C.CustomerID
);

-- 4️⃣ Scalar Subquery: Find customer who spent the most
SELECT CustomerName
FROM Customers
WHERE CustomerID = (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY SUM(Amount) DESC
    LIMIT 1
);

-- 5️⃣ Correlated Subquery in FROM: List customers with their total order amount
SELECT C.CustomerName, Total.TotalSpent
FROM Customers C,
     (SELECT CustomerID, SUM(Amount) AS TotalSpent FROM Orders GROUP BY CustomerID) AS Total
WHERE C.CustomerID = Total.CustomerID;

-- 6️⃣ Subquery in FROM (Derived Table): Average amount of each customer's order
SELECT C.CustomerName, A.AvgAmount
FROM Customers C
JOIN (
    SELECT CustomerID, AVG(Amount) AS AvgAmount
    FROM Orders
    GROUP BY CustomerID
) A ON C.CustomerID = A.CustomerID;
