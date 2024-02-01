SELECT generate_series::date AS visit_date
FROM generate_series(
             '2022-01-01'::date,
             '2022-01-10'::date,
             interval '1 day'
         ) generate_series
         LEFT JOIN (SELECT DISTINCT visit_date
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) pv ON generate_series::date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY visit_date;