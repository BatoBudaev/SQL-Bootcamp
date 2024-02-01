--Session #1
--make sure you are at a default isolation level in your database
SHOW TRANSACTION ISOLATION LEVEL;
--Session #2
--make sure you are at a default isolation level in your database
SHOW TRANSACTION ISOLATION LEVEL;

--Session #1
--begin transaction
BEGIN;
--Session #2
--begin transaction
BEGIN;
--Session #1
--check that you can see a initial value
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
--check that you can see a initial value
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #1
--update of rating for “Pizza Hut” to 4 points in a transaction mode
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
--Session #2
--update of rating for “Pizza Hut” to 3.6 points in a transaction mode
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
--Session #1
--commit changes
COMMIT;
--Session #2
--commit changes
COMMIT;
--Session #1
--check that you can see a changes (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
--check that you can see a changes (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';