#SQL ASSIGNMENT
#Name: Wahidur Rahaman  gmail: wahidurrahaman11301@gmail.com  #course name: Data analytics 




#1. Create a table called employees with the following structure?
# emp_id (integer, should not be NULL and should be a primary key)Q
# emp_name (text, should not be NULL)Q
# age (integer, should have a check constraint to ensure the age is at least 18)Q
# email (text, should be unique for each employee)Q
# salary (decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraint.

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,               -- emp_id as PRIMARY KEY and NOT NULL
    emp_name TEXT NOT NULL,                        -- emp_name as NOT NULL
    age INT CHECK (age >= 18),                     -- age with CHECK constraint (age >= 18)
    email VARCHAR(255) UNIQUE,                     -- email should be unique with VARCHAR type
    salary DECIMAL DEFAULT 30000                   -- salary with a default value of 30,000
);


#2  2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.

#Ans:
#Purpose of Constraints :
#Constraints ensure **data integrity** by enforcing rules to maintain accuracy, consistency, and validity in a database.


#Common Types of Constraints :

#1. **NOT NULL**  
  # - Ensures a column cannot contain `NULL`.  
 #  - Example: `name TEXT NOT NULL`.

#2. **UNIQUE**  
   #- Ensures all values in a column are distinct.  
   #- Example: `email TEXT UNIQUE`.

#3. **PRIMARY KEY**  
   #- Combines `NOT NULL` and `UNIQUE` to uniquely identify each row.  
   #- Example: `emp_id INTEGER PRIMARY KEY`.

#4.**FOREIGN KEY**  
   #- Links columns to a primary key in another table to enforce relationships.  
   #- Example: `FOREIGN KEY (customer_id) REFERENCES customers(customer_id)`.

#5. **CHECK**  
   #- Ensures a column meets a condition.  
   #- Example: `age INTEGER CHECK (age >= 18)`.
#6. **DEFAULT**  
   #- Assigns a default value if none is provided.  
   #- Example: `salary DECIMAL DEFAULT 30000`.
#Benefits : 
#- Prevents invalid data.  
#- Maintains relationships between tables.  
#- Reduces errors and enforces business rules. 


#3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values?Justify your answer.
#Ans: Why Apply NOT NULL:
#To ensure a column always has a value, preventing missing or incomplete data.
 #Example: A username field must not be empty.

#Can a Primary Key Contain NULL Values?
#No, it cannot.


#4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.

#Ans: To add or remove constraints on an existing table, you can use the following SQL commands:
#1. Adding a Constraint
#To add a constraint, you use the ALTER TABLE statement with the ADD CONSTRAINT clause. Here's the syntax:
#ALTER TABLE table_name
#ADD CONSTRAINT constraint_name constraint_type (column_name);

#Example: Adding a NOT NULL constraint on the email column:
#ALTER TABLE employees
#ADD CONSTRAINT email_not_null CHECK (email IS NOT NULL);

#2. Removing a Constraint
#To remove a constraint, you use the ALTER TABLE statement with the DROP CONSTRAINT clause. Here's the syntax:
#ALTER TABLE table_name
#DROP CONSTRAINT constraint_name;

#Example: Removing the email_not_null constraint:
#ALTER TABLE employees
#EDROP CONSTRAINT email_not_null;

#Uniqueness: A primary key uniquely identifies each row, and NULL is not a value.
#Implicit NOT NULL: Primary keys automatically enforce the NOT NULL constraint.
#Conclusion: Primary keys require valid, non-null values for data integrity.


#5.Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.

#Ans:
#When you violate a constraint during an insert, update, or delete, the database rejects the operation and shows an error message.
#Consequences:
#Insert: Fails if a value violates a NOT NULL, UNIQUE, or FOREIGN KEY constraint.
#Update: Fails if a change violates constraints like PRIMARY KEY or FOREIGN KEY.
#Delete: Fails if you try to delete a record referenced by another table (with a FOREIGN KEY).
#Example Error:
#Inserting an order with a non-existing customer:
#INSERT INTO orders (order_id, order_date, customer_id) VALUES (1, '2025-01-27', 999);

#Error message:
#ERROR:  insert or update on table "orders" violates foreign key constraint "orders_customer_id_fkey"
#DETAIL:  Key (customer_id)=(999) is not present in table "customers".

#6. You created a products table without constraints as follows: CREATE TABLE products (     product_id INT,     product_name VARCHAR(50),     price DECIMAL(10, 2));

