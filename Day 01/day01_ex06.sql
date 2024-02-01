SELECT DISTINCT order_date AS action_date, name AS person_name
FROM person_order
         INNER JOIN person
                    ON person_id = person.id
ORDER BY action_date, person_name DESC;