--Simple Queries
--5.7
SELECT * FROM Hotel;

--5.8
SELECT * FROM Hotel
WHERE city = 'London';

--5.9
SELECT 
    g.guestName AS Guest,
    g.guestAddress AS `Address`
FROM Guest g 
INNER JOIN Booking b ON b.guestNo = g.guestNo
INNER JOIN Hotel h ON h.hotelNo = b.hotelNo
WHERE h.city = 'London'
ORDER BY g.guestName ASC;

--5.10
SELECT * FROM Room
WHERE (`type` = 'Double' OR `type` = 'Family')
AND (price <40)
ORDER BY price ASC;

--5.11
SELECT * FROM Booking
WHERE dateTo IS NULL;


--Aggregate Functions
--5.12
SELECT COUNT(*) AS Hotel_Count FROM Hotel;

--5.13
SELECT AVG(price) AS AVG_Room_Price FROM Room;

--5.14
SELECT SUM(DATEDIFF(b.dateTo,b.dateFrom) * r.price) AS Total_Revenue_For_Double_Room
FROM Booking b
INNER JOIN Room r ON r.roomNo = b.roomNo AND r.hotelNo = b.hotelNo
WHERE r.type = 'Double';

--5.15
WITH Guests_In_August AS (
    SELECT DISTINCT guestNo
    FROM Booking
    WHERE MONTH(dateFrom) = 8 OR MONTH(dateTo) = 8
)
SELECT COUNT(*) AS August_Guests
FROM Guests_In_August;


--Subqueries and JOINs
--5.16
SELECT
    r.price AS Room_Price,
    r.type AS Room_Type
FROM Room r 
INNER JOIN Hotel h ON h.hotelNo = r.hotelNo
WHERE h.hotelName = 'Grosvenor Hotel';

--5.17
SELECT g.guestName AS Guest
FROM Guest g 
INNER JOIN Booking b ON b.guestNo = g.guestNo
INNER JOIN Hotel h ON h.hotelNo = b.hotelNo
WHERE h.hotelName = 'Grosvenor Hotel'

--5.18
SELECT
    r.roomNo AS Room_Number, 
    r.hotelNo AS Hotel_Number, 
    r.type AS Room_Type,
    r.price AS Room_Price,
    g.guestName AS Guest
FROM Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
LEFT JOIN Booking b ON b.hotelNo = r.hotelNo AND b.roomNo = r.roomNo
LEFT JOIN Guest g ON b.guestNo = g.guestNo
WHERE h.hotelName = 'Grosvenor Hotel';


--5.19
SELECT
    SUM(r.price) AS Total_Revenue_Today
FROM Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
INNER JOIN Booking b ON b.hotelNo = r.hotelNo AND b.roomNo = r.roomNo
WHERE 
    h.hotelName = 'Grosvenor Hotel'
    AND b.dateFrom <= CURDATE()
    AND (b.dateTo >= CURDATE() OR b.dateTo IS NULL);

--5.20
SELECT
    r.roomNo AS Room_Number, 
    r.hotelNo AS Hotel_Number, 
    r.type AS Room_Type,
    r.price AS Room_Price
FROM Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
WHERE h.hotelName = 'Grosvenor Hotel' AND (r.roomNo, r.hotelNo)
NOT IN (
    SELECT roomNo,hotelNo
    FROM Booking
);

--5.21
--This is assuming we are calculating the lost revenue of 
--Grosvenor Hotel in the current date. Meaning those unbooked rooms today.
SELECT
    SUM(r.price) AS Lost_Revenue
FROM Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
WHERE h.hotelName = 'Grosvenor Hotel' AND (r.roomNo, r.hotelNo)
NOT IN (
    SELECT roomNo,hotelNo
    FROM Booking
    WHERE CURDATE() BETWEEN dateFrom AND COALESCE(dateTo, CURDATE())
);

--Grouping
--5.22
SELECT
    h.hotelNo,
    h.hotelName,
    Count(*) AS Num_Rooms
FROM
    Hotel h 
INNER JOIN Room r ON r.hotelNo = h.hotelNo
GROUP BY 
    h.hotelNo,
    h.hotelName;

--5.23
SELECT
    h.hotelNo,
    h.hotelName,
    Count(*) AS Num_Rooms
FROM
    Hotel h 
INNER JOIN Room r ON r.hotelNo = h.hotelNo
WHERE h.city = 'London'
GROUP BY 
    h.hotelNo,
    h.hotelName;

--5.24
SELECT 
    h.hotelNo,
    h.hotelName,
    COUNT(*) AS TotalBookings,
    COUNT(*) / 31.0 AS AvgBookingsPerDay
FROM Hotel h
LEFT JOIN Booking b ON h.hotelNo = b.hotelNo
    AND (MONTH(b.dateFrom) = 8 OR MONTH(b.dateTo) = 8)
GROUP BY h.hotelNo, h.hotelName;

--5.25
WITH RoomTypeBooked AS (SELECT
    h.hotelName,
    r.type,
    COUNT(*) AS Num_Room_Type_Booked
FROM
    Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
INNER JOIN Booking b ON b.hotelNo = r.hotelNo AND b.roomNo = r.roomNo
WHERE h.city = 'London'
GROUP BY
    h.hotelName,
    r.type
),
MaxRoomTypeBooked AS (SELECT 
    rtb.hotelName,
    MAX(Num_Room_Type_Booked) AS Max_Number
FROM RoomTypeBooked rtb
GROUP BY rtb.hotelName)
SELECT 
    rtb.hotelName,
    `type`,
    Num_Room_Type_Booked
FROM RoomTypeBooked rtb
INNER JOIN MaxRoomTypeBooked mrtb ON mrtb.hotelName = rtb.hotelName AND mrtb.Max_Number = rtb.Num_Room_Type_Booked;

--5.26
SELECT 
    h.hotelNo,
    h.hotelName,
    SUM(r.price) AS Lost_Revenue_Today
FROM
    Hotel h
INNER JOIN Room r ON r.hotelNo = h.hotelNo
INNER JOIN Booking b ON b.hotelNo = r.hotelNo AND b.roomNo = r.roomNo
WHERE (r.hotelNo,r.roomNo) NOT IN 
(
    SELECT hotelNo,roomNo
    FROM Booking
    WHERE CURDATE() BETWEEN dateFrom AND COALESCE(dateTo,CURDATE())
)
GROUP BY
    h.hotelNo,h.hotelName;

--Populating Tables
--5.27
--The population of tables SQL queries can be found in the populate-data.sql file.

--5.28
UPDATE Room
SET price = price * 1.05;



