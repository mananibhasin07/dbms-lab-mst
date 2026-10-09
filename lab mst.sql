-- Create an Online Shopping Management System using Customer and Orders tables.
-- 1. Create both tables with suitable attributes and apply Primary Key and Foreign Key constraints.
-- 2. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 3. Insert at least 5 customer records and 5 order records.
-- 4. Display orders whose total amount is greater than ₹5,000.
-- 5. Calculate the total order amount for each customer using GROUP BY and SUM().
-- 6. Display customers whose total order amount exceeds ₹10,000 using HAVING.
-- 7. Find the average order amount using AVG().
-- 8. Update the status of a particular order.
-- 9. Delete an order based on a suitable condition.
-- 10. Add a new column to the Orders table using ALTER.
-- 11. Display the final order records.

DROP DATABASE IF EXISTS shopping;
CREATE DATABASE shopping;

USE shopping;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL DEFAULT "ABC",
    email VARCHAR(50) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount INT NOT NULL CHECK (total_amount>0),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Customer 
VALUES
(101, "Aman", "aman@gmail.com", "Banglore"),
(102, "Riya", "riya@gmail.com", "Noida"),
(103, "Rahul", "rahul@gmail.com", "Mumbai"),
(104, "Priya", "priya@gmail.com", "Pune"),
(105, "Karan", "karan@gmail.com", "New Delhi");

INSERT INTO Orders 
VALUES
(1, 101, 2000, "Delivered."),
(2, 102, 5000, "Ordered."),
(3, 101, 7000, "Pending."),
(4, 103, 8000, "Shipped."),
(5, 104, 4000, "Shipped.");

SELECT * FROM Orders
WHERE total_amount>5000;

SELECT customer_id, SUM(total_amount) 
FROM Orders
GROUP BY customer_id;

SELECT customer_id, SUM(total_amount)
FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount)>10000;

SELECT AVG(total_amount)
FROM Orders;

UPDATE Orders
SET status = "Shipped."
WHERE order_id=3;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Orders
WHERE status = "Delivered.";

ALTER TABLE Orders
ADD payment VARCHAR(20);

SELECT * FROM Orders;
