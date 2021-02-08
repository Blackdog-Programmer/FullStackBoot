-- Ref: https://www.postgresqltutorial.com/postgresql-order-by/

SELECT
    first_name,
    last_name
FROM
    customer
ORDER BY
    -- [ASC | DESC] ASC is default option
    first_name ASC,
    last_name DESC;


-- Sort customer's full-names based on length by descending order
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    LENGTH(concat(first_name, ' ', last_name)) AS full_name_length
FROM
    customer
ORDER BY
    full_name_length DESC;


-- Also can order null-values
CREATE TABLE demo
(
    id SERIAL,
    name VARCHAR
);

INSERT INTO demo(name)
VALUES ('IoTex'), ('DOGE'), ('XMR'), (NULL);

SELECT
    name
FROM
    demo
ORDER BY
    name DESC NULLS FIRST;

DROP TABLE demo;
