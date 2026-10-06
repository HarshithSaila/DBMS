/* =========================================================
   E-COMMERCE ORDER MANAGEMENT SYSTEM
   COMPLETE MYSQL CODE
   ========================================================= */


/* =========================================================
   1. DATABASE CREATION
   Figure 8.1
   ========================================================= */

DROP DATABASE IF EXISTS EcommerceDB;

CREATE DATABASE EcommerceDB;

USE EcommerceDB;


/* =========================================================
   2. CUSTOMER TABLE
   Figure 8.2
   ========================================================= */

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(200)
);


/* =========================================================
   3. CATEGORY TABLE
   Figure 8.3
   ========================================================= */

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);


/* =========================================================
   4. PRODUCT TABLE
   Figure 8.4
   ========================================================= */

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2) CHECK (Price >= 0),
    Stock INT CHECK (Stock >= 0),

    FOREIGN KEY (CategoryID)
    REFERENCES Category(CategoryID)
);


/* =========================================================
   5. ADDRESS TABLE
   Figure 8.5
   ========================================================= */

CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AddressLine VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50),
    Pincode VARCHAR(10),

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);


/* =========================================================
   6. ORDERS TABLE
   Figure 8.6
   ========================================================= */

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    Status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);


/* =========================================================
   7. ORDER ITEM TABLE
   Figure 8.7
   ========================================================= */

CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);


/* =========================================================
   8. PAYMENT TABLE
   Figure 8.8
   ========================================================= */

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(30),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);


/* =========================================================
   9. SHIPPING TABLE
   Figure 8.9
   ========================================================= */

CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    TrackingNumber VARCHAR(50) UNIQUE,
    DeliveryDate DATE,
    ShippingStatus VARCHAR(30),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);


/* =========================================================
   10. INVENTORY TABLE
   Figure 8.10
   ========================================================= */

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    LastUpdated DATE,

    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID)
);


/* =========================================================
   11. INSERT CUSTOMER DATA
   ========================================================= */

INSERT INTO Customer
(CustomerID, CustomerName, Email, Phone, Address)
VALUES
(101, 'Rahul Kumar', 'rahul@gmail.com', '9876543210', 'Main Road'),
(102, 'Priya Sharma', 'priya@gmail.com', '9876543211', 'Market Road'),
(103, 'Arjun Reddy', 'arjun@gmail.com', '9876543212', 'Station Road'),
(104, 'Sneha Rao', 'sneha@gmail.com', '9876543213', 'College Road'),
(105, 'Kiran Kumar', 'kiran@gmail.com', '9876543214', 'Temple Road');


/* =========================================================
   12. INSERT CATEGORY DATA
   ========================================================= */

