-- Insert hotels
INSERT INTO Hotel VALUES (1, 'Grosvenor Hotel', 'London');
INSERT INTO Hotel VALUES (2, 'The Ritz', 'London');
INSERT INTO Hotel VALUES (3, 'Marriott', 'Bristol');
INSERT INTO Hotel VALUES (4, 'Boracay Sands', 'Boracay');
INSERT INTO Hotel VALUES (5, 'Cebu Seaside', 'Cebu');
INSERT INTO Hotel VALUES (6, 'Davao Pearl', 'Davao');



-- Insert rooms
INSERT INTO Room VALUES (101, 1, 'Single', 120.00);
INSERT INTO Room VALUES (102, 1, 'Double', 200.00);
INSERT INTO Room VALUES (201, 2, 'Suite', 350.00);
INSERT INTO Room VALUES (202, 2, 'Single', 150.00);
INSERT INTO Room VALUES (301, 3, 'Single', 90.00);
INSERT INTO Room VALUES (302, 3, 'Double', 180.00);
INSERT INTO Room VALUES (401, 4, 'Single', 85.00);
INSERT INTO Room VALUES (402, 4, 'Double', 150.00);
INSERT INTO Room VALUES (501, 5, 'Suite', 240.00);
INSERT INTO Room VALUES (502, 5, 'Family', 200.00);
INSERT INTO Room VALUES (601, 6, 'Single', 75.00);
INSERT INTO Room VALUES (602, 6, 'Double', 140.00);



-- Insert guests
INSERT INTO Guest VALUES (1, 'John Doe', '1234 Elm St');
INSERT INTO Guest VALUES (2, 'Jane Smith', '5678 Oak St');
INSERT INTO Guest VALUES (3, 'Alice Johnson', '9012 Maple St');
INSERT INTO Guest VALUES (4, 'Jose Rizal', '123 Kalayaan St');
INSERT INTO Guest VALUES (5, 'Maria Clara', '456 Katipunan Rd');
INSERT INTO Guest VALUES (6, 'Andres Bonifacio', '789 Revolucion Ave');
INSERT INTO Guest VALUES (7, 'Gabriela Silang', '321 Libertad Blvd');



-- Insert bookings
INSERT INTO Booking VALUES (1, 1, '2023-08-01', '2023-08-03', 101);
INSERT INTO Booking VALUES (1, 2, '2023-08-02', '2023-08-05', 102);
INSERT INTO Booking VALUES (2, 1, '2023-08-04', '2023-08-06', 201);
INSERT INTO Booking VALUES (3, 3, '2023-08-05', '2023-08-07', 302);
INSERT INTO Booking VALUES (4, 4, '2023-08-01', '2023-08-05', 401);
INSERT INTO Booking VALUES (4, 5, '2023-08-02', '2023-08-04', 402);
INSERT INTO Booking VALUES (5, 6, '2023-08-15', NULL, 501); -- Example of an ongoing stay with no checkout date specified yet
INSERT INTO Booking VALUES (5, 7, '2023-08-12', '2023-08-14', 502);
INSERT INTO Booking VALUES (6, 4, '2023-08-07', '2023-08-10', 602);
