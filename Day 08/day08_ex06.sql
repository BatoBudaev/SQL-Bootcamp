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
--check that you can see initial sum of rating
SELECT SUM(rating) FROM pizzeria;
--Session #2
--update of rating for “Pizza Hut” to 5 points in a transaction mode
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
--Session #2
--commit changes
COMMIT;
--Session #1
--check that you can see initial sum of rating
SELECT SUM(rating) FROM pizzeria;
--Session #1
--commit changes
COMMIT;
--Session #1
--check that you can see changed sum of rating
SELECT SUM(rating) FROM pizzeria;
--Session #2
--check that you can see changed sum of rating
SELECT SUM(rating) FROM pizzeria;