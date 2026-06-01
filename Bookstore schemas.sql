create database bookstoredb;

use bookstoredb;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(300),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_year INT,
    Price DECIMAL(10 , 2 ),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Book_ID)
        REFERENCES Books(Book_ID)
);