INSERT INTO Category
(CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home Appliances');


/* =========================================================
   13. INSERT PRODUCT DATA
   ========================================================= */

INSERT INTO Product
(ProductID, ProductName, CategoryID, Price, Stock)
VALUES
(201, 'Laptop', 1, 55000.00, 20),
(202, 'Smartphone', 1, 25000.00, 35),
(203, 'T-Shirt', 2, 800.00, 50),
(204, 'Database Book', 3, 600.00, 30),
(205, 'Mixer Grinder', 4, 3500.00, 15);


/* =========================================================
   14. INSERT ADDRESS DATA
   ========================================================= */

INSERT INTO Address
(AddressID, CustomerID, AddressLine, City, State, Pincode)
VALUES
(301, 101, '12 Main Road', 'Hyderabad', 'Telangana', '500001'),
(302, 102, '25 Market Road', 'Warangal', 'Telangana', '506002'),
(303, 103, '8 Station Road', 'Hyderabad', 'Telangana', '500002'),
(304, 104, '16 College Road', 'Karimnagar', 'Telangana', '505001'),
(305, 105, '5 Temple Road', 'Nizamabad', 'Telangana', '503001');


/* =========================================================
   15. INSERT ORDER DATA
   ========================================================= */

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES
(401, 101, '2026-09-20', 55000.00, 'Confirmed'),
(402, 102, '2026-09-21', 25800.00, 'Shipped'),
(403, 103, '2026-09-22', 1400.00, 'Pending'),
(404, 104, '2026-09-23', 3500.00, 'Delivered');


/* =========================================================
   16. INSERT ORDER ITEM DATA
   ========================================================= */

INSERT INTO OrderItem
(OrderItemID, OrderID, ProductID, Quantity, Price)
VALUES
(501, 401, 201, 1, 55000.00),
(502, 402, 202, 1, 25000.00),
(503, 402, 203, 1, 800.00),
(504, 403, 203, 1, 800.00),
(505, 403, 204, 1, 600.00),
(506, 404, 205, 1, 3500.00);


/* =========================================================
   17. INSERT PAYMENT DATA
   ========================================================= */

INSERT INTO Payment
(PaymentID, OrderID, PaymentDate, PaymentMethod, PaymentStatus)
VALUES
(601, 401, '2026-09-20', 'UPI', 'Paid'),
(602, 402, '2026-09-21', 'Card', 'Paid'),
(603, 403, '2026-09-22', 'Cash on Delivery', 'Pending'),
(604, 404, '2026-09-23', 'Net Banking', 'Paid');


/* =========================================================
   18. INSERT SHIPPING DATA
   ========================================================= */

INSERT INTO Shipping
(ShippingID, OrderID, TrackingNumber, DeliveryDate, ShippingStatus)
VALUES
(701, 401, 'TRK1001', '2026-09-23', 'Delivered'),
(702, 402, 'TRK1002', '2026-09-25', 'Shipped'),
(703, 403, 'TRK1003', NULL, 'Processing'),
(704, 404, 'TRK1004', '2026-09-26', 'Delivered');


/* =========================================================
   19. INSERT INVENTORY DATA
   ========================================================= */

INSERT INTO Inventory
(InventoryID, ProductID, Quantity, LastUpdated)
VALUES
(801, 201, 20, '2026-09-20'),
(802, 202, 35, '2026-09-21'),
(803, 203, 50, '2026-09-22'),
(804, 204, 30, '2026-09-23'),
(805, 205, 15, '2026-09-24');


/* =========================================================
   20. DISPLAY TABLES
   ========================================================= */


/* Figure 8.2 */
SELECT * FROM Customer;


/* Figure 8.3 */
SELECT * FROM Category;


/* Figure 8.4 */
SELECT * FROM Product;


/* Figure 8.5 */
SELECT * FROM Address;


/* Figure 8.6 */
SELECT * FROM Orders;


/* Figure 8.7 */
SELECT * FROM OrderItem;


/* Figure 8.8 */
SELECT * FROM Payment;


/* Figure 8.9 */
SELECT * FROM Shipping;


/* Figure 8.10 */
SELECT * FROM Inventory;


/* =========================================================
   21. SELECT QUERIES
   Figure 8.11
   ========================================================= */


/* Display all customers */
SELECT * FROM Customer;


/* Display all products */
SELECT * FROM Product;


/* Display products with price greater than 1000 */
SELECT ProductName, Price
FROM Product
WHERE Price > 1000;


/* Display confirmed orders */
SELECT *
FROM Orders
WHERE Status = 'Confirmed';


/* Display paid payments */
SELECT *
FROM Payment
WHERE PaymentStatus = 'Paid';


/* Display products having stock greater than 20 */
SELECT ProductName, Stock
FROM Product
WHERE Stock > 20;


/* Display customer names */
SELECT CustomerName
FROM Customer;


/* Display product names and prices */
SELECT ProductName, Price
FROM Product;


/* =========================================================
   22. JOIN QUERIES
   Figure 8.12
   ========================================================= */


/* Customer and Orders */
SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status
FROM Customer c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;


/* Orders and Payment */
SELECT
    o.OrderID,
    o.TotalAmount,
    p.PaymentMethod,
    p.PaymentStatus
FROM Orders o
INNER JOIN Payment p
ON o.OrderID = p.OrderID;


/* Product and Category */
SELECT
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    p.Price,
    p.Stock
FROM Product p
INNER JOIN Category c
ON p.CategoryID = c.CategoryID;


/* LEFT JOIN */
SELECT
    c.CustomerName,
    o.OrderID,
    o.Status
FROM Customer c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;


/* RIGHT JOIN */
SELECT
    p.ProductName,
    oi.OrderID,
    oi.Quantity
FROM OrderItem oi
RIGHT JOIN Product p
ON oi.ProductID = p.ProductID;


/* Three-table JOIN */
SELECT
    c.CustomerName,
    o.OrderID,
    p.ProductName,
    oi.Quantity,
    oi.Price
FROM Customer c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderItem oi
ON o.OrderID = oi.OrderID
JOIN Product p
ON oi.ProductID = p.ProductID;


/* Order, Customer and Payment */
SELECT
    c.CustomerName,
    o.OrderID,
    o.TotalAmount,
    p.PaymentMethod,
    p.PaymentStatus
FROM Customer c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Payment p
ON o.OrderID = p.OrderID;


/* =========================================================
   23. AGGREGATE FUNCTIONS
   Figure 8.13
   ========================================================= */


/* COUNT */
SELECT COUNT(*) AS Total_Customers
FROM Customer;


/* COUNT PRODUCTS */
SELECT COUNT(*) AS Total_Products
FROM Product;


/* SUM */
SELECT SUM(TotalAmount) AS Total_Sales
FROM Orders;


/* AVG */
SELECT AVG(Price) AS Average_Product_Price
FROM Product;


/* MAX */
SELECT MAX(Price) AS Highest_Product_Price
FROM Product;


/* MIN */
SELECT MIN(Price) AS Lowest_Product_Price
FROM Product;


/* COUNT ORDERS */
SELECT COUNT(*) AS Total_Orders
FROM Orders;


/* GROUP BY ORDER STATUS */
SELECT
    Status,
    COUNT(*) AS Number_Of_Orders
FROM Orders
GROUP BY Status;


/* GROUP BY CATEGORY */
SELECT
    CategoryID,
    COUNT(*) AS Number_Of_Products
FROM Product
GROUP BY CategoryID;


/* =========================================================
   24. SUBQUERIES
   Figure 8.14
   ========================================================= */


/* Products above average price */
SELECT ProductName, Price
FROM Product
WHERE Price >
(
    SELECT AVG(Price)
    FROM Product
);


/* Product having maximum price */
SELECT ProductName, Price
FROM Product
WHERE Price =
(
    SELECT MAX(Price)
    FROM Product
);


/* Product having minimum price */
SELECT ProductName, Price
FROM Product
WHERE Price =
(
    SELECT MIN(Price)
    FROM Product
);


/* Customers who placed orders */
SELECT CustomerName
FROM Customer
WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Orders
);


