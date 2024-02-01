INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT COALESCE(MAX(id), 0) FROM person_order) + generate_series(1, (SELECT COUNT(*) FROM person)) AS id,
       generate_series(
               (SELECT MIN(id) FROM person),
               (SELECT MAX(id) FROM person)
           ),
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25';