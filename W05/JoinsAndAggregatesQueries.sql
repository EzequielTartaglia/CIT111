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