#Ans:
#To modify the products table to meet the new requirements (making product_id a PRIMARY KEY and setting a default value for price), you can use the ALTER TABLE command.
#1. Make product_id a Primary Key:
#Since product_id should uniquely identify each product, we can add a PRIMARY KEY constraint to the product_id column.
#2. Set a Default Value for price:
#To set a default value of 50.00 for the price column, we can use the DEFAULT constraint.
#SQL Commands:
#-- Add a PRIMARY KEY constraint to product_id
#ALTER TABLE products
#ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- Set a default value of 50.00 for price
#ALTER TABLE products
#ALTER COLUMN price SET DEFAULT 50.00;


#7. You have two tables:
   
   #Students:
#student_id            student_name       class_id
#1                           Alice                       101
#2                           Bob                         102
#3                           Charlie                    101

 #Classes:
#class_id             class_name
#101                       Math
#102                       Science 
#103                       History
#Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

#Ans: To fetch the student_name and class_name for each student by using an INNER JOIN, you need to join the Students and Classes tables on the class_id field. Here’s the SQL query to achieve that:

#SELECT s.student_name, c.class_name
#FROM Students s
#INNER JOIN Classes c
#ON s.class_id = c.class_id;

#8. Consider the following three tables:
#Orders:
#orders      order_date         customer_id
#1             2024-01-01          101
#2             2024-01-03          102

#Customers:
#customer_id      customer_name  
#101                     Alice 
#102                     Bob

#product_id      product_name        order_id
#1                     Laptop                     1
#2                     Phone                      NULL

#Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order  Hint: (use INNER JOIN and LEFT JOIN)


#Ans: Ans: To fetch all order_id, customer_name, and product_name, ensuring all products are listed (even without an order), use the following query with INNER JOIN and LEFT JOIN:
#SELECT o.order_id, c.customer_name, p.product_name
#FROM Orders o
#INNER JOIN Customers c ON o.customer_id = c.customer_id
#LEFT JOIN Products p ON o.order_id = p.order_id;


#9. Given the following tables:
 #Sales: 
#sale_id      product_id          amount
#1                     101                 500
#2                     102                300
#3                     101                700

#product_id       product_name
# 101                  Laptop
#102                 Phone
#Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

 #Ans: To find the total sales amount for each product, you can use an INNER JOIN to combine the Sales and Products tables and then use the SUM() function to calculate the total sales amount for each product.
#SQL Query:
#SELECT p.product_name, SUM(s.amount) AS total_sales
#FROM Sales s
#INNER JOIN Products p ON s.product_id = p.product_id
#GROUP BY p.product_name;

#example Result:
#product_name | total_sales
#---------------------------
#Laptop       | 1200
#Phone        | 300
#The total sales for Laptop is 500 + 700 = 1200.
#The total sales for Phone is 300.


#10. You are given three tables:
#Orders:
#order_id            order_date       customer_id
#1                          2024-01-02              1
#2                          2024-01-05              2

 #Customers:
#customer_id             customer_name
#1                                 Alice
#2                                 Bob 
#Order_Details:
#order_id            product_id        quantity
#1                             101                  2
#2                             102                  1
#3                             101                  3
#Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables. Note - The above-mentioned questions don't require any dataset.

#Ans: To display the order_id, customer_name, and the quantity of products ordered, use this INNER JOIN query:
#SELECT o.order_id, c.customer_name, od.quantity
#FROM Orders o
#INNER JOIN Customers c ON o.customer_id = c.customer_id
#INNER JOIN Order_Details od ON o.order_id = od.order_id;




#sql commands

##Q1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

SELECT 
    table_name, 
    column_name 
FROM information_schema.key_column_usage 
WHERE constraint_name = 'PRIMARY' 
AND table_schema = 'mavenmovies';

##Q2- List all details of actors

SELECT * FROM actor;

##Q3 -List all customer information from DB.
SELECT * FROM customer;

##Q4 -List different countries.
SELECT DISTINCT country FROM country;

##Q5 -Display all active customers.
SELECT * FROM customer WHERE active = 1;

##Q6 -List of all rental IDs for customer with ID 1.
SELECT rental_id
FROM rental
WHERE customer_id = 1;

##Q7 - Display all the films whose rental duration is greater than 5 .
SELECT *
FROM film
WHERE rental_duration > 5;

##Q8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

###9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

###10- Display the first 10 records from the customer table.
SELECT *
FROM customer
LIMIT 10;

## 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT *
FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;

##12 -Display the names of the first 5 movies which are rated as ‘G’.

SELECT title
FROM film
WHERE rating = 'G'
LIMIT 5;

##13-Find all customers whose first name starts with "a".

SELECT *
FROM customer
WHERE first_name LIKE 'A%';

