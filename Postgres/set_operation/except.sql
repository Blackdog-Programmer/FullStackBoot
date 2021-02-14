-- Ref: https://www.postgresqltutorial.com/postgresql-except/

-- Create Sample Tables
CREATE TABLE amazon
(
    category_name VARCHAR NOT NULL,
    product_name  VARCHAR NOT NULL
);

CREATE TABLE alibaba
(
    category_name VARCHAR NOT NULL,
    product_name  VARCHAR NOT NULL
);

-- Insert Sample Records
INSERT INTO amazon (category_name, product_name)
VALUES
    ('automotive', 'Tesla Model S'),
    ('computer', 'Macbook M1 Pro'),
    ('game', 'Xbox Series X'),
    ('book', 'Problem Solving'),
    ('security', 'Ucam');

INSERT INTO alibaba (category_name, product_name)
VALUES
    ('computer', 'Macbook M1 Pro'),
    ('security', 'Ucam'),
    ('automotive', 'Tesla Model S'),
    ('software', 'Matlab'),
    ('game', 'Playstation 5');

-- EXCEPT Example 1.
SELECT
    amazon.category_name AS category_name,
    amazon.product_name  AS product_name
FROM
    amazon
EXCEPT
SELECT
    alibaba.category_name AS category_name,
    alibaba.product_name  AS product_name
FROM
    alibaba
ORDER BY category_name, product_name;

-- EXCEPT Example 2.
SELECT
    alibaba.category_name AS category_name,
    alibaba.product_name  AS product_name
FROM
    alibaba
EXCEPT
SELECT
    amazon.category_name AS category_name,
    amazon.product_name  AS product_name
FROM
    amazon
ORDER BY category_name, product_name;

-- Drop Sample Tables
DROP TABLE amazon;
DROP TABLE alibaba;

