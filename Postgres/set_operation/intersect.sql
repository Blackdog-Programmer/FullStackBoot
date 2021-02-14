-- Ref: https://www.postgresqltutorial.com/postgresql-union/

-- Create Sample Tables
CREATE TABLE amazon
(
    category_name VARCHAR NOT NULL
);

CREATE TABLE alibaba
(
    category_name VARCHAR NOT NULL
);

-- Insert Sample Records
INSERT INTO amazon (category_name)
VALUES
    ('automotive'),
    ('computer'),
    ('game'),
    ('book'),
    ('fashion');

INSERT INTO alibaba (category_name)
VALUES
    ('computer'),
    ('fashion'),
    ('automotive'),
    ('music'),
    ('pet');


-- UNION: Only Unique Rows
SELECT
    amazon.category_name AS category_name
FROM
    amazon
UNION
SELECT
    alibaba.category_name AS category_name
FROM
    alibaba;

-- UNION ALL: Allow Duplicated Rows
SELECT
    amazon.category_name AS category_name
FROM
    amazon
UNION ALL
SELECT
    alibaba.category_name AS category_name
FROM
    alibaba;

-- Drop Tables
DROP TABLE amazon;
DROP TABLE alibaba;
