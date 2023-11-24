-- Source's link: https://byui-cse.github.io/cit111-ww-course/week05/assignment-joins-and-aggregates.html

-- Virtual Art Gallery Application Queries

-- Use v_art schema

USE v_art;

-- 1) When you visit the Virtual Art Gallery Database and you search by Period/Style and you choose Impressionism, you get two resulting images ("Woman in the Garden" and "Irises"). What query would be used in the code here to allow the user to see these images? No join is needed. 

SELECT artfile 
FROM artwork
WHERE period = "Impressionism";

-- 2) When you visit the Virtual Art Gallery Database and you search by Period/Style and you choose Impressionism, you get two resulting images ("Woman in the Garden" and "Irises"). What query would be used in the code here to allow the user to see these images? No join is needed. 

SELECT artfile 
FROM artwork_keyword
INNER JOIN keyword ON keyword.keyword_id = artwork_keyword.keyword_id
INNER JOIN artwork ON artwork.artwork_id = artwork_keyword.artwork_id
WHERE keyword LIKE '%flower%';

-- 3) List all the artists from the artist table, but only the related artwork from the artwork table. We need the first name, last name, and artwork title. 

SELECT fname, lname, title 
FROM artist 
INNER JOIN artwork ON artwork.artist_id = artist.artist_id;


-- Magazine Queries

-- Use magazine schema
use magazine;

-- 4) List all subscriptions with the magazine name, last name, first name, and sort alphabetically by magazine name. 

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine 
INNER JOIN subscription ON subscription.magazineKey = magazine.magazineKey
INNER JOIN subscriber ON subscription.subscriberKey = subscriber.subscriberKey
ORDER BY magazineName;

-- 5) List all the magazines that Samantha Sanders subscribes to. 

SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine 
INNER JOIN subscription ON subscription.magazineKey = magazine.magazineKey
INNER JOIN subscriber ON subscription.subscriberKey = subscriber.subscriberKey
WHERE subscriberFirstName = 'Samantha' and subscriberLastName = 'Sanders'
ORDER BY magazineName;

-- Employee Queries

-- Use employees schema
use employees;

-- 6) List the first five employees from the Customer Service Department. Put them in alphabetical order by last name.

SELECT first_name, last_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service'
ORDER BY last_name
LIMIT 5;

-- 7) Find out the current salary and department of Berni Genin. You can use the ORDER BY and LIMIT to get just the most recent salary.

SELECT first_name, last_name, dept_name, salary, salaries.from_date
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE first_name = 'Berni' and last_name = 'Genin'
ORDER BY salaries.to_date DESC
LIMIT 1;

-- Bike Shop Queries

-- Use bike schema
use bike;

-- 8) Get the average quantity that we have in all our bike stocks. Round to the nearest whole number. 

SELECT ROUND(AVG(quantity)) AS 'StockAverage'
FROM stock;

-- 9) Show each bike that needs to be reordered. Filter the results to only the lowest quantity of zero. Order by product_name The image below show the first 12 of 24 rows total. You don't need to use a LIMIT.  (Hint for this one: Two different stores have the same bike that needs to be reordered. You only need it to show up once.)

SELECT DISTINCT product.product_name
FROM stock
INNER JOIN product ON product.product_id = stock.product_id
WHERE stock.quantity = 0
ORDER BY product.product_name;

-- 10) How many of each category of bikes do we have in stock (inventory) at our "Baldwin Bikes" store, which has the store_id of 2. We need to see the name of the category as well as the number of bikes we have in inventory in the category. Sort by lowest inventory items first. 

SELECT category.category_name, COUNT(stock.product_id) AS instock
FROM stock
JOIN product ON stock.product_id = product.product_id
JOIN category ON product.category_id = category.category_id
WHERE stock.store_id = 2
GROUP BY category.category_name
ORDER BY instock;

-- Employee Queries

-- Use employees schema
use employees;

-- 11) How many employees do we have? (3 points)

SELECT COUNT(DISTINCT emp_no) AS NumberofEmployees
FROM employees;

-- 12) Get the average salaries in each department. We only need those departments that have average salaries that are below 60,000. Format the salary to 2 decimal places and a comma in the thousands place. 

SELECT dept_name, FORMAT(AVG(salary), 2) AS average_salary
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY departments.dept_no
HAVING AVG(salary) < 60000;

-- 13) Find out how many females work in each department. Sort by department name.
