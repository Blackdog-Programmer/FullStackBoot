-- Reference: https://www.postgresqltutorial.com/postgresql-select-distinct/

-- Fetch all records
SELECT *
FROM film;

-- Number of file table records
SELECT COUNT(*)
FROM film;

-- Check existing duplicated records by film length column
SELECT COUNT(*)
FROM film
GROUP BY length;

-- DISTINCT clause evaluate the duplicated records base on combination of column
SELECT
    -- semantic error no filtered result because of film_id is unique
    DISTINCT length,
    film_id
FROM film;

SELECT
    -- Valid semantic statement
    DISTINCT ON (length) length,
    film_id
FROM film
ORDER BY length;