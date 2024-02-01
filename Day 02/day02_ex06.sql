SELECT pizza_name, pz.name AS pizzeria_name
FROM menu m
         JOIN pizzeria pz
              ON pz.id = m.pizzeria_id
         JOIN person_order po
              ON po.menu_id = m.id
         JOIN person p
              ON po.person_id = p.id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name