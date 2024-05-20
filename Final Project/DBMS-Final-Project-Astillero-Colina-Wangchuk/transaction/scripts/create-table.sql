-- Creating the hotel table
CREATE TABLE hotel (
    hotelNo INT PRIMARY KEY,
    hotelName VARCHAR(50),
    city VARCHAR(50)
);

-- Creating the guest table
CREATE TABLE guest (
    guestNo INT PRIMARY KEY,
    guestName VARCHAR(50),
    guestAddress VARCHAR(100)
);

-- Creating the room table
CREATE TABLE room (
    roomNo INT PRIMARY KEY,
    hotelNo INT,
    type VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (hotelNo) REFERENCES hotel(hotelNo)
);

-- Creating the booking table
CREATE TABLE booking (
    hotelNo INT,
    guestNo INT,
    dateFrom DATE,
    dateTo DATE,
    roomNo INT,
    PRIMARY KEY (hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES guest(guestNo),
    FOREIGN KEY (roomNo) REFERENCES room(roomNo)
);