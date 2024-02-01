SELECT pz.name
FROM (SELECT p.id, p.name, pv.visit_date
      FROM person_visits pv
               JOIN person p
                    ON pv.person_id = p.id
               JOIN pizzeria pz
                    ON pv.pizzeria_id = pz.id
      WHERE p.name = 'Andrey'
      EXCEPT
      SELECT p.id, p.name, po.order_date
      FROM person_order po
               JOIN person p
                    ON po.person_id = p.id) AS f
         JOIN person_visits pv
              ON f.id = pv.person_id
         JOIN pizzeria pz
              ON pv.pizzeria_id = pz.id
WHERE f.visit_date = pv.visit_date