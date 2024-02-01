INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria_id
         FROM pizzeria pz
                  JOIN menu m
                       ON pz.id = m.pizzeria_id
         WHERE price < 800
           AND pz.name != 'Papa Johns'
         LIMIT 1),
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;