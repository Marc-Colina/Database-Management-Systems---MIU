-- /3.QUERIES
-- a. What is the total revenue generated by each customer?
SELECT
	c.CustomerID,
	c.CustomerName,
	SUM(od.Quantity * od.UnitPrice) AS Total_Revenue
FROM
	Customers c
INNER JOIN
	Orders o ON o.CustomerID = c.CustomerID
INNER JOIN
	OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
c.CustomerID, c.CustomerName;

-- b. What is the total revenue generated by each country?
SELECT
	c.Country,
	SUM(od.Quantity * od.UnitPrice) AS Total_Revenue
FROM
	Customers c
INNER JOIN
	Orders o ON o.CustomerID = c.CustomerID
INNER JOIN
	OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
c.Country;

-- c. What is the total revenue generated by each category?
SELECT
	p.CategoryID,
	SUM(od.Quantity * od.UnitPrice) AS Total_Revenue
FROM
	Products p
INNER JOIN
	OrderDetails od ON od.ProductID = p.ProductID
Group By
CategoryID;

-- d. Which customer has spent the most amount of money?
SELECT
    c.customerID,
    c.customerName,
    SUM(od.Quantity * od.UnitPrice) AS Total_Spent
FROM
    Customers c
INNER JOIN
    Orders o ON o.CustomerID = c.customerID
INNER JOIN
    OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
    c.customerID, c.customerName
ORDER BY Total_Spent DESC
LIMIT 1

-- e. Which country has the highest average order value?
SELECT 
    o.ShipCountry,
    AVG(od.Quantity * od.UnitPrice) AS Average_Order_Value
FROM
    Orders o
INNER JOIN 
    OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
    o.ShipCountry
ORDER BY Average_Order_Value DESC
LIMIT 1;

--f. Which category has the highest average product price?
SELECT 
    CategoryID,
    AVG(UnitPrice) AS AVG_Unit_Price
FROM
    Products    
Group By
    CategoryID
ORDER BY AVG_Unit_Price DESC
LIMIT 1;

--g. What is the total quantity of each product that has been ordered?
--This query is assuming that we also need the Product Name and not just the ProductID
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Ordered
FROM
    Products p
INNER JOIN
    OrderDetails od ON od.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName

--h. What is the total quantity of each product that has been ordered by each customer?
--This is assuming that we are displaying both the Customer Name and Product Name for 
--better readability of output
SELECT
    c.CustomerName,
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity
FROM
    Customers c
INNER JOIN 
    Orders o ON o.customerID = c.customerID
INNER JOIN 
    OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerName,
    p.ProductName;

--i. What is the total revenue generated by each customer for orders that were
-- shipped to a specific city?
--This is assuming we have to display the Customer ID and Customer Name and the Specific City is New York
SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(od.Quantity * od.UnitPrice) AS Total_Revenue
FROM
    Customers c
INNER JOIN
    Orders o ON o.CustomerID = c.CustomerID
INNER JOIN
    OrderDetails od ON od.OrderID = o.OrderID
WHERE ShipCity = 'New York'
GROUP BY
    c.CustomerID,
    c.customerName;

--j. Which customers have placed orders for products from more than one category?
SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(DISTINCT p.CategoryID) as Num_Distinct_Categories
FROM
    Customers c
INNER JOIN
    Orders o ON o.customerID = c.customerID
INNER JOIN
    OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN
    Products p ON p.ProductID = od.ProductID
Group By
    c.CustomerID,
    c.CustomerName
HAVING
    COUNT(DISTINCT p.CategoryID) > 1;

--k. Which customers have placed orders for products from a specific category
SELECT DISTINCT
    c.customerID,
    c.customerName,
    p.CategoryID
FROM
    Customers c
INNER JOIN 
    Orders o ON o.CustomerID = c.CustomerID
INNER JOIN
    OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN
    Products p ON p.ProductID = od.ProductID
WHERE p.CategoryID = 2;

--l. Which products have been ordered by customers from a specific country?
SELECT DISTINCT
    p.ProductID,
    p.ProductName,
    c.Country
FROM
    Products p
INNER JOIN
    OrderDetails od ON od.ProductID = p.ProductID
INNER JOIN
    Orders o ON o.OrderID = od.OrderID
INNER JOIN
    Customers c ON c.CustomerID = o.CustomerID
WHERE
    c.Country = 'USA'

--m. Which customers have ordered the most products?
--This query will return all the customers that have ordered products equal to the number of the
--max products ordered by a customer. So if the max number of ordered products by a Customer is 5 and there
--are 3 customers who ordered 5 products, all these three will be shown and not just one of them.
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) = (
    SELECT MAX(OrderCount) FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS MaxOrders
);

--n. Which customers have ordered the most expensive products?
SELECT
    c.CustomerID,
    c.CustomerName,
    MAX(od.UnitPrice) as Max_Price
FROM
    Customers c
INNER JOIN
    Orders o ON o.CustomerID = c.CustomerID
INNER JOIN
    OrderDetails od ON od.OrderID = o.OrderID
GROUP BY
    c.CustomerID, c.CustomerName
HAVING
    MAX(od.UnitPrice) = (
        SELECT 
            MAX(UnitPrice)
        FROM
            OrderDetails
    );
