-- Ref LIMIT: https://www.postgresqltutorial.com/postgresql-limit/
--     FETCH: https://www.postgresqltutorial.com/postgresql-fetch/

-- LIMIT
SELECT *
FROM category
ORDER BY category_id
LIMIT 10
;

-- LIMIT with NULL value has no effect
SELECT *
FROM category
ORDER BY category_id
LIMIT NULL -- meaningless expression
;

-- OFFSET
SELECT *
FROM category
ORDER BY category_id
OFFSET 2 -- Skip first 2 records
;

-- LIMIT with OFFSET
SELECT *
FROM category
ORDER BY category_id
LIMIT 10 OFFSET 2
;

-- FETCH 1 record
SELECT *
FROM category
ORDER BY category_id
FETCH FIRST ROWS ONLY -- equivalent 'LIMIT 1'
;

-- FETCH 10 records
SELECT *
FROM category
ORDER BY category_id
FETCH FIRST 10 ROWS ONLY -- equivalent 'LIMIT 10'
;

-- FETCH 10 records with skipping first 5 records
SELECT *
FROM category
ORDER BY category_id
OFFSET 5 ROWS
FETCH FIRST 10 ROWS ONLY -- equivalent 'LIMIT 10 OFFSET 5'
;