##14- Find all customers whose first name ends with "a".

SELECT *
FROM customer
WHERE first_name LIKE '%a';

###15- Display the list of first 4 cities which start and end with ‘a’ .
SELECT *
FROM city
WHERE city LIKE 'A%A'
LIMIT 4;

##16- Find all customers whose first name have "NI" in any position.

SELECT *
FROM customer
WHERE first_name LIKE '%NI%';

##17- Find all customers whose first name have "r" in the second position .
SELECT *
FROM customer
WHERE first_name LIKE '_r%';

##18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

SELECT *
FROM customer
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

##19- Find all customers whose first name starts with "a" and ends with "o".
SELECT *
FROM customer
WHERE first_name LIKE 'a%o';

##20 - Get the films with pg and pg-13 rating using IN operator.
SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');

##21 - Get the films with length between 50 to 100 using between operator.
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;

##22 - Get the top 50 actors using limit operator.
SELECT *
FROM actor
LIMIT 50;

##23 - Get the distinct film ids from inventory table.
SELECT DISTINCT film_id
FROM inventory;

#####Functions

##Basic Aggregate Functions:

##Question 1:
##Retrieve the total number of rentals made in the Sakila database.
##Hint: Use the COUNT() function.

use sakila;
SELECT COUNT(*) AS total_rentals
FROM rental;

###Question 2:
##Find the average rental duration (in days) of movies rented from the Sakila database.
##Hint: Utilize the AVG() function

SELECT AVG(rental_duration) AS average_rental_duration
FROM film;

###String Functions:
#Question 3:
#Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER () function.

SELECT UPPER(first_name) AS uppercase_first_name, 
       UPPER(last_name) AS uppercase_last_name
FROM customer;

##Question 4:
##Extract the month from the rental date and display it alongside the rental ID.
##Hint: Employ the MONTH() function.

SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

##GROUP BY:Question 5:
##Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
##Hint: Use COUNT () in conjunction with GROUP BY.
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

##Question 6:
##Find the total revenue generated by each store.
##Hint: Combine SUM() and GROUP BY.

#ans:
SELECT s.store_id, 
       SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;




###Question 7:
#Determine the total number of rentals for each category of movies.
#Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY

SELECT fc.category_id, 
       c.name AS category_name, 
       COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY fc.category_id, c.name;


#Question 8:
#Find the average rental rate of movies in each language.
#Hint: JOIN film and language tables, then use AVG () and GROUP BY.

SELECT l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.language_id;

###JOINS

#Questions 9 -
#Display the title of the movie, customer s first name, and last name who rented it.
#Hint: Use JOIN between the film, inventory, rental, and customer tables.

SELECT f.title, c.first_name, c.last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;

#Question 10:
#Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
#Hint: Use JOIN between the film actor, film, and actor tables.

use sakila;
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title LIKE '%Gone with the Wind%';

##Question 11:
#Retrieve the customer names along with the total amount they've spent on rentals.
#Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id;


##Question 12:
#List the titles of movies rented by each customer in a particular city (e.g., 'London').
#Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

SELECT c.first_name, c.last_name, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.first_name, c.last_name, f.title;

##Advanced Joins and GROUP BY:

#Question 13:
#Display the top 5 rented movies along with the number of times they've been rented.
#Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.

SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

#Question 14:
#Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
#Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

SELECT c.first_name, c.last_name, c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

#Windows Function:
#1. Rank the customers based on the total amount they've spent on rentals.

SELECT 
    c.first_name, 
    c.last_name, 
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS customer_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY customer_rank;


#2. Calculate the cumulative revenue generated by each film over time.
SELECT 
    f.title, 
    r.rental_date, 
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.film_id, r.rental_date;

#3. Determine the average rental duration for each film, considering films with similar lengths.
SELECT 
    f.title, 
    f.length, 
    AVG(f.rental_duration) AS avg_rental_duration
FROM film f
JOIN rental r ON f.film_id = r.inventory_id
GROUP BY f.length, f.title
ORDER BY f.length;

#4. Identify the top 3 films in each category based on their rental counts.
WITH RankedFilms AS (
    SELECT 
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS film_rank
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, f.film_id
)
SELECT category_name, title, rental_count
FROM RankedFilms
WHERE film_rank <= 3
ORDER BY category_name, film_rank;

#5.Calculate the difference in rental counts between each customer's total rentals and the average rentals
#across all customers.

SELECT 
    c.first_name, 
    c.last_name, 
    total_rentals,
    avg_rentals,
    total_rentals - avg_rentals AS rental_difference
