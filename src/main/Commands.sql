
CREATE TABLE Customers
(
Customer_ID SERIAL PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Gender VARCHAR,
Address VARCHAR(200),
Phone INTEGER,
Email VARCHAR(100),
City VARCHAR(20),
Country VARCHAR(50)
);

CREATE TABLE Employee
(
Employee_ID SERIAL PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Email VARCHAR(100),
Job_Title VARCHAR(20)
);

CREATE TABLE Products
(
Product_ID SERIAL PRIMARY KEY,
Product_Name VARCHAR(100),
Description VARCHAR(300),
Price DECIMAL
);

CREATE TABLE Payments
(
Customer_ID INTEGER REFERENCES Customers(Customer_ID),
Payment_ID SERIAL PRIMARY KEY,
Payment_Date VARCHAR(50),
Amount MONEY
);

CREATE TABLE Orders
(
Order_ID SERIAL PRIMARY KEY,
Product_ID INTEGER REFERENCES Products(Product_ID),
Payment_ID INTEGER REFERENCES Payments(Payment_ID),
Employee_ID INTEGER REFERENCES Employee(Employee_ID),
Date_Required VARCHAR(50),
Date_Shipped VARCHAR(50),
Status VARCHAR(20)
);

INSERT INTO Customers
(Customer_ID, First_Name, Last_Name,Gender, Address, Phone, Email, City, Country)
VALUES
(1, 'JOHN', 'HIBERT', 'MALE', '284 CHAUCER ST', 084789657, 'john@gmail.com', 'JOHANNESBURG', 'SOUTH AFRICA'),
(2, 'THANDO', 'SITHOLE', 'FEMALE', '204 SEC 1', 079444558, 'thando@gmail.com', 'CAPE TOWN', 'SOUTH AFRICA'),
(3, 'LEON', 'GLEN', 'MALE', '81 EVERTON RD, GILLITIS', 082083283, 'Leon@gmail.com', 'DURBAN', 'SOUTH AFRICA'),
(4, 'CHARL', 'MULLER', 'MALE', '290A DORSET ECKE', 44856872, 'Charl.mullar@yahoo.com', 'BERLIN', 'GERMANY'),
(5, 'JULIA', 'STEIN', 'FEMALE', '2 WERNERRING', 44867244, 'Js234@yahoo.com', 'FRANKFURT', 'GERMANY');

INSERT INTO Employee
(Employee_ID, First_Name, Last_Name, Email, Job_Title)
VALUES
(1, 'KANI', 'MATTHEW', 'mat@gmail.com', 'MANAGER'),
(2, 'LESLEY', 'CRONJE', 'LesC@gmail.com', 'CLERK'),
(3, 'GIDEON', 'MADUKU', 'm@gmail.com', 'ACCOUNTANT');

INSERT INTO Products
(Product_ID, Product_Name, Description, Price)
VALUES
(1, 'Harley Davidson Chopper', 'This reeplica features working kickstand, front suspension, gear-shift lever', '150.75'),
(2, 'Classic Car', 'Turnable front wheels, steering function', '550.75'),
(3, 'Sports Car', 'Turnable front wheels, steering function', '700.60');

INSERT INTO Payments
(Customer_ID, Payment_ID, Payment_Date, Amount)
VALUES
(1, 1, '01/09/2018', '150.75'),
(5, 2, '03/09/2018', '150.75'),
(4, 3, '03/09/2018', '700.60');


INSERT INTO Orders
(Order_ID, Product_ID, Payment_ID, Employee_ID, Date_Required, Date_Shipped, Status)
VALUES
(1, 1, 1, 2, '05/09/2018', NULL, 'Not Shipped'),
(2, 1, 2, 2, '04/09/2018', '03/09/2018', 'Shipped'),
(3, 3, 3, 3, '06/09/2018', NULL, 'Not Shipped');

--SELECT ALL records from table Customers.
SELECT *
FROM Customers;

--SELECT records only from the name column in the Customers table.
SELECT First_Name
FROM Customers;

--Show the name of the Customer whose CustomerID is 1.
SELECT First_Name
FROM Customers
WHERE Customer_ID=1;

--UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.
UPDATE Customers SET First_Name='Lerato', Last_Name='Mabitso' WHERE Customer_ID=1;

--DELETE the record from the Customers table for customer 2 (CustomerID = 2)
DELETE FROM Customers WHERE Customer_ID=2;

--Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.
SELECT COUNT(Status)
FROM Orders;

--Return the MAXIMUM payment made on the PAYMENTS table.
SELECT MAX(Amount)
FROM Payments;

--Select all customers from the “Customers” table, sorted by the “Country” column
select *
FROM Customers
ORDER BY Country ASC;

--Select all products with a price BETWEEN R100 and R600
select *
from products
where price between '100' and '600';

--Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.
select *
from customers
WHERE city='BERLIN'
AND country='GERMANY';

--Select all fields from “Customers” where city is “Cape Town” OR “Durban”.
select *
from customers
WHERE city='CAPE TOWN'
or city='DURBAN';

--Select all records from Products where the Price is GREATER than R500.
select *
from products
WHERE price > '500';

--Return the sum of the Amounts on the Payments table.
select SUM(amount)
FROM payments;

--Count the number of shipped orders in the Orders table.
select count(*)
from orders
where status='Shipped';

--Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
select AVG(price)
from products;

--Using INNER JOIN create a query that selects all Payments with Customer information.
SELECT Customers.Customer_ID, Payments.Payment_ID
FROM Customers
INNER JOIN Payments
ON Customers.Customer_ID = Payments.Customer_ID;

--Select all products that have turnable front wheels.
SELECT *
FROM Products
WHERE description LIKE 'Turnable front wheels%';