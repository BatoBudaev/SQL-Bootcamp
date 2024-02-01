SELECT p.name AS person_name, m.pizza_name, pz.name AS pizzeria_name
FROM person_order AS po
         JOIN person AS p ON po.person_id = p.id
         JOIN menu AS m ON po.menu_id = m.id
         JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name, pz.name;