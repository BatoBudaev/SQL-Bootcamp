SELECT p.name,
       m.pizza_name,
       m.price,
       m.price - (m.price / 100 * coalesce(discount, 0)) AS discount_price,
       pz.name                                           AS pizzeria_name
FROM person_discounts pd
         JOIN person p
              ON pd.person_id = p.id
         JOIN pizzeria pz ON pd.pizzeria_id = pz.id
         JOIN menu m ON pz.id = m.pizzeria_id
ORDER BY name, pizza_name