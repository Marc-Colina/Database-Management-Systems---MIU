CREATE SCHEMA Store;
USE Store;

CREATE TABLE
    Products(
        product_id INT NOT NULL,
        product_name VARCHAR(255),
        price DOUBLE,
        category_id INT NOT NULL,
        PRIMARY KEY (product_id)
    );

CREATE TABLE
    Categories(
        category_id INT NOT NULL,
        category_name VARCHAR(255),
        PRIMARY KEY (category_id)
    );

ALTER TABLE
    Products
ADD CONSTRAINT 
    products_fk_category_id
FOREIGN KEY
    (category_id)
REFERENCES
    Categories(category_id);
