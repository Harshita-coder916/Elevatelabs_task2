
-- STEP 1: Create and use the database
DROP DATABASE IF EXISTS EcommerceDB;
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- STEP 2: Drop tables if they exist (in proper dependency order)
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- STEP 3: Create all necessary tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_purchase DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- STEP 4: Insert sample data (including NULLs)
INSERT INTO Customers (name, email, phone, address) VALUES 
('Alice Sharma', 'alice@example.com', '9876543210', 'Delhi'),
('Bob Verma', 'bob@example.com', NULL, 'Mumbai'),
('Charlie Khan', NULL, '9998887776', 'Bangalore'),
('Daisy Roy', 'daisy@example.com', '8889990000', NULL);

INSERT INTO Products (name, description, price, stock_quantity) VALUES 
('Laptop', '15-inch screen, 8GB RAM', 55000.00, 10),
('Smartphone', '128GB, 5G-enabled', 25000.00, 0),
('Headphones', NULL, 1500.00, 50),
('Wireless Mouse', 'Ergonomic design', 800.00, 20);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-06-15', 80000.00),
(2, '2024-06-16', 25000.00),
(3, '2024-06-17', NULL);

INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 55000.00),
(1, 3, 2, 1500.00),
(2, 2, 1, 25000.00),
(3, 4, 1, 800.00);

INSERT INTO Payments (order_id, payment_date, amount_paid, payment_method) VALUES
(1, '2024-06-15', 58000.00, 'Credit Card'),
(2, '2024-06-16', NULL, 'UPI'),
(3, '2024-06-17', 800.00, NULL);

-- STEP 5: Safe and correct UPDATEs to handle NULLs
UPDATE Customers
SET phone = '9123456789'
WHERE customer_id = 2 AND phone IS NULL;

UPDATE Customers
SET email = 'charlie.khan@example.com'
WHERE customer_id = 3 AND email IS NULL;

UPDATE Orders
SET total_amount = 800.00
WHERE order_id = 3 AND total_amount IS NULL;

UPDATE Products
SET description = 'Basic over-ear headphones'
WHERE product_id = 3 AND description IS NULL;

UPDATE Payments
SET amount_paid = 25000.00
WHERE payment_id = 2 AND amount_paid IS NULL;

UPDATE Payments
SET payment_method = 'Cash'
WHERE payment_id = 3 AND payment_method IS NULL;

-- STEP 6: Safe DELETEs (only if data still matches conditions)
-- Note: These may not delete anything now, since updates have corrected them

DELETE FROM Orders
WHERE order_id = 3 AND total_amount IS NULL;

DELETE FROM Customers
WHERE customer_id = 3 AND email IS NULL;

DELETE FROM Products
WHERE product_id = 2 AND stock_quantity = 0;
