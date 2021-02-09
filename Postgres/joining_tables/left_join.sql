-- Ref: https://www.postgresqltutorial.com/postgresql-left-join/

SELECT
    COUNT(*)
FROM
    film
INNER JOIN inventory
    ON film.film_id = inventory.film_id
;


SELECT
    COUNT(*)
FROM
    film
LEFT JOIN inventory
    ON film.film_id = inventory.film_id
;


SELECT
    film.film_id,
    inventory.film_id
FROM
    film
LEFT JOIN inventory
    ON film.film_id = inventory.film_id
ORDER BY
    inventory.film_id NULLS FIRST
;