/* Products that have been ordered */
SELECT ProductName
FROM Product
WHERE ProductID IN
(
    SELECT ProductID
    FROM OrderItem
);


/* Customer who placed the highest-value order */
SELECT CustomerName
FROM Customer
WHERE CustomerID =
(
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount =
    (
        SELECT MAX(TotalAmount)
        FROM Orders
    )
);


/* =========================================================
   25. VIEWS
   Figure 8.15
   ========================================================= */


/* Customer View */
CREATE VIEW Customer_View AS
SELECT
    CustomerID,
    CustomerName,
    Email,
    Phone
FROM Customer;


/* Order View */
CREATE VIEW Order_View AS
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount,
    Status
FROM Orders;


/* Product View */
CREATE VIEW Product_View AS
SELECT
    ProductID,
    ProductName,
    Price,
    Stock
FROM Product;


/* Payment View */
CREATE VIEW Payment_View AS
SELECT
    PaymentID,
    OrderID,
    PaymentDate,
    PaymentMethod,
    PaymentStatus
FROM Payment;


/* Shipment View */
CREATE VIEW Shipment_View AS
SELECT
    OrderID,
    TrackingNumber,
    DeliveryDate,
    ShippingStatus
FROM Shipping;


/* Display Views */
SELECT * FROM Customer_View;

SELECT * FROM Order_View;

SELECT * FROM Product_View;

SELECT * FROM Payment_View;

SELECT * FROM Shipment_View;


/* =========================================================
   26. NORMALIZATION
   Figure 8.16
   ========================================================= */


/* 1NF */

CREATE TABLE Order_1NF (
    OrderID INT,
    ProductID INT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2)
);


INSERT INTO Order_1NF
VALUES
(401, 201, 'Laptop', 1, 55000.00),
(402, 202, 'Smartphone', 1, 25000.00),
(402, 203, 'T-Shirt', 1, 800.00);


