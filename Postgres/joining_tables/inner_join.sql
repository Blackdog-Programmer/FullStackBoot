-- Ref: https://www.postgresqltutorial.com/postgresql-inner-join/

-- Typical INNER JOIN syntax
SELECT
    customer.customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    rental_date,
    return_date
FROM
    customer
INNER JOIN rental
    ON customer.customer_id = rental.customer_id
FETCH FIRST 10 ROW ONLY
;

-- Using Keyword
SELECT
    customer.customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    rental_date,
    return_date
FROM
    customer
INNER JOIN rental USING(customer_id)
FETCH FIRST 10 ROW ONLY
;

-- Joining multiple tables
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS customer_email,
    p.amount,
    p.payment_date,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    s.email AS staff_email,
    s.username AS staff_username
FROM
    customer AS c
INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
INNER JOIN staff AS s
    ON p.staff_id = s.staff_id
FETCH FIRST 100 ROWS ONLY
;