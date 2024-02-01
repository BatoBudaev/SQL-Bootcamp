SELECT p.name
FROM person p
         JOIN person_order po
              ON p.id = po.person_id
         JOIN menu m
              ON po.menu_id = m.id
WHERE p.gender = 'female'
  AND pizza_name = 'pepperoni pizza'
INTERSECT
SELECT p.name
FROM person p
         JOIN person_order po
              ON p.id = po.person_id
         JOIN menu m
              ON po.menu_id = m.id
WHERE p.gender = 'female'
  AND pizza_name = 'cheese pizza'
ORDER BY name