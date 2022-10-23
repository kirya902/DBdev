use sakila;
DESCRIBE actor;
SELECT last_name,first_name FROM actor;

SELECT actor_id,first_name,last_name
FROM actor
WHERE last_name = 'WILLIAMS'
Or last_name = 'DAVIS';

SELECT rental_id
FROM rental
WHERE date(rental_date)='2005-07-05';

SELECT c.email, r.return_date
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date)='2005-06-14'
ORDER BY return_date desc;