DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                id      BIGINT,
                name    VARCHAR,
                age     INTEGER,
                gender  VARCHAR,
                address VARCHAR
            )
AS
$BODY$
SELECT *
FROM person
WHERE person.gender = 'female';
$BODY$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                id      BIGINT,
                name    VARCHAR,
                age     INTEGER,
                gender  VARCHAR,
                address VARCHAR
            )
AS
$BODY$
SELECT *
FROM person
WHERE person.gender = 'male';
$BODY$
    LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();