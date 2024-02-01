(SELECT pz.name, COUNT(order_date) AS count, 'order' AS action_type
 FROM pizzeria pz
          JOIN menu m ON pz.id = m.pizzeria_id
          JOIN person_order po ON m.id = po.menu_id
 GROUP BY pz.name
 ORDER BY count DESC
 LIMIT 3)
UNION
(SELECT pz.name, COUNT(visit_date) AS count, 'visit' AS action_type
 FROM pizzeria pz
          JOIN person_visits pv ON pz.id = pv.pizzeria_id
 GROUP BY pz.name
 ORDER BY count DESC
 LIMIT 3)
ORDER BY action_type, count DESC;