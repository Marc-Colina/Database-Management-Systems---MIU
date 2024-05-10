CREATE SCHEMA Hotel_Management;
USE Hotel_Management;

CREATE TABLE Hotel(
    hotelNo INT NOT NULL,
    hotelName VARCHAR(255),
    city VARCHAR(255),
    PRIMARY KEY (hotelNo)
);

CREATE TABLE Room(
    roomNo INT NOT NULL,
    hotelNo INT NOT NULL,
    `type` VARCHAR(255),
    price DOUBLE,
    PRIMARY KEY (roomNo, hotelNo)
);

ALTER TABLE Room
ADD CONSTRAINT room_fk_hotelNo
FOREIGN KEY (hotelNo)
REFERENCES Hotel(hotelNo);

CREATE TABLE Booking(
    hotelNo INT NOT NULL,
    guestNo INT NOT NULL,
    dateFrom DATETIME NOT NULL,
    dateTo DATETIME,
    roomNo INT NOT NULL,
    PRIMARY KEY(hotelNo, guestNo, dateFrom)
);

ALTER TABLE Booking
ADD CONSTRAINT booking_fk_hotelNo
FOREIGN KEY (hotelNo)
REFERENCES Hotel(hotelNo),
ADD CONSTRAINT booking_fk_roomNo
FOREIGN KEY (roomNo)
REFERENCES Room(roomNo);

CREATE TABLE Guest(
    guestNo INT NOT NULL,
    guestName VARCHAR(255),
    guestAddress VARCHAR(255),
    PRIMARY KEY (guestNo)
);

ALTER TABLE Booking
ADD CONSTRAINT booking_fk_guestNo
FOREIGN KEY (guestNo)
REFERENCES Guest(guestNo);