SELECT pz.name,
       COUNT(order_date)    AS count_of_orders,
       ROUND(AVG(price), 2) AS average_price,
       MAX(price)           AS max_price,
       MIN(price)           AS min_price
FROM person_order po
         JOIN menu m ON po.menu_id = m.id
         JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY pz.name