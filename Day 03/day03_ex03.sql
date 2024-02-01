SELECT pizzeria_name
FROM (SELECT pz.name AS pizzeria_name, p.gender, COUNT(*) AS visit_count
      FROM person_visits pv
               JOIN person p ON pv.person_id = p.id
               JOIN pizzeria pz ON pv.pizzeria_id = pz.id
      WHERE p.gender = 'male'
      GROUP BY pv.pizzeria_id, pz.name, p.gender
      UNION ALL
      SELECT pz.name AS pizzeria_name, p.gender, COUNT(*) AS visit_count
      FROM person_visits pv
               JOIN person p ON pv.person_id = p.id
               JOIN pizzeria pz ON pv.pizzeria_id = pz.id
      WHERE p.gender = 'female'
      GROUP BY pv.pizzeria_id, pz.name, p.gender) AS combined_visits
GROUP BY pizzeria_name
HAVING SUM(CASE WHEN gender = 'male' THEN visit_count ELSE 0 END) !=
       SUM(CASE WHEN gender = 'female' THEN visit_count ELSE 0 END)
ORDER BY pizzeria_name;