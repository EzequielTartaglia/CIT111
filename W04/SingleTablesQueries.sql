-- Source's link: https://byui-cse.github.io/cit111-ww-course/week04/assignment-single-table-queries.html

-- Virtual Art Gallery Application Queries

-- Use v_art schema
use v_art;

-- 1) The manager wants to add the artist Johannes Vermeer as an artist in the database. He was born in 1632 and is from the Netherlands and died in 1674. He is not a local artist. What would the insert statement look like that would run as the manager adds a new artist to the system? (The following image is a screenshot of the backend of the system that the manager of the art gallery would see. We are interested only in the SQL statement that would run in the code when a new artist is added.)

INSERT INTO artist (fname, mname, lname, dob, dod, country, local)
VALUES ('Johannes', '', 'Vermeer', 1632, 1674, 'Netherlands ', 'n');

-- 2) If the manager lists all the artists with 'List all Artist Records' the following screen renders sorted by the last name of the artist. What query would allow all seven columns of values to show up on the screen alphabetically by the last name? 

SELECT * 
FROM artist 
ORDER BY lname;

-- 3) The manager wants to edit Vermeer's information. She finds out that he died in 1675, not 1674. She selects EDIT next to Johannes Vermeer the following screen displays. The manager changes the 'Date of Death' value to be 1675 and selects 'Update Entry'. What SQL statement will run in the background to accomplish this edit? (Don't forget a WHERE clause!)

UPDATE artist
SET dod = 1675
WHERE fname = 'Johannes' AND lname = 'Vermeer';

-- 4) The manager decides that she wants to delete Vermeer as an artist from her database. She selects the DELETE next to the Vermeer's row of information and the following screen renders confirming that she really wants to delete Vermeer as an artist. What SQL statement will run in the code that would delete Johannes Vermeer from the database when the manager selects 'Confirm Deletion'? (Don't forget a WHERE clause!)

DELETE FROM artist
WHERE fname = 'Johannes' AND lname = 'Vermeer';

-- Bike Shop Queries

-- Use bike schema
use bike;

-- 5) There is a product demonstration and bike race planned in Houston, Texas and you'd like to text each of your customers from that city to see if they will participate. You need a list of their first and last names and phone numbers.

SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Houston' and state = 'TX';

-- 6) You need to sell more of your high-end bikes. You want to take $500 off all bikes that have a list price of $5,000.00 or more. You need to have a list showing the bike name, list price and discount price with an alias of 'Discount Price'. Sort the list showing the most expensive bike first.

SELECT product_name, list_price, (list_price - 500)
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- 7) An important announcement was given to all the staff at your store (store_id 1). The same announcement needs to get to all the other staff at the other stores. You don't want to email all your staff again. You need a list of all the staff and their email who are not from your store.

SELECT first_name, last_name, email
FROM staff
WHERE store_id <> 1;

-- 8) A customer needs more information about a specific bike, but all they know is that is has the word 'spider' in the name. You need to list the name, model year, and list price of all the bikes with the word 'spider' somewhere in the name. 

SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%spider%';

-- 9) You need to list all bikes names that have a range of prices from $500–$550 sorted with the lowest price first.

SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- 10) Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
    -- have a phone number listed
    -- and whose city has the letters 'ach' or 'och' somewhere in their name of the city
    -- or whose last name is William. 
    -- Limit the result set to the first five results.

SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL
    AND (city LIKE '%ach%' OR city LIKE '%och%' OR last_name = 'William')
LIMIT 5;

-- 11) We need a list of all the products without the year at the end of the product_name string. Notice that some have two years listed, make sure you take those off as well. Order your results by product_id and limit your results to the first 14.

SELECT REGEXP_REPLACE(product_name, CONCAT('- ', model_year), '') AS 'Product Name Without Year'
FROM product
ORDER BY product_id
LIMIT 14;

'
-- 12) List the product name and then take the 2019 model year bikes and divide the price into 3 equal payments. Display one of the payments with a dollar sign, comma at the thousands place and two decimal places.

SELECT 
  product_name,
  CONCAT('$', FORMAT(list_price / 3, 2)) AS 'One-Third Payment'
FROM 
  product
WHERE 
  model_year = 2019;

'
-- Magazine Queries

-- Use magazine schema
use magazine;

-- 13) List the magazine name and then take 3% off the magazine price and round to 2 decimal places. 

SELECT 
  magazineName,
  ROUND(magazinePrice - (magazinePrice * 0.03), 2) AS '3% off'
FROM 
  magazine;

'
-- 14) Show the primary key of id from the subscriber table and using the date of 2020-12-20 as if it were today's date, how long in years, ROUNDED to the nearest year, has it been since their subscription started?

SELECT 
  subscriptionKey,
  ROUND(DATEDIFF('2020-12-20', subscriptionStartDate) / 365) AS 'Years Since Subscription Started'
FROM 
  subscription;

'
-- 15) Show the subscriptionStartDate and subscriptionLength and add the  subscriptionLength to the subscriptionStartDate to see the date of how long their subscription will go. Format that date so it takes the format of Month name, number day with comma and then a 4 digit year.

SELECT 
  subscriptionStartDate,
  subscriptionLength,
  DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength YEAR), '%M %e, %Y') AS 'Subscription End'
FROM 
  subscription;