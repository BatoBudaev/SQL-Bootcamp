DROP FUNCTION IF EXISTS fnc_fibonacci;

CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                fibonacci INTEGER
            )
AS
$BODY$
WITH RECURSIVE fibo AS (SELECT 1 AS first, 1 AS second
                        UNION ALL
                        SELECT second, first + second
                        FROM fibo
                        WHERE second < pstop)
SELECT first
FROM fibo;
$BODY$ LANGUAGE sql;

SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci();