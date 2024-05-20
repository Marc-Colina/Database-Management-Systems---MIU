-- Session 1: Set isolation level to Repeatable Read, start a transaction, and read a record
SET
    TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT
    *
FROM
    room
WHERE
    roomNo = 2;

-- Session 2: Update the same record and commit
SET
    TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

UPDATE
    room
SET
    price = 230
WHERE
    roomNo = 2;

COMMIT;

-- Session 1: Read the same record again in the same transaction
SELECT
    *
FROM
    room
WHERE
    roomNo = 2;

/* Expected Output: Room price shows 210, ensuring repeatable read */
-- Session 1: Commit the transaction
COMMIT;

-- Session 1: Read the record after the transaction is committed
SELECT
    *
FROM
    room
WHERE
    roomNo = 2;

/* Expected Output: Room price shows 230 */