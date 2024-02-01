SELECT pizza_name, pz.name AS pizzeria_name, price
FROM menu m
         LEFT JOIN pizzeria pz
                   ON pz.id = m.pizzeria_id
WHERE pizza_name = 'mushroom pizza'
   OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name


