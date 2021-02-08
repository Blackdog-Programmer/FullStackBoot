-- Ref: https://www.postgresqltutorial.com/postgresql-where/

-- = operators
SELECT
    CONCAT(cust.first_name, ' ', cust.last_name) AS full_name,
    CONCAT(addr.address, ' ', addr.district) AS full_address
FROM
    customer AS cust,
    address AS addr
WHERE
    cust.address_id = addr.address_id
;

-- AND operator
SELECT
    cust.customer_id,
    CONCAT(cust.first_name, ' ', cust.last_name) AS full_name,
    CONCAT(addr.address, ' ', addr.district) AS full_address
FROM
    customer AS cust,
    address AS addr
WHERE
    cust.address_id = addr.address_id AND
    lower(addr.district) like '%california%'
;

-- OR operator
SELECT
    cust.customer_id,
    CONCAT(cust.first_name, ' ', cust.last_name) AS full_name,
    CONCAT(addr.address, ' ', addr.district) AS full_address
FROM
    customer AS cust,
    address AS addr
WHERE
    cust.address_id = addr.address_id AND
    (lower(addr.district) = 'california' OR lower(addr.district) like 'texas')
;

-- IN operator
SELECT
    *
FROM
    film
WHERE
    rating IN ('G', 'PG-13')
;

-- LIKE Operator
SELECT
    description
FROM
    film
WHERE
    lower(description) LIKE '%pioneer%'
;

-- BETWEEN operator
SELECT
    *
FROM
    payment
WHERE
    amount BETWEEN 9.0 AND 11.0
;

-- <> operator
SELECT
    *
FROM
    category
WHERE
    lower(name) <> 'drama'
;