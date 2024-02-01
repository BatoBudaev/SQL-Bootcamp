DROP INDEX IF EXISTS idx_menu_unique;
CREATE INDEX idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYSE

SELECT pz.name AS pizzeria_name, pizza_name
FROM menu m
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id