-- Inserting Authors
INSERT INTO
    Author (Author_ID, Author_Name, Biography)
VALUES
    (
        1,
        'John Doe',
        'John Doe is an acclaimed author of science fiction and fantasy novels.'
    ),
    (
        2,
        'Jane Smith',
        'Jane Smith specializes in historical fiction and has won several awards for her detailed narratives.'
    ),
    (
        3,
        'Alice Johnson',
        'Alice Johnson writes thrilling mystery books that captivate readers around the world.'
    );

-- Inserting Books
INSERT INTO
    Book (
        Isbn,
        Title,
        Pub_Year,
        Quantity,
        Price,
        Author_ID
    )
VALUES
    (
        '978-3-16-148410-0',
        'The Great Adventure',
        2021,
        5,
        19.99,
        1
    ),
    (
        '978-1-23-456789-7',
        'History Unveiled',
        2019,
        2,
        29.99,
        2
    ),
    (
        '978-0-12-345678-9',
        'Mystery of the Night',
        2022,
        10,
        14.99,
        3
    );

-- Inserting Customers
INSERT INTO
    Customer (
        Customer_ID,
        Customer_Name,
        Customer_Address,
        Contact_Info,
        Uname,
        Pass
    )
VALUES
    (
        1,
        'Emily Brown',
        '1234 Elm St, Fictiontown, EF',
        '123-456-7890',
        'ebrown',
        'password1'
    ),
    (
        2,
        'Michael Davis',
        '5678 Maple Ave, Storyville, GH',
        '987-654-3210',
        'mdavis',
        'password2'
    );

-- Inserting Orders
INSERT INTO
    `Order` (Order_Id, Customer_ID, Order_Date, Order_Status)
VALUES
    (1, 1, '2024-05-01 10:30:00', 'Shipped'),
    (2, 2, '2024-05-02 15:45:00', 'Delivered');

-- Inserting Order Details
INSERT INTO
    Order_Details (Order_Id, Isbn, Quantity)
VALUES
    (1, '978-3-16-148410-0', 1),
    (2, '978-1-23-456789-7', 2);

-- Inserting Reviews
INSERT INTO
    Review (
        Review_ID,
        Order_ID,
        Isbn,
        Rating,
        Review_Comment
    )
VALUES
    (
        1,
        1,
        '978-3-16-148410-0',
        5.0,
        'Absolutely loved the book! Highly recommend.'
    ),
    (
        2,
        2,
        '978-1-23-456789-7',
        4.5,
        'Very interesting historical insights. A bit lengthy but worth it.'
    );

--ADD MORE ROWS
-- Inserting additional Authors
INSERT INTO
    Author (Author_ID, Author_Name, Biography)
VALUES
    (
        4,
        'Bob White',
        'Bob White has been a leading voice in modern philosophy with numerous influential works.'
    ),
    (
        5,
        'Sara Green',
        'Known for her poignant poetry and essays, Sara Green has captured the hearts of many.'
    ),
    (
        6,
        'Luke Black',
        'A contemporary novelist, Luke Black weaves complex characters into everyday settings.'
    ),
    (
        7,
        'Clara Blue',
        'Clara Blue is a renowned historian focusing on European history.'
    ),
    (
        8,
        'Oscar Grey',
        'Oscar Grey writes action-packed thrillers that have garnered a global following.'
    ),
    (
        9,
        'Lily King',
        'Lily King''s children’s books have been beloved by young readers and critics alike.'
    ),
    (
        10,
        'Mark Red',
        'Mark Red specializes in horror novels that chill and thrill.'
    ),
    (
        11,
        'Nora Yellow',
        'Nora Yellow writes romantic novels that explore complex relationships.'
    ),
    (
        12,
        'Henry Violet',
        'Henry Violet has made significant contributions to the field of science writing.'
    ),
    (
        13,
        'Zoe Cyan',
        'Zoe Cyan is known for her travel diaries and adventure stories.'
    );

-- Inserting additional Books
INSERT INTO
    Book (
        Isbn,
        Title,
        Pub_Year,
        Quantity,
        Price,
        Author_ID
    )
