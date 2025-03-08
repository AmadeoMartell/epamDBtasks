-- Alter the rental duration and rental rates of the film you inserted before to three weeks and 9.99, respectively.
UPDATE film
SET rental_duration = 21, rental_rate = 9.99
WHERE title = 'Harry Potter';

SELECT * FROM film WHERE title = 'Harry Potter';

-- Alter any existing customer in the database with at least 10 rental and 10 payment records.
-- Change their personal data to yours (first name, last name, address, etc.).
-- You can use any existing address from the "address" table. Please do not perform any updates on the "address" table,
-- as this can impact multiple records with the same address.
-- +
-- Change the customer's create_date value to current_date.

SELECT c.customer_id, c.first_name, c.last_name, c.address_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.address_id
HAVING COUNT(DISTINCT r.rental_id) >= 10 AND COUNT(DISTINCT p.payment_id) >= 10
LIMIT 1;

UPDATE customer
SET first_name = 'Medeu', 
    last_name = 'Ametay',
    create_date = CURRENT_DATE
WHERE customer_id = 1;
