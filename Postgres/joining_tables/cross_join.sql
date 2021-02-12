-- Ref: https://www.postgresqltutorial.com/postgresql-cross-join/

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
    (1, 'computer'),
    (2, 'fashion'),
    (3, 'automotive'),
    (4, 'music'),
    (5, 'pet');


-- 1. CROSS JOIN
SELECT
    *
FROM
    amazon
CROSS JOIN alibaba;

-- 2. FROM TABLES
SELECT
    *
FROM
    amazon, alibaba;

-- 3. INNER JOIN TRUE
SELECT
    *
FROM
    amazon
INNER JOIN alibaba ON TRUE;

-- Drop Tables
DROP TABLE amazon;
DROP TABLE alibaba;
