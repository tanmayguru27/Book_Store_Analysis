-- Retrieve the total number of books sold for each genre
SELECT 
    b.Genre, SUM(o.Quantity) AS Total_Books_Sold
FROM
    Books b
        INNER JOIN
    Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre;

-- Find the average price of books in the "Fantasy" genre
SELECT 
    b.Genre,
    SUM(o.Quantity * b.Price) / SUM(o.Quantity) AS Avg_Price
FROM
    Books b
        INNER JOIN
    Orders o ON b.Book_ID = o.Book_ID
WHERE
    b.Genre = 'Fantasy'
GROUP BY b.Genre;

-- List customers who have placed at least 2 orders
SELECT 
    c.Name
FROM
    Customers c
        INNER JOIN
    Orders o ON c.Customer_ID = o.Customer_ID
WHERE
    o.Quantity > 2;

-- Find the most frequently ordered book
SELECT 
    b.Book_ID, b.Title, COUNT(o.Order_ID) AS Number_Of_Orders
FROM
    Books b
        INNER JOIN
    Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID , b.Title
ORDER BY Number_Of_Orders DESC
LIMIT 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre
SELECT 
    Title, Price
FROM
    books
WHERE
    Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- Retrieve the total quantity of books sold by each author
SELECT 
    SUM(o.Quantity) AS Total_books_sold, b.Author
FROM
    Books b
        INNER JOIN
    Orders o ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Total_books_sold DESC;

-- List the cities where customers who spent over $30 are located
SELECT 
    c.City, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM
    Customers c
        INNER JOIN
    Orders o ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.Name , c.City
HAVING SUM(o.Total_Amount) > 30
ORDER BY Total_Spent DESC;

-- Find the customer who spent the most on orders
SELECT 
    c.Name, c.Email, c.Phone, c.City, c.Country
FROM
    Customers C
        INNER JOIN
    Orders o ON o.Customer_ID = c.Customer_ID
GROUP BY c.Name , c.Email , c.Phone , c.City , c.Country
ORDER BY SUM(Total_Amount)
LIMIT 1;

-- Calculate the stock remaining after fulfilling all orders
SELECT 
    b.Title,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Stock
FROM
    Books b
        LEFT JOIN
    Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID , b.Title , b.Stock;
