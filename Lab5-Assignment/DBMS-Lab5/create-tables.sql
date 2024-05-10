--1.
-- Creating the schema and using the schema
CREATE SCHEMA Sales_DB
USE Sales_DB

-- Creating the tables and specifying primary and foreign keys
CREATE TABLE  Customers(
CustomerID INT NOT NULL,
CustomerName VARCHAR(255),
ContactName VARCHAR(255),
Country VARCHAR(255),
PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders(
OrderID INT NOT NULL,
CustomerID INT NOT NULL,
OrderDate DATETIME,
ShipCity VARCHAR(255),
ShipCountry VARCHAR(255),
PRIMARY KEY (OrderID)
);

ALTER TABLE Orders
ADD CONSTRAINT orders_fk_customerid
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

CREATE TABLE OrderDetails(
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT,
UnitPrice DOUBLE,
PRIMARY KEY (OrderID, ProductID)
);


ALTER TABLE OrderDetails
ADD CONSTRAINT order_details_fk_order_id
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);

CREATE TABLE Products(
ProductID INT NOT NULL,
ProductName VARCHAR(255),
SupplierID INT NOT NULL,
CategoryID INT NOT NULL,
UnitPrice DOUBLE,
PRIMARY KEY (ProductID)
);

ALTER TABLE OrderDetails
ADD CONSTRAINT order_details_fk_product_id
FOREIGN KEY(ProductID)
REFERENCES Products(ProductID);
