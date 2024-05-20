-- Session 1: Start a transaction and update a record without committing
START TRANSACTION;

UPDATE
    room
SET
    price = 220
WHERE
    roomNo = 2;

-- Session 2: Read the same record before the transaction in Session 1 is committed
SET
    TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT
    *
FROM
    room
WHERE
    roomNo = 2;

/* Expected Output: Room price shows 210, preventing dirty read */
-- Session 1: Commit the transaction
COMMIT;

-- Session 2: Read the record after the transaction in Session 1 is committed
SELECT
    *
FROM
    room
WHERE
    roomNo = 2;

/* Expected Output: Room price shows 220 */