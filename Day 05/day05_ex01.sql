SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
    
SELECT pizza_name, p.name AS pizzeria_name
FROM menu m
         JOIN pizzeria AS p ON m.pizzeria_id = p.id;