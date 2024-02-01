CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price - price * 0.1) AS discount_price
FROM person p
         JOIN person_order AS po
              ON p.id = po.person_id
         JOIN menu AS m
              ON po.menu_id = m.id
ORDER BY name, pizza_name