FROM (
    SELECT 
        r.customer_id, 
        COUNT(r.rental_id) AS total_rentals
    FROM rental r
    GROUP BY r.customer_id
) AS customer_rentals
JOIN customer c ON customer_rentals.customer_id = c.customer_id
JOIN (
    SELECT 
        AVG(total_rentals) AS avg_rentals
    FROM (
        SELECT COUNT(rental_id) AS total_rentals
        FROM rental
        GROUP BY customer_id
    ) AS all_customer_rentals
) AS avg_rentals_data ON 1=1
ORDER BY rental_difference DESC;


#6. Find the monthly revenue trend for the entire rental store over time.

SELECT 
    YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY rental_year, rental_month
ORDER BY rental_year, rental_month;






##7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH CustomerSpending AS (
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
),
RankedCustomers AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        total_spent,
        NTILE(5) OVER (ORDER BY total_spent DESC) AS spending_rank
    FROM CustomerSpending
)
SELECT customer_id, first_name, last_name, total_spent
FROM RankedCustomers
WHERE spending_rank = 1
ORDER BY total_spent DESC;


##8. Calculate the running total of rentals per category, ordered by rental count.

WITH CategoryRentalCount AS (
    SELECT 
        c.category_id,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name
)
SELECT 
    category_name,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM CategoryRentalCount
ORDER BY rental_count DESC;

#9. Find the films that have been rented less than the average rental count for their respective categories.

WITH CategoryRentalCounts AS (
    SELECT 
        c.category_id,
        c.name AS category_name,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, f.film_id
),
CategoryAverageRentalCounts AS (
    SELECT 
        category_id,
        AVG(rental_count) AS avg_rental_count
    FROM CategoryRentalCounts
    GROUP BY category_id
)
SELECT 
    crc.category_name,
    crc.title,
    crc.rental_count,
    cac.avg_rental_count
FROM CategoryRentalCounts crc
JOIN CategoryAverageRentalCounts cac 
    ON crc.category_id = cac.category_id
WHERE crc.rental_count < cac.avg_rental_count
ORDER BY crc.category_name, crc.rental_count;


#10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
    YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY rental_year, rental_month
ORDER BY monthly_revenue DESC
LIMIT 5;

#####Normalisation & CTE

### 1. First Normal Form (1NF):#a.Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
#A **CTE** is a temporary result set that you can use within a query to simplify complex operations.

#Ans:SQL Queries to Achieve 1NF

CREATE TABLE film_special_features (
    film_id SMALLINT UNSIGNED NOT NULL,
    special_feature VARCHAR(255) NOT NULL,
    PRIMARY KEY (film_id, special_feature),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);
#Insert data into the new table by splitting the special_features values:
INSERT INTO film_special_features (film_id, special_feature)
SELECT film_id, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(special_features, ',', n), ',', -1)) AS special_feature
FROM film
JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7) numbers
WHERE CHAR_LENGTH(special_features) - CHAR_LENGTH(REPLACE(special_features, ',', '')) >= n - 1;

#Remove the special_features column from the film table
ALTER TABLE film DROP COLUMN special_features;

#Result:
#The film_special_features table now stores each feature for each film in separate rows, 
#ensuring that each row has atomic values and satisfying 1NF.



##2. Second Normal Form (2NF):a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
#If it violates 2NF, explain the steps to normalize it.


