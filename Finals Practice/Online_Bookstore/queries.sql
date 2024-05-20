--Retrieve all books published after 2020.
SELECT
    *
FROM
    Book
WHERE
    Pub_Year > 2020;

--Find all customers in 'Fictiontown' or 'Storyville'.
SELECT
    *
FROM
    Customer
WHERE
    Customer_Address LIKE '%Fictiontown%'
    OR Customer_Address LIKE '%Storyville%';

--List all books along with their authors' names.
SELECT
    b.Title,
    a.Author_Name
FROM
    Book b
    JOIN Author a ON a.Author_ID = b.Author_ID;

--Find the names of customers and the titles of books they have ordered.
SELECT
    c.Customer_Name,
    b.Title
FROM
    `Order` o
    JOIN Customer c ON c.Customer_ID = o.Customer_ID
    JOIN Order_Details od ON od.Order_ID = o.Order_ID
    JOIN Book b ON b.Isbn = od.Isbn;

--Show the total number of books sold by title.
SELECT
    b.Title,
    SUM(od.Quantity) AS Num_Books_Sold
FROM
    Order_Details od
    JOIN Book b ON b.Isbn = od.Isbn
GROUP BY
    b.Title;

--List authors who have published more than 3 books.
SELECT
    a.Author_ID,
    a.Author_Name,
    COUNT(*) AS Num_Books_Published
FROM
    Book b
    JOIN Author a ON a.Author_ID = b.Author_ID
GROUP BY
    a.Author_ID,
    a.Author_Name
HAVING
    COUNT(*) > 3;

--Find books that have been reviewed with a rating of 4 or higher.
SELECT
    Title
From
    Book
WHERE
    Isbn IN (
        SELECT
            Isbn
        FROM
            Review
        WHERE
            Rating >= 4
    );

--List customers who have placed an order for a book written by 'John Doe'.
SELECT
    DISTINCT Customer_Name
FROM
    Customer
WHERE
    Customer_ID IN (
        SELECT
            o.Customer_ID
        FROM
            `Order` o
            JOIN Order_Details od ON od.Order_ID = o.Order_ID
            JOIN Book b ON b.Isbn = od.Isbn
            JOIN Author a ON a.Author_ID = b.Author_ID
        WHERE
            a.Author_Name = 'John Doe'
    );

--Display the average price of books for each author, but only include authors who have an average book price greater than $20.
SELECT
    b.Author_ID,
    a.Author_Name,
    AVG(b.Price) AS Average_Price
FROM
    Book b
    JOIN Author a ON a.Author_ID = b.Author_ID
GROUP BY
    b.Author_ID,
    a.Author_Name
HAVING
    Average_Price > 20;

--List all authors and their books that have not been ordered.
SELECT
    a.Author_Name,
    b.Title
FROM
    Author a
    JOIN Book b ON b.Author_ID = a.Author_ID
WHERE
    (a.Author_ID, b.Isbn) NOT IN (
        SELECT
            b.Author_ID,
            od.Isbn
        FROM
            Order_Details od
            JOIN Book b ON b.Isbn = od.Isbn
    );

--Alternatively:
SELECT
    Author_Name,
    Title
FROM
    Book
    LEFT JOIN Order_Details ON Book.Isbn = Order_Details.Isbn
    JOIN Author ON Book.Author_ID = Author.Author_ID
WHERE
    Order_Details.Isbn IS NULL;

--Find the name and contact information of customers who have ordered books priced over $20.
SELECT
    DISTINCT Customer_Name,
    Contact_Info
FROM
    Customer c
WHERE
    Customer_ID IN (
        SELECT
            o.Customer_ID
        FROM
            `Order` o
            JOIN Order_Details od ON od.Order_ID = o.Order_ID
            JOIN Book b ON b.Isbn = od.Isbn
        WHERE
            b.Price > 20
    );

--List all books that have never been ordered.
SELECT
    b.Title
FROM
    Book b
    LEFT JOIN Order_Details od ON od.Isbn = b.Isbn
WHERE
    od.Isbn IS NULL;

--Show the average book price by year, only for years with more than 5 books published.
SELECT
    Pub_Year,
    COUNT(*),
    AVG(Price)
FROM
    Book
GROUP BY
    Pub_Year
HAVING
    COUNT(*) > 5;

-- Identify authors who have both the highest and lowest average book ratings.
WITH Author_Average_Rating AS (
    SELECT
        a.Author_ID,
        a.Author_Name,
        AVG(r.Rating) as AVERAGE_RATING
    FROM
        Author a
        JOIN Book b ON b.Author_ID = a.Author_ID
        JOIN Review r ON r.Isbn = b.Isbn
    GROUP BY
        a.Author_ID,
        a.Author_Name
)
SELECT
    aar.Author_Name,
    aar.AVERAGE_RATING
FROM
    Author_Average_Rating aar
WHERE
    aar.AVERAGE_RATING = (
        SELECT
            MAX(AVERAGE_RATING)
        FROM
            Author_Average_Rating
    )
    OR aar.AVERAGE_RATING = (
        SELECT
            MIN(AVERAGE_RATING)
        FROM
            Author_Average_Rating
    );