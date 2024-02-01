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
--update of rating
UPDATE pizzeria SET rating = 2.1 WHERE id = 1;
--Session #2
--update of rating
UPDATE pizzeria SET rating = 2.3 WHERE id = 2;
--Session #1
--update of rating
UPDATE pizzeria SET rating = 2.2 WHERE id = 2;
--Session #2
--update of rating
UPDATE pizzeria SET rating = 2.4 WHERE id = 1;
--ERROR
--Session #1
--commit changes
COMMIT;
--Session #2
--commit changes
COMMIT;