VALUES
    (
        '978-4-16-148411-1',
        'Philosophical Thoughts',
        2020,
        7,
        23.50,
        4
    ),
    (
        '978-5-23-456789-8',
        'Echoes of the Heart',
        2018,
        4,
        15.95,
        5
    ),
    (
        '978-6-34-765432-1',
        'Everyday Life',
        2023,
        12,
        12.99,
        6
    ),
    (
        '978-7-45-987654-2',
        'Ancient Europe',
        2017,
        3,
        27.99,
        7
    ),
    (
        '978-8-56-121314-5',
        'The Chase',
        2022,
        6,
        13.49,
        8
    ),
    (
        '978-9-67-141516-7',
        'Magic Forest',
        2021,
        8,
        9.99,
        9
    ),
    (
        '978-0-78-171819-0',
        'Dark Nights',
        2019,
        5,
        18.99,
        10
    ),
    (
        '978-1-89-202122-3',
        'Love and Loss',
        2020,
        10,
        14.99,
        11
    ),
    (
        '978-2-90-232425-6',
        'The Wonders of Science',
        2018,
        6,
        22.50,
        12
    ),
    (
        '978-3-01-262728-9',
        'Around the World in 80 Tales',
        2022,
        9,
        19.50,
        13
    );

-- Inserting additional Customers
INSERT INTO
    Customer (
        Customer_ID,
        Customer_Name,
        Customer_Address,
        Contact_Info,
        Uname,
        Pass
    )
VALUES
    (
        3,
        'Jessica Fox',
        '9012 Cedar St, Noveltown, JK',
        '901-234-5678',
        'jfox',
        'password3'
    ),
    (
        4,
        'Daniel Stone',
        '3456 Birch Rd, Fablecity, LM',
        '802-468-3571',
        'dstone',
        'password4'
    ),
    (
        5,
        'Karen Knight',
        '7890 Spruce Blvd, Talecity, NO',
        '693-157-2849',
        'kknight',
        'password5'
    ),
    (
        6,
        'Chris Pond',
        '1234 Oak Ln, Mythtown, PQ',
        '784-123-5698',
        'cpond',
        'password6'
    ),
    (
        7,
        'Patricia Vine',
        '5678 Pine Rd, Loreville, RS',
        '689-134-7890',
        'pvine',
        'password7'
    ),
    (
        8,
        'Terry Brooks',
        '9101 Ash Dr, Sagatown, TU',
        '560-491-2345',
        'tbrooks',
        'password8'
    ),
    (
        9,
        'Samantha Reed',
        '2345 Elm Cir, Fableforge, VW',
        '431-569-8745',
        'sreed',
        'password9'
    ),
    (
        10,
        'Ethan Wood',
        '6789 Maple St, Mythica, XY',
        '392-468-1357',
        'ewood',
        'password10'
    );

-- Inserting additional Orders
INSERT INTO
    `Order` (Order_Id, Customer_ID, Order_Date, Order_Status)
VALUES
    (3, 3, '2024-05-03 11:20:00', 'Pending'),
    (4, 4, '2024-05-04 16:15:00', 'Shipped'),
    (5, 5, '2024-05-05 12:45:00', 'Delivered'),
    (6, 6, '2024-05-06 14:30:00', 'Shipped'),
    (7, 7, '2024-05-07 09:25:00', 'Pending'),
    (8, 8, '2024-05-08 17:00:00', 'Delivered'),
    (9, 9, '2024-05-09 13:50:00', 'Shipped'),
    (10, 10, '2024-05-10 18:30:00', 'Pending');

-- Inserting additional Order Details
INSERT INTO
    Order_Details (Order_Id, Isbn, Quantity)
VALUES
    (3, '978-4-16-148411-1', 2),
    (4, '978-5-23-456789-8', 1),
    (5, '978-6-34-765432-1', 3),
    (6, '978-7-45-987654-2', 1),
    (7, '978-8-56-121314-5', 1),
    (8, '978-9-67-141516-7', 2),
    (9, '978-0-78-171819-0', 2),
    (10, '978-1-89-202122-3', 3);

-- Inserting additional Reviews
INSERT INTO
    Review (
        Review_ID,
        Order_ID,
        Isbn,
        Rating,
        Review_Comment
    )
VALUES
    (
        3,
        3,
        '978-4-16-148411-1',
        3.5,
        'Interesting thoughts but a bit dry.'
    ),
    (
        4,
        4,
        '978-5-23-456789-8',
        4.0,
        'Heartwarming and inspiring.'
    ),
    (
        5,
        5,
        '978-6-34-765432-1',
        5.0,
        'Relatable stories that really resonate.'
    ),
    (
        6,
        6,
        '978-7-45-987654-2',
        4.5,
        'Fascinating deep dive into history.'
    ),
    (
        7,
        7,
        '978-8-56-121314-5',
        3.0,
        'Fast-paced but lacks depth in characters.'
    ),
    (
        8,
        8,
        '978-9-67-141516-7',
        4.5,
        'A magical journey for kids and adults alike.'
    ),
    (
        9,
        9,
        '978-0-78-171819-0',
        2.5,
        'Too scary for me, but well-written.'
    ),
    (
        10,
        10,
        '978-1-89-202122-3',
        4.5,
        'Beautiful exploration of love’s complexities.'
    );