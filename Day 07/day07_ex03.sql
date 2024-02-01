SELECT name, SUM(count) AS total_count
FROM ((SELECT pz.name, COUNT(order_date) AS count
       FROM pizzeria pz
                JOIN menu m ON pz.id = m.pizzeria_id
                JOIN person_order po ON m.id = po.menu_id
       GROUP BY pz.name
       ORDER BY count DESC)
      UNION
      (SELECT pz.name, COUNT(visit_date) AS count
       FROM pizzeria pz
                JOIN person_visits pv ON pz.id = pv.pizzeria_id
       GROUP BY pz.name
       ORDER BY count DESC)) AS a
GROUP BY name
ORDER BY total_count DESC, name;