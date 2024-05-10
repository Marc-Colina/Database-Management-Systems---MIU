-- Write SQL statements to perform the following tasks:
-- a. Retrieve all products from the "Products" table.
SELECT
    *
FROM
    Products;

-- b. Retrieve all products that belong to the "Clothing" category.
SELECT
    *
FROM
    Products p
    INNER JOIN Categories c ON c.category_id = p.category_id
WHERE
    c.category_name = 'Clothing' -- c. Retrieve the names and prices of all products that cost less than $100.
SELECT
    product_name AS Product_Name,
    price AS Price
FROM
    Products
WHERE
    price < 100;

-- d. Update the price of the "MacBook Pro" to $1399.
UPDATE
    Products
SET
    price = 1399
WHERE
    product_name = 'MacBook Pro';

-- e. Delete the "Dining Table" product from the "Products" table.
DELETE FROM
    Products
WHERE
    product_name = 'Dining Table';

-- f. Retrieve the names and prices of all products that belong to the "Electronics"
-- category.
SELECT
    product_name AS Product_Name,
    price AS Price
FROM
    Products p
    INNER JOIN Categories c ON c.category_id = p.category_id
WHERE
    c.category_name = 'Electronics';

--g. Retrieve the names of all products that have a price greater than $500.
SELECT
    product_name AS Products
FROM
    Products
WHERE
    price > 500;

--h. Retrieve the names and prices of the top 3 most expensive products.
SELECT
    product_name AS Product_Name,
    price AS Price
FROM
    Products
ORDER BY
    price DESC
LIMIT
    3;

--i. Update the price of all products in the "Clothing" category to be 10% higher.
UPDATE
    Products
SET
    price = price * 1.10
WHERE
    category_id IN (
        SELECT
            category_id
        FROM
            Categories
        WHERE
            category_name = 'Clothing'
    ) --j. Delete all products that have a price less than $50.
DELETE FROM
    Products
WHERE
    price < 50 --k. Retrieve the names and prices of all products sorted in descending order by
    -- price.
SELECT
    product_name AS Product_Name,
    price AS Price
FROM
    Products
ORDER BY
    price DESC --l. Retrieve the names and categories of all products, sorted in ascending order by
    -- category_name.
SELECT
    p.product_name AS product,
    c.category_name AS category
FROM
    Products p
    INNER JOIN Categories c ON c.category_id = p.category_id
ORDER BY
    category ASC;

--m. Delete all products that belong to the "Home" category.
DELETE FROM
    Products p
WHERE
    p.category_id IN (
        SELECT
            category_id
        FROM
            Categories
        WHERE
            category_name = 'Home'
    );

--n. Retrieve the names and prices of all products that have a price between $100
-- and $500.
SELECT
    product_name AS Product,
    price AS Price
FROM
    Products
WHERE
    price BETWEEN 100
    AND 500;

--o. Update the price of all products in the "Electronics" category to be 5% lower.
UPDATE
    Products
SET
    price = price *.95
WHERE
    category_id IN (
        SELECT
            category_id
        FROM
            Categories
        WHERE
            category_name = 'Electronics'
    );