DROP FUNCTION IF EXISTS func_minimum;

CREATE OR REPLACE FUNCTION func_minimum(IN arr NUMERIC ARRAY)
    RETURNS TABLE
            (
                minimal_value NUMERIC
            )
AS
$BODY$
SELECT MIN(el)
FROM UNNEST(arr) AS el;
$BODY$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);