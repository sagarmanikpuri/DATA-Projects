USE project_db;
SHOW TABLES;
SELECT * FROM books LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM customers LIMIT 10;
-- Basic Queries
-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM books
WHERE Published_Year>'1950';

-- 3) List all customers from the Canada:

SELECT * FROM customers
WHERE Country='Canada';

-- 4) Show orders placed in November 2023

SELECT * FROM orders
WHERE Order_Date >= '2023-11-01'
AND Order_Date < '2023-12-01';

-- 5) Retrieve the total stock of books available

SELECT SUM(Stock) AS Total_stock
FROM books;

-- 6) Find the details of the most expensive book

SELECT * FROM books
ORDER BY Price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book

SELECT * FROM orders
WHERE Quantity >'1';

-- 8) Retrieve all orders where the total amount exceeds $20

SELECT * FROM orders
WHERE Total_Amount > '20';

-- 9) List all genres available in the Books table

SELECT DISTINCT Genre FROM books;

-- 10) Find the book with the lowest stock

SELECT * FROM books
ORDER BY Stock ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders

SELECT SUM(Quantity * Total_Amount) AS Total_Revenue
FROM orders;

-- Advance Queries

-- 1) Retrieve the total number of books sold for each genre

SELECT b.Genre, SUM(O.Quantity) AS Total_Books_Sold
FROM Orders O
JOIN Books b ON O.Book_id = b.Book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre

SELECT AVG(Price) AS Average_Price
FROM books
WHERE Genre='Fantasy';

-- 3) List customers who have placed at least 2 orders

SELECT Customer_id, COUNT(*) AS Total_Orders
FROM orders
GROUP BY Customer_id
HAVING COUNT(*) >= 2;

-- 4) Find the most frequently ordered book

SELECT b.title, SUM(o.quantity) AS total_ordered
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY total_ordered DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre 

SELECT title, genre, price
FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author

SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.author;

-- 7) List the cities where customers who spent over $30 are located

SELECT DISTINCT C.city, Total_Amount
FROM orders O
JOIN customers C ON O.customer_id=C.customer_id
WHERE O.Total_Amount > 30;

-- 8) Find the customer who spent the most on orders

SELECT C.customer_id, C.name, SUM(O.Total_Amount) AS Total_Spent
FROM orders O
JOIN customers C ON O.customer_id=C.customer_id
GROUP BY C.customer_id, C.name
ORDER BY Total_Spent DESC LIMIT 1;

