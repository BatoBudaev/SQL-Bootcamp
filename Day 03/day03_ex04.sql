WITH cte_m AS (SELECT DISTINCT piz.name
               FROM person_order po
                        JOIN person p ON po.person_id = p.id
                        JOIN menu m ON m.id = po.menu_id
                        JOIN pizzeria piz ON piz.id = m.pizzeria_id
               WHERE p.gender = 'male'),
     cte_f AS (SELECT DISTINCT piz.name
               FROM person_order po
                        JOIN person p ON po.person_id = p.id
                        JOIN menu m ON m.id = po.menu_id
                        JOIN pizzeria piz ON piz.id = m.pizzeria_id
               WHERE p.gender = 'female'),
     cte_uni_mf AS (SELECT cte_m.name
                    FROM cte_m
                    EXCEPT
                    SELECT cte_f.name
                    FROM cte_f),
     cte_uni_fm AS (SELECT cte_f.name
                    FROM cte_f
                    EXCEPT
                    SELECT cte_m.name
                    FROM cte_m)
SELECT c1.name
FROM cte_uni_fm c1
UNION
SELECT c2.name
FROM cte_uni_mf c2
