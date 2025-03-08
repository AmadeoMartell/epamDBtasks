-- Remove a previously inserted film from the inventory and all corresponding rental records

SELECT film_id FROM film WHERE title = 'Harry Potter';

DELETE FROM rental
WHERE inventory_id IN (
    SELECT inventory_id FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Harry Potter')
);

DELETE FROM inventory 
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Harry Potter');

DELETE FROM film_actor WHERE film_id = (SELECT film_id FROM film WHERE title = 'Harry Potter');

DELETE FROM film WHERE film_id = (SELECT film_id FROM film WHERE title = 'Harry Potter');


-- Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"

SELECT customer_id FROM customer WHERE first_name = 'Medeu' AND last_name = 'Ametay';

DELETE FROM payment WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name = 'Medeu' AND last_name = 'Ametay');

DELETE FROM rental WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name = 'Medeu' AND last_name = 'Ametay');



