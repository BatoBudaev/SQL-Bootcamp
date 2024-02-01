SELECT address, pz.name, COUNT(order_date) AS count_of_orders
FROM person p
         JOIN person_order po ON p.id = po.person_id
         JOIN menu m ON po.menu_id = m.id
         JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY address, pz.name
ORDER BY address, pz.name;