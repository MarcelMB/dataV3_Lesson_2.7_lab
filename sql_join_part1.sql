USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

-- SELECT * from film_category;
-- SELECT * from category;

SELECT count(fc.film_id), c.name
FROM film_category fc
JOIN category c
ON fc.category_id = c.category_id
GROUP BY fc.category_id;
 


-- Display the total amount rung up by each staff member in August of 2005

--  SELECT * from staff;
-- SELECT * from rental;

SELECT s.first_name, count(r.rental_ID)
FROM staff s
JOIN rental r
ON s.staff_id=r.staff_id
WHERE left(r.rental_date,7)='2005-08'
GROUP BY s.first_name;


-- Which actor has appeared in the most films?

-- SELECT * from actor;
-- SELECT * from film_actor;

SELECT count(fa.film_id) AS movie_counts, a.first_name, a.last_name, a.actor_id
FROM actor a
JOIN film_actor fa
USING(actor_id)
GROUP BY a.actor_id
ORDER BY movie_counts DESC;

-- Most active customer (the customer that has rented the most number of films)
-- combine customer and rental

SELECT count(c.customer_id) AS customer_counts, c.first_name, c.last_name, c.customer_id
FROM customer c
JOIN rental r
USING(customer_id)
GROUP BY c.customer_id
ORDER BY  customer_counts DESC;

-- Display the first and last names, as well as the address, of each staff member.
-- cominde staff and adress

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
USING(address_id);


-- List each film and the number of actors who are listed for that film.
-- combine film and film_actor

SELECT COUNT(fa.actor_id) AS number_actors, f.title, f.film_id
FROM film f
JOIN film_actor fa
USING(film_id)
GROUP BY f.film_id
ORDER BY number_actors DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- combine payment and customer

SELECT SUM(p.amount), c.last_name
FROM customer c
JOIN payment p
USING(customer_id)
GROUP BY customer_id  
ORDER BY c.last_name ASC;

-- List number of films per category
-- thats the same as first question