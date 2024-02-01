SELECT pizza_name, price, pz.name AS pizzeria_name
FROM (SELECT id AS menu_id
      FROM menu
      EXCEPT
      SELECT menu_id
      FROM person_order) AS f
         JOIN menu m
              ON f.menu_id = m.id
         JOIN pizzeria pz
              ON m.pizzeria_id = pz.id
ORDER BY pizza_name, price;
