-- Ref: https://www.postgresqltutorial.com/postgresql-union/

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


-- UNION: Only Unique Rows
SELECT
    amazon.category_name AS category_name,
    amazon.product_name  AS product_name
FROM
    amazon
UNION
SELECT
    alibaba.category_name AS category_name,
    alibaba.product_name  AS product_name
FROM
    alibaba
ORDER BY
    category_name, product_name;


-- UNION ALL: Allow Duplicated Records
SELECT
    amazon.category_name AS category_name,
    amazon.product_name  AS product_name
FROM
    amazon
UNION ALL
SELECT
    alibaba.category_name AS category_name,
    alibaba.product_name  AS product_name
FROM
    alibaba
ORDER BY
    category_name, product_name;

-- Drop Tables
DROP TABLE amazon;
DROP TABLE alibaba;