#ans: SQL Queries to Normalize film_category to 2NF:
CREATE TABLE film_last_update (
    film_id SMALLINT UNSIGNED NOT NULL,
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (film_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

#Move the last_update data to the new table:

INSERT INTO film_last_update (film_id, last_update)
SELECT DISTINCT film_id, last_update
FROM film_category;

#Remove last_update from the film_category table:
ALTER TABLE film_category DROP COLUMN last_update;

#Result:
#Now, the film_category table contains only the composite primary key (film_id, category_id) and does not have the partial dependency on last_update. The film_last_update table stores the last_update information for each film.
#The table is in 1NF.
#There are no partial dependencies.
#The table satisfies 2NF.


##3. Third Normal Form (3NF):a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
#present and outline the steps to normalize the table to 3NF.

#Ans: SQL Queries to Normalize address to 3NF:
CREATE TABLE city_country (
    city_id SMALLINT UNSIGNED NOT NULL,
    country_id SMALLINT UNSIGNED NOT NULL,  -- Adjust to match country table
    PRIMARY KEY (city_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

#adding 
ALTER TABLE address ADD COLUMN country_id SMALLINT UNSIGNED;
#update 
UPDATE address a
JOIN city_country c ON a.city_id = c.city_id
SET a.country_id = c.country_id;

#remove
ALTER TABLE address DROP FOREIGN KEY fk_address_city;
ALTER TABLE address DROP COLUMN city_id;

ALTER TABLE address ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES country(country_id);

#These queries normalize the address table to 3NF by eliminating the transitive dependency




#4. Normalization Process:
#a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF

# Unnormalized Form (UNF)
-- Original (unnormalized) `film_actor` table
CREATE TABLE film_actor_unf (
    actor_id SMALLINT UNSIGNED,
    film_id SMALLINT UNSIGNED,
    actor_name VARCHAR(100),
    film_title VARCHAR(100),
    last_update TIMESTAMP
);

#Convert to 1NF
-- Table already in 1NF as it has atomic columns
CREATE TABLE film_actor_1nf (
    actor_id SMALLINT UNSIGNED,
    film_id SMALLINT UNSIGNED,
    last_update TIMESTAMP,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

#Convert to 2NF

-- Create the `film_actor` table in 2NF
CREATE TABLE film_actor_2nf (
    actor_id SMALLINT UNSIGNED,
    film_id SMALLINT UNSIGNED,
    last_update TIMESTAMP,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);


#5.CTE Basics:
 #a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
 #have acted in from the actor and film_actor tables
 
 WITH ActorFilmCount AS (
    SELECT
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)
SELECT
    first_name,
    last_name,
    film_count
FROM ActorFilmCount;

#6. CTE with Joins:a. Create a CTE that combines information from the film and language tables to display the film title, 
#language name, and rental rate.

WITH FilmLanguageInfo AS (
    SELECT
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT
    film_title,
    language_name,
    rental_rate
FROM FilmLanguageInfo;

#7. CTE for Aggregation:a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
#from the customer and payment tables.

WITH CustomerRevenue AS (
    SELECT
        p.customer_id,
        SUM(p.amount) AS total_revenue
    FROM payment p
    GROUP BY p.customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.total_revenue
FROM CustomerRevenue cr
JOIN customer c ON cr.customer_id = c.customer_id;


#8.CTE with Window Functions:
#a. Utilize a CTE with a window function to rank films based on their rental duration from the film table

WITH FilmRentalRank AS (
    SELECT
        f.film_id,
        f.title AS film_title,
        f.rental_duration,
        RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_rank
    FROM film f
)
SELECT
    film_id,
    film_title,
    rental_duration,
    rental_rank
FROM FilmRentalRank;

#9.CTE and Filtering:
 #a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
#customer table to retrieve additional customer details.

WITH CustomerRentalCount AS (
    SELECT
        p.customer_id,
        COUNT(p.rental_id) AS rental_count
    FROM payment p
    GROUP BY p.customer_id
    HAVING COUNT(p.rental_id) > 2
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.address_id,
    crc.rental_count
FROM CustomerRentalCount crc
JOIN customer c ON crc.customer_id = c.customer_id;

#10. CTE for Date Calculations:
#a. Write a query using a CTE to find the total number of rentals made each month, considering the 
#rental_date from the rental table

WITH MonthlyRentalCount AS (
    SELECT
        YEAR(r.rental_date) AS rental_year,
        MONTH(r.rental_date) AS rental_month,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
)
SELECT
    rental_year,
    rental_month,
    rental_count
FROM MonthlyRentalCount
ORDER BY rental_year, rental_month;

##11.CTE and Self-Join:
#a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
#together, using the film_actor table

WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id  -- Ensures each pair is unique (avoids duplicates)
)
SELECT
    ap.actor1_id,
    ap.actor2_id,
    f.title AS film_title
FROM ActorPairs ap
JOIN film f ON ap.film_id = f.film_id
ORDER BY ap.actor1_id, ap.actor2_id;

#12. CTE for Recursive Search:
#a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
#considering the reports_to column

ALTER TABLE staff ADD COLUMN reports_to TINYINT UNSIGNED;

WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: Select the direct reports of a specific manager (e.g., manager_id = 1)
    SELECT 
        staff_id, 
        first_name, 
        last_name, 
        reports_to
    FROM staff
    WHERE reports_to = 1  -- Replace '1' with the ID of the manager you're interested in

    UNION ALL

    -- Recursive case: Select employees who report to the employees in the previous step
    SELECT 
        s.staff_id, 
        s.first_name, 
        s.last_name, 
        s.reports_to
    FROM staff s
    INNER JOIN EmployeeHierarchy eh ON s.reports_to = eh.staff_id
)
-- Final select to show the employees in the hierarchy
SELECT staff_id, first_name, last_name
FROM EmployeeHierarchy;

