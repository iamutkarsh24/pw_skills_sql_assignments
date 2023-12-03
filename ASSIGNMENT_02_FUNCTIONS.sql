USE mavenmovies;
-- Q1.Retrieve the total number of rentals made in the Sakila database.--
SELECT 
    COUNT(rental_id)
FROM
    film;

-- Q2.Find the average rental duration (in days) of movies rented from the Sakila database
SELECT 
    AVG(rental_duration) AS Days
FROM
    film;

-- Q3.Display the first name and last name of customers in uppercase. 
SELECT 
    UPPER(first_name) AS First_name,
    UPPER(last_name) AS Last_name
FROM
    customer;

-- Q4.Extract the month from the rental date and display it alongside the rental ID.
SELECT rental_id, Month(rental_date) AS Month FROM rental;

-- Q5.Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
SELECT 
    customer_id, COUNT(rental_id) AS Count_of_rental
FROM
    rental
GROUP BY customer_id;

-- Q6.Find the total revenue generated by each store
SELECT 
    store.store_id, SUM(amount) AS Total_Revenue
FROM
    store
        LEFT JOIN
    staff ON store.store_id = staff.staff_id
        LEFT JOIN
    payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id;
     
-- Q7.Display the title of the movie, customer s first name, and last name who rented it.
SELECT 
    f.title AS movie_title, c.first_name, c.last_name
FROM
    film f
        INNER JOIN
    inventory i ON f.film_id = i.film_id
        INNER JOIN
    rental R ON i.inventory_id = r.inventory_id
        INNER JOIN
    customer c ON c.customer_id = r.customer_id;

-- Q8.Retrieve the names of all actors who have appeared in the film "Gone with the Wind." 
SELECT 
    first_name, last_name, title
FROM
    film
        LEFT JOIN
    film_actor ON film_actor.film_id = film.film_id
        LEFT JOIN
    actor ON actor.actor_id = actor.actor_id
WHERE
    title = 'Gone with the Wind';

-- Q9.Determine the total number of rentals for each category of movies.
SELECT 
    category, COUNT(rental_id)
FROM
    rental
        INNER JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
        INNER JOIN
    film_category ON film_category.film_id = inventory.film_id;

-- Q10.Find the average rental rate of movies in each language.
SELECT 
    title, name, AVG(rental_rate) AS average
FROM
    film
        INNER JOIN
    language ON language.language_id = film.language_id
GROUP BY name , title;

-- Q11.Retrieve the customer names along with the total amount they've spent on rentals. 
SELECT 
    first_name, last_name, SUM(amount) AS Total
FROM
    customer
        INNER JOIN
    rental ON rental.customer_id = customer.customer_id
        INNER JOIN
    payment ON rental.rental_id = payment.rental_id
GROUP BY first_name , last_name;

-- Q12 List the titles of movies rented by each customer in a particular city (e.g., 'London').
SELECT 
    first_name, last_name, title
FROM
    film
        INNER JOIN
    inventory ON film.film_id = inventory.film_id
        INNER JOIN
    rental ON inventory.inventory_id = rental.inventory_id
        INNER JOIN
    customer ON inventory.store_id = customer.store_id
        INNER JOIN
    address ON customer.address_id = address.address_id
        INNER JOIN
    city ON city.city_id = city.city_id
WHERE
    city = 'London';

-- Q13.Display the top 5 rented movies along with the number of times they've been rented.
SELECT 
    title, COUNT(rental_rate) AS no_of_times_rented
FROM
    film
        INNER JOIN
    inventory ON film.film_id = inventory.film_id
        INNER JOIN
    rental ON rental.inventory_id = inventory.inventory_id
GROUP BY title
LIMIT 5;

-- Q14.Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
SELECT 
    *
FROM
    rental;
SELECT 
    first_name, last_name
FROM
    Customer
        INNER JOIN
    store ON customer.store_id = store.store_id
        INNER JOIN
    inventory ON store.store_id = inventory.store_id
GROUP BY first_name , last_name;