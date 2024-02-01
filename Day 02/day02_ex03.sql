WITH date_range AS (SELECT generate_series(
                                   '2022-01-01'::date,
                                   '2022-01-10'::date,
                                   interval '1 day'
                               )::date AS visit_date)
SELECT dr.visit_date
FROM date_range dr
         LEFT JOIN (SELECT visit_date
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) pv
                   ON pv.visit_date = dr.visit_date
WHERE pv.visit_date IS NULL
ORDER BY dr.visit_date;