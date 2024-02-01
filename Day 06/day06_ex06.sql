CREATE SEQUENCE IF NOT EXISTS seq_person_discounts START WITH 1 INCREMENT BY 1;

SELECT setval('seq_person_discounts', (SELECT COALESCE(MAX(id), 0) FROM person_discounts));
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (1, 1, 10);