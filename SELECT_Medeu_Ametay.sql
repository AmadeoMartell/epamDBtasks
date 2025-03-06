-- TASK 1

WITH staff_revenue AS (
    SELECT st.store_id, 
           st.staff_id, 
           SUM(p.amount) AS total_revenue,
           RANK() OVER (PARTITION BY st.store_id ORDER BY SUM(p.amount) DESC) AS rank
    FROM staff st
    JOIN rental r ON st.staff_id = r.staff_id
    JOIN payment p ON r.rental_id = p.rental_id
    WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
    GROUP BY st.store_id, st.staff_id
)
SELECT store_id, staff_id, total_revenue
FROM staff_revenue
WHERE rank = 1;

-- TASK 2

SELECT f.film_id, 
       f.title, 
       COUNT(r.rental_id) AS rental_count, 
       CASE 
           WHEN f.rating IN ('G', 'PG') THEN 'Children/Family'
           WHEN f.rating IN ('PG-13') THEN 'Teenagers'
           WHEN f.rating IN ('R', 'NC-17') THEN 'Adults'
           ELSE 'Unknown'
       END AS expected_audience_age
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.rating
ORDER BY rental_count DESC
LIMIT 5;

-- TASK 3
SELECT a.actor_id, 
       a.first_name, 
       a.last_name, 
       MAX(f.release_year) AS last_film_year, 
       EXTRACT(YEAR FROM CURRENT_DATE) - MAX(f.release_year) AS years_since_last_movie
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY years_since_last_movie DESC
LIMIT 5;






