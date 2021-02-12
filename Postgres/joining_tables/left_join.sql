-- Ref: https://www.postgresqltutorial.com/postgresql-left-join/

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

-- LEFT JOIN ON
SELECT
    *
FROM
    amazon
LEFT JOIN alibaba -- LEFT OUTER JOIN alibaba
    ON amazon.category_name = alibaba.category_name;

-- LEFT OUTER JOIN USING
SELECT
    *
FROM
    amazon
LEFT OUTER JOIN alibaba USING(category_name);

-- Drop Tables
DROP TABLE amazon;
DROP TABLE alibaba;