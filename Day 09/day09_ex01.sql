DROP FUNCTION IF EXISTS fnc_trg_person_update_audit;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;

CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
    VALUES ('U'::BPCHAR, old.id, old.name, old.age, old.gender, old.address);
    RETURN new;
END;
$BODY$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;