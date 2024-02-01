DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date;

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmitriy',
                                                              IN pprice NUMERIC DEFAULT 500,
                                                              IN pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name VARCHAR
            )
AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT DISTINCT pizzeria.name
        FROM person
                 JOIN person_order ON person.id = person_order.person_id
                 JOIN person_visits ON person.id = person_visits.person_id AND
                                       person_order.order_date = person_visits.visit_date
                 JOIN menu ON person_order.menu_id = menu.id
                 JOIN pizzeria ON menu.pizzeria_id = pizzeria.id AND person_visits.pizzeria_id = pizzeria.id
        WHERE person.name = pperson
          AND menu.price < pprice
          AND person_order.order_date = pdate;
END;
$BODY$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');