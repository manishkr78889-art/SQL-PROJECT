# SQL PROJECT ONLINE BOOK STORE

-- create database
CREATE DATABASE onlinebooksstore;
-- switch to the database

use onlinebooksstore;

--- create tables
CREATE TABLE books(
book_id INT PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(100),
genre VARCHAR(50),
published_year INT,
price DECIMAL(10,2),
stock INT
); 
 
 CREATE TABLE customers (
 customer_id int PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(100),
 phone VARCHAR(50),
 CITY VARCHAR(15),
 country VARCHAR(150)
 );
 
 CREATE TABLE orders (
 order_id INT primary key,
 customer_id INT,
 book_id INT,
 order_date DATE,
 quantity INT,
 total_amount DECIMAL(10,2),
 CONSTRAINT fk FOREIGN KEY (customer_id)REFERENCES customers (customer_id),
 CONSTRAINT FK1 FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(book_id)
 );
 
 SELECT *FROM BOOKS;
 SELECT *FROM CUSTOMERS;
 SELECT *FROM ORDERS;
 
 
 
 # basic level
 --- 1) Retrive all in the "Fiction" genre
 
  SELECT * FROM BOOKS;
   WHERE Genre = 'FICTION';
 
 
 SELECT count(*)FROM BOOKS;
 WHERE Genre = 'FICTION'; 
 
 --- 2) Find the books published after the year 1950:
 SELECT *FROM BOOKS
 WHERE published_year > 1950
 order by published_year;
   
   --- 3) List all customers from the canada:
   
   SELECT * FROM customers
   WHERE country = 'korea';
   
   -- 4) List all customers from in noverber 2023:
    
    SELECT * FROM orders
    Where order_date Between '2023-11-01' and '2023-11-30';
    
   --- 5) Retrieve the total stock of books avaible:
    
    SELECT SUM(stock)as total_stock FROM Books;

-- 6) Find the Details of the most expensive book:
    
       SELECT * FROM Books
       ORDER BY price DESC
       LIMIT 1;
       
-- 7) SHOW  ALL CUSTOMERS WHO ORDERED MORE THAN 1 QUANTITY OF A BOOK:
    SELECT * FROM orders
    WHERE quantity > 1;
       
-- 8) Retrieve all orders where the total amount exceeds $20:
       
       SELECT * FROM orders
       WHERE total_amount > 20;   
       
       
-- 9) List all genres avaible in the book in the Books table:
       
       SELECT DISTINCT genre 
       FROM books;
       
 -- 10) Find the book with the lowest stock:
       Select * FROM Books
       ORDER BY stock 
       LIMIT 1;
    -- 11) Calculate the total revennue gerrate from all orders:
    SELECT sum (total_amount)AS revenue
    from Orders;
    
                            --- INTERMEDIATE LEVEL:
	-- 12) Find the average price of books in the "Fantasy" genre:
    SELECT AVG(price) AS Averrage_price 
    FROM Books
    WHERE Genre = 'Fantasy';
    
    -- 13) show the top 3 most expensive books of 'fantasy' Genre:
    SELECT * FROM books 
    WHERE genre = 'fantasy'
    ORDER BY price DESC
    LIMIT 3;
    
    -- 14) Retrieve the total number of books sold for each genre:
    SELECT b.Genre, SUM(O.Quantity) AS Total_Books_sold
    FROM orders O
    JOIN Books b
    ON O.book_id = b.book_id
    GROUP BY b.Genre;
    
    -- 15) Retrieve the total quanty of books sold by each author:
    SELECT b.author, SUM(O.Quantity) AS Total_Books_sold
    FROM orders O
    JOIN Books b
    ON O.book_id = b.book_id
    GROUP BY b.author;
    
    # Adavance level:
    --- 16) List customer who have placed at least 2 orders:
    
    SELECT o.customer_id , c.name, COUNT(O.Order_id) AS ORDER_COUNT
    FROM orders O
    JOIN Customers c 
    ON O.customer_id = c.customer_id 
    GROUP BY o.customer_id, c.name
    HAVING COUNT (ORDER_ID) >= 2;
    
    --- 17) Find the most frequency orderd book;
    
    SELECT o.book_id , b.title, COUNT(O.Order_id) AS ORDER_COUNT
    FROM orders O
    JOIN books b 
    ON O.book_id = b.book_id 
    GROUP BY o.book_id, b.title
    ORDER BY ORDER_COUNT DESC
    LIMIT 1;
    --- 18) List the cities where customers who spend over $30 are located:
    
    SELECT DISTINCT c.city, total_amount
    FROM orders O
    JOIN customers c 
    ON O.customer_id = c.customer_id 
    where o.total_amount > 30;
   
   --- 18) Find the customer who spent the most on orders:
   
    SELECT c.customer_id , c.name, sum(O.total_amount) AS Total_Spent
    FROM orders O
    JOIN customers c 
    ON o.customer_id = c.customer_id 
    GROUP BY c.customer_id , c.name
    ORDER BY Total_spent DESC
    LIMIT 1;
