-- Inserting data into the hotel table
INSERT INTO
    hotel (hotelNo, hotelName, city)
VALUES
    (101, 'Ocean View', 'Santa Monica'),
    (102, 'London Bridge Hotel', 'London'),
    (103, 'Grosvenor Hotel', 'Los Angeles');

-- Inserting data into the guest table
INSERT INTO
    guest (guestNo, guestName, guestAddress)
VALUES
    (201, 'John Doe', '123 Elm St'),
    (202, 'Jane Smith', '456 Oak St'),
    (203, 'Jim Brown', '789 Pine St');

-- Inserting data into the room table
INSERT INTO
    room (roomNo, hotelNo, type, price)
VALUES
    (1, 101, 'Suite', 315),
    (2, 101, 'Double', 210),
    (3, 102, 'Suite', 263),
    (4, 102, 'Family', 41),
    (5, 103, 'Family', 26),
    (6, 103, 'Double', 231);

-- Inserting data into the booking table
INSERT INTO
    booking (hotelNo, guestNo, dateFrom, dateTo, roomNo)
VALUES
    (101, 201, '2024-01-01', '2024-01-05', 1),
    (102, 202, '2024-01-06', '2024-01-15', 2),
    (102, 203, '2024-01-10', '2024-01-20', 3),
    (103, 201, '2024-08-08', '2024-08-15', 4),
    (103, 202, '2024-05-04', '2024-05-13', 6);