DROP TABLE IF EXISTS person_audit;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;

CREATE TABLE IF NOT EXISTS person_audit
(
    created    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1)                  DEFAULT 'I'::BPCHAR       NOT NULL,
    row_id     BIGINT                                             NOT NULL,
    name       VARCHAR,
    age        INTEGER,
    gender     VARCHAR,
    address    VARCHAR
);

ALTER TABLE person_audit
    ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I'::BPCHAR, 'D'::BPCHAR, 'U'::BPCHAR));

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO person_audit (row_id, name, age, gender, address)
    VALUES (new.id, new.name, new.age, new.gender, new.address);
    RETURN new;
END;
$BODY$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');


