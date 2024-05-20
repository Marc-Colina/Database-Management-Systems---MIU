CREATE TABLE Book (
    Isbn VARCHAR(20) NOT NULL,
    Title VARCHAR(255),
    Pub_Year INT,
    Quantity INT,
    Price DOUBLE,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Isbn)
);

CREATE TABLE `Order` (
    Order_Id INT NOT NULL,
    Customer_ID INT NOT NULL,
    Order_Date DATETIME,
    Order_Status ENUM('Pending', 'Shipped', 'Delivered'),
    PRIMARY KEY (Order_Id)
);

CREATE TABLE Order_Details(
    Order_Details_Id INT NOT NULL AUTO_INCREMENT,
    Order_Id INT NOT NULL,
    Isbn VARCHAR(20) NOT NULL,
    Quantity INT,
    PRIMARY KEY (Order_Details_Id),
    FOREIGN KEY (Order_Id) REFERENCES `Order`(Order_Id),
    FOREIGN KEY (Isbn) REFERENCES Book(Isbn)
);

CREATE TABLE Author(
    Author_ID INT NOT NULL,
    Author_Name VARCHAR(255),
    Biography TEXT,
    PRIMARY KEY (Author_ID)
);

ALTER TABLE
    Book
ADD
    CONSTRAINT fk_book_author_id FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID);

CREATE TABLE Customer(
    Customer_ID INT NOT NULL,
    Customer_Name VARCHAR(255),
    Customer_Address VARCHAR(255),
    Contact_Info VARCHAR(20),
    Uname VARCHAR(255),
    Pass VARCHAR(255),
    PRIMARY KEY (Customer_ID)
);

ALTER TABLE
    `Order`
ADD
    CONSTRAINT fk_order_customer_id FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);

CREATE TABLE Review(
    Review_ID INT NOT NULL,
    Order_ID INT NOT NULL,
    Isbn VARCHAR(20) NOT NULL,
    Rating DOUBLE,
    Review_Comment TEXT,
    PRIMARY KEY (Review_ID),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_Id),
    FOREIGN KEY (Isbn) REFERENCES Book(Isbn)
);

