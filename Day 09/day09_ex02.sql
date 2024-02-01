DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
    VALUES ('D'::BPCHAR, old.id, old.name, old.age, old.gender, old.address);
    RETURN old;
END;
$BODY$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
    BEFORE DELETE
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;