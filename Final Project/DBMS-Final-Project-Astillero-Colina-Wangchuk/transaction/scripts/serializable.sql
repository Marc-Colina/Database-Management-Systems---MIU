-- Ensure the guest exists
INSERT INTO
    guest (guestNo, guestName, guestAddress)
VALUES
    (204, 'Alice Johnson', '123 Maple St');

-- Session 1: Set isolation level to Serializable, start a transaction, and read records
SET
    TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

SELECT
    *
FROM
    booking
WHERE
    hotelNo = 102;

-- Session 2: Set isolation level to Serializable, attempt to insert a new record into the same range and commit
SET
    TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

INSERT INTO
    booking (hotelNo, guestNo, dateFrom, dateTo, roomNo)
VALUES
    (102, 204, '2024-01-20', '2024-01-25', 4);

/* Expected Output: Session 2 is blocked until Session 1 completes */
-- Session 1: Commit the transaction
COMMIT;

/* Session 2: The insert is now completed */