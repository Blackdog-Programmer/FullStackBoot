-- Ref: https://www.postgresqltutorial.com/postgresql-natural-join/

-- Create Sample Tables
CREATE TABLE amazon
(
    category_id   INT PRIMARY KEY,
    category_name VARCHAR NOT NULL
);

CREATE TABLE alibaba
(
    category_id   INT PRIMARY KEY,
    category_name VARCHAR NOT NULL
);

-- Insert Sample Records
INSERT INTO amazon (category_id, category_name)
VALUES
    (1, 'automotive'),
    (2, 'computer'),
    (3, 'game'),
    (4, 'book'),
    (5, 'fashion');

INSERT INTO alibaba (category_id, category_name)
VALUES
    (1, 'automotive'),
    (2, 'computer'),
    (3, 'game'),
    (4, 'music'),
    (5, 'pet');

-- NATURE JOIN
SELECT
    *
FROM amazon
NATURAL JOIN alibaba;

-- NATURE INNER JOIN
SELECT
    *
FROM amazon
NATURAL INNER JOIN alibaba;

-- INNER JOIN: Same Result of NATURAL JOIN without any options
SELECT
    amazon.category_id   AS category_id,
    amazon.category_name AS category_name
FROM amazon
INNER JOIN alibaba
    ON amazon.category_id = alibaba.category_id AND
       amazon.category_name = alibaba.category_name;

-- NATURAL LEFT JOIN
SELECT
    amazon.category_id,
    amazon.category_name,
    alibaba.category_id,
    alibaba.category_name
FROM amazon
NATURAL LEFT JOIN alibaba;

-- NATURAL RIGHT JOIN
SELECT
    amazon.category_id,
    amazon.category_name,
    alibaba.category_id,
    alibaba.category_name
FROM amazon
NATURAL RIGHT JOIN alibaba;

-- Drop Tables
DROP TABLE amazon;
DROP TABLE alibaba;
