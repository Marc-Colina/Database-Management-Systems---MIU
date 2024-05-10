-- 2.
--Populating the Sample Data
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Alice Blue', 'Alice Smith', 'USA'),
(2, 'Bob Stone', 'Bob Brown', 'Canada'),
(3, 'Charlie Roots', 'Charlie Crown', 'UK'),
(4, 'Diana Grape', 'Diana Vines', 'Germany'),
(5, 'Evan Spices', 'Evan Pepper', 'India');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipCity, ShipCountry) VALUES
(1, 1, '2023-05-01', 'New York', 'USA'),
(2, 2, '2023-05-02', 'Toronto', 'Canada'),
(3, 3, '2023-05-03', 'London', 'UK'),
(4, 4, '2023-05-04', 'Berlin', 'Germany'),
(5, 5, '2023-05-05', 'Mumbai', 'India'),
(6, 1, '2023-05-06', 'Chicago', 'USA'),
(7, 2, '2023-05-07', 'Vancouver', 'Canada'),
(8, 3, '2023-05-08', 'Manchester', 'UK'),
(9, 4, '2023-05-09', 'Hamburg', 'Germany'),
(10, 5, '2023-05-10', 'Delhi', 'India');


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 10.00),
(1, 2, 1, 20.00),
(2, 3, 5, 15.00),
(2, 4, 2, 25.00),
(3, 5, 1, 5.00),
(3, 1, 1, 10.00),
(4, 2, 3, 20.00),
(4, 3, 4, 15.00),
(5, 4, 1, 25.00),
(5, 5, 2, 5.00),
(6, 1, 3, 10.00),
(6, 2, 1, 20.00),
(7, 3, 2, 15.00),
(7, 4, 3, 25.00),
(8, 5, 4, 5.00),
(8, 1, 2, 10.00),
(9, 2, 1, 20.00),
(9, 3, 1, 15.00),
(10, 4, 1, 25.00),
(10, 5, 5, 5.00);

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, UnitPrice) VALUES
(1, 'Apple', 100, 1, 10.00),
(2, 'Banana', 101, 1, 20.00),
(3, 'Carrot', 102, 2, 15.00),
(4, 'Date', 103, 2, 25.00),
(5, 'Eggplant', 104, 1, 5.00),
(6, 'Fig', 105, 1, 12.00),
(7, 'Grapefruit', 106, 2, 18.00),
(8, 'Honeydew', 107, 1, 22.00),
(9, 'Iceberg Lettuce', 108, 2, 7.00),
(10, 'Jackfruit', 109, 1, 30.00),
(11, 'Kiwi', 110, 2, 8.00),
(12, 'Lemon', 111, 1, 15.00),
(13, 'Mango', 112, 1, 20.00),
(14, 'Nectarine', 113, 2, 12.00),
(15, 'Orange', 114, 1, 10.00);
