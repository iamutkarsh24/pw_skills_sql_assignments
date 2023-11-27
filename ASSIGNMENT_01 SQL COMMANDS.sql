USE mavenmovies;
-- Q1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences--
DESCRIBE actor;

-- Q2.List all details of actors --
SELECT * FROM actor;

-- Q3.List all customer information from DB -- 
SELECT * FROM customer;

-- Q4.List different countries --
SELECT country FROM country;

-- Q5.Display all active customers --
SELECT CONCAT(first_name,' ',last_name)AS full_name, Active FROM customer
WHERE active =1;

-- Q6.List of all rental IDs for customer with ID 1
SELECT rental_id from rental
WHERE customer_id = 1;

-- Q7.Display all the films whose rental duration is greater than 5 --
SELECT title,rental_duration FROM film
WHERE rental_duration > 5;

-- Q8.List the total number of films whose replacement cost is greater than $15 and less than $20 
SELECT title, replacement_cost FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

-- Q9.Find the number of films whose rental rate is less than $1 --
SELECT COUNT(title) FROM film
WHERE rental_rate <1;

-- Q10. Display the count of unique first names of actors. 
SELECT COUNT(DISTINCT(first_name)) FROM actor;

-- Q11. Display the first 10 records from the customer table.
SELECT * FROM customer 
LIMIT 10;

-- Q12. Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;

-- Q13. Display the names of the first 5 movies which are rated as ‘G’ --
SELECT title FROM film
WHERE rating = 'G'
LIMIT 5;

-- Q14.Find all customers whose first name starts with "a" --
SELECT first_name FROM customer
WHERE first_name LIKE 'a%';

-- Q15. Find all customers whose first name ends with "a" --
SELECT first_name FROM customer
WHERE first_name LIKE'%a';

-- Q16. Display the list of first 4 cities which start and end with ‘a’ --
SELECT city FROM city 
WHERE city LIKE 'a%a'
LIMIT 4;

-- Q17. Find all customers whose first name have "NI" in any position --
SELECT first_name FROM customer
WHERE first_name LIKE '%ni%';

-- Q18.Find all customers whose first name have "r" in the second position--
SELECT first_name FROM customer
WHERE first_name LIKE '_r%';

-- Q19.Find all customers whose first name starts with "a" and are at least 5 characters in length--
SELECT first_name FROM customer
WHERE first_name LIKE 'a____%';

-- Q20.Find all customers whose first name starts with "a" and ends with "o" --
SELECT first_name FROM customer
WHERE first_name LIKE 'a%o';

-- Q21.Get the films with pg and pg-13 rating using IN operator --
SELECT title,rating FROM film
WHERE rating IN('PG','PG-13');

-- Q22.Get the films with length between 50 to 100 using between operator --
SELECT title,length FROM film 
WHERE length BETWEEN 50 AND 100;

-- Q23.Get the top 50 actors using limit operator --
SELECT first_name,last_name FROM actor
LIMIT 50;

-- Q24.Get the distinct film ids from inventory table. 
SELECT distinct(film_id) FROM inventory;