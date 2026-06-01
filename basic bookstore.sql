-- Retrieve all books in the "Fiction" genre--
SELECT 
    *
FROM
    books
WHERE
    Genre = 'Fiction';

-- Find books published after the year 1950
SELECT 
    *
FROM
    books
WHERE
    Published_year > 1950;

-- List all customers from Canada
SELECT 
    Name
FROM
    customers
WHERE
    Country = 'Canada';

-- Show orders placed in November 2023
SELECT 
    *
FROM
    orders
WHERE
    Order_Date < '2023-12-01'
        AND Order_Date > '2023-10-31';

-- Retrieve the total stock of books available
SELECT 
    SUM(Stock) AS total_stock
FROM
    books; 

-- Find the details of the most expensive book
SELECT 
    *
FROM
    books
ORDER BY Price DESC
LIMIT 1;

-- Show all customers who ordered more than 1 quantity of a book
SELECT DISTINCT
    C.*
FROM
    Customers C
        INNER JOIN
    Orders O ON C.Customer_ID = O.Customer_ID
WHERE
    O.Quantity > 1;

-- Retrieve all orders where the total amount exceeds $20
SELECT 
    *
FROM
    orders
WHERE
    Total_Amount > 20
ORDER BY Total_Amount DESC;

-- List all genres available in the Books table
SELECT DISTINCT
    Genre
FROM
    books;

-- Find the book with the lowest stock
SELECT 
    Title
FROM
    books
ORDER BY Stock ASC
LIMIT 1;

-- Calculate the total revenue generated from all orders
SELECT 
    SUM(Total_Amount) AS Total_Revenue
FROM
    orders;