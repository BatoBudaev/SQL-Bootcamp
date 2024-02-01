COMMENT ON TABLE person_discounts IS 'table of discounts for specific persons in specific pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'identifier of discount for specific person in specific pizzerias in table of discounts';
COMMENT ON COLUMN person_discounts.person_id IS 'identifier of specific person in table of discounts';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'identifier of specific pizzeria in table of discounts';
COMMENT ON COLUMN person_discounts.discount IS 'discount value for specific person in specific pizzeria';
WITH table_oid AS (SELECT oid FROM pg_class WHERE relname = 'person_discounts')
SELECT obj_description((SELECT oid FROM table_oid), 'pg_class'),
       col_description((SELECT oid FROM table_oid), 1),
       col_description((SELECT oid FROM table_oid), 2),
       col_description((SELECT oid FROM table_oid), 3),
       col_description((SELECT oid FROM table_oid), 4);