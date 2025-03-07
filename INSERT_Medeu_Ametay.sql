-- Choose one of your favorite films and add it to the "film" table. Fill in rental rates with 4.99 and rental durations with 2 weeks.

INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
VALUES ('Harry Potter', 
        'An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.', 
        2001, 1, 14, 4.99, 152, 19.99, 'PG');

-- Add the actors who play leading roles in your favorite film to the "actor" and "film_actor" tables (three or more actors in total).

INSERT INTO actor (first_name, last_name) VALUES
('Daniel', 'Radcliffe'),
('Emma', 'Watson'),
('Rupert', 'Grint'),
('Alan', 'Rickman'),
('Maggie', 'Smith');

WITH harry_potter_film AS (
    SELECT film_id FROM film WHERE title = 'Harry Potter'
)
INSERT INTO film_actor (actor_id, film_id)
SELECT a.actor_id, f.film_id
FROM actor a
CROSS JOIN harry_potter_film f
WHERE (a.first_name = 'Daniel' AND a.last_name = 'Radcliffe')
   OR (a.first_name = 'Emma' AND a.last_name = 'Watson')
   OR (a.first_name = 'Rupert' AND a.last_name = 'Grint')
   OR (a.first_name = 'Alan' AND a.last_name = 'Rickman')
   OR (a.first_name = 'Maggie' AND a.last_name = 'Smith');


-- Add your favorite movies to any store's inventory.

WITH harry_potter_film AS (
    SELECT film_id FROM film WHERE title = 'Harry Potter'
)
INSERT INTO inventory (film_id, store_id)
SELECT f.film_id, 1 FROM harry_potter_film f;



SELECT * FROM film WHERE title = 'Harry Potter';

SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Harry Potter';


SELECT * FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Harry Potter');