/* Display 1NF */
SELECT * FROM Order_1NF;


/* 2NF */

CREATE TABLE Order_2NF (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);


CREATE TABLE Product_2NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);


/* Display 2NF */
SELECT * FROM Order_2NF;

SELECT * FROM Product_2NF;


/* 3NF */

CREATE TABLE Category_3NF (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);


CREATE TABLE Product_3NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),

    FOREIGN KEY (CategoryID)
    REFERENCES Category_3NF(CategoryID)
);


/* Display 3NF */
SELECT * FROM Category_3NF;

SELECT * FROM Product_3NF;


/* =========================================================
   27. CONSTRAINTS
   Figure 8.17
   ========================================================= */


/* PRIMARY KEY */
CREATE TABLE TestPrimaryKey (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);


/* NOT NULL */
CREATE TABLE TestNotNull (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);


/* UNIQUE */
CREATE TABLE TestUnique (
    ID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);


/* CHECK */
CREATE TABLE TestCheck (
    ID INT PRIMARY KEY,
    Price DECIMAL(10,2) CHECK (Price >= 0)
);


/* FOREIGN KEY */
CREATE TABLE TestForeignKey (
    OrderID INT PRIMARY KEY,
    CustomerID INT,

    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
);


/* DEFAULT */
CREATE TABLE TestDefault (
    ID INT PRIMARY KEY,
    Status VARCHAR(30) DEFAULT 'Pending'
);


/* =========================================================
   28. DATA INTEGRITY
   Figure 8.18
   ========================================================= */


/* Valid data */
INSERT INTO TestPrimaryKey
VALUES
(1, 'Rahul');


/* Display valid data */
SELECT * FROM TestPrimaryKey;


/*
   PRIMARY KEY INTEGRITY TEST

   The following statement will generate an error
   because ID = 1 already exists.
*/

INSERT INTO TestPrimaryKey
VALUES
(1, 'Priya');


/*
   FOREIGN KEY INTEGRITY TEST

   The following statement will generate an error
   because CustomerID = 999 does not exist.
*/

INSERT INTO Orders
VALUES
(999, 999, '2026-09-29', 5000.00, 'Pending');


/*
   CHECK CONSTRAINT INTEGRITY TEST

   The following statement will generate an error
   because Price cannot be negative.
*/

INSERT INTO Product
VALUES
(999, 'Test Product', 1, -500.00, 10);


/*
   NOT NULL INTEGRITY TEST

   The following statement will generate an error
   because CustomerName cannot be NULL.
*/

INSERT INTO Customer
VALUES
(999, NULL, 'test@gmail.com', '9999999999', 'Test Address');


/*
   UNIQUE CONSTRAINT INTEGRITY TEST

   The following statement will generate an error
   if the email already exists.
*/

INSERT INTO Customer
VALUES
(1000, 'Test User', 'rahul@gmail.com', '8888888888', 'Test Address');


/* =========================================================
   29. UPDATE OPERATIONS
   ========================================================= */


/* Update product price */
UPDATE Product
SET Price = 57000.00
WHERE ProductID = 201;


/* Update product stock */
UPDATE Product
SET Stock = 25
WHERE ProductID = 201;


/* Update order status */
UPDATE Orders
SET Status = 'Delivered'
WHERE OrderID = 402;


/* Update payment status */
UPDATE Payment
SET PaymentStatus = 'Paid'
WHERE PaymentID = 603;


/* Update shipping status */
UPDATE Shipping
SET ShippingStatus = 'Delivered'
WHERE ShippingID = 702;


/* =========================================================
   30. DELETE OPERATIONS
   ========================================================= */


/* Delete an inventory record */
DELETE FROM Inventory
WHERE InventoryID = 805;


/* =========================================================
   31. FINAL DISPLAY
   ========================================================= */

SELECT * FROM Customer;

SELECT * FROM Category;

SELECT * FROM Product;

SELECT * FROM Address;

SELECT * FROM Orders;

SELECT * FROM OrderItem;

SELECT * FROM Payment;

SELECT * FROM Shipping;

SELECT * FROM Inventory;


/* =========================================================
   END OF E-COMMERCE ORDER MANAGEMENT SYSTEM
   ========================================================= */