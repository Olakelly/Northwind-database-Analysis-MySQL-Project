-- You can open a query tab using CTRL + T from your keyboard
-- active schema

use Northwind;

-- SQL Keywords are not casr sensivite
-- SELECT is same as select
-- Every SQL query must start with select

select column1, column2
from table1;

-- if you wan tot return all rows and colunms
select *
from table1;
-- ; also indicate the end of the query


-- Customers table
select * from Customers;

-- The following SQL statement selects the costumername, city and country colunms
select customername, city, country
from customers;

-- write SQL query to return ProductID, ProductName
select ProductID, ProductName
from Products;

-- write SQL query to return  FirstName, LastName, BirthDate
select FirstName, LastName, BirthDate
from employees;

-- write SQL query to return customername, address, city
select customername, address, city
from customers;

-- different countries
select distinct Country
from customers;

-- Number of countries
select count(distinct Country)
From customers;

-- different Cities in Suppliers
select distinct (City)
from Suppliers;


-- where clause
Select *
from Customers
where Country = "Mexico";

select *
from Products
where productid =1;

select *
from Customers
where city =  'london';

select count(*)
from Customers
where Country = 'USA';

-- Product with price higher than 100
select * 
from Products
where price > 100;

select *
from customers
where customerid >=15;

select *
from order_details
where quantity > 3;


select *
from employees
where birthdate > "1960-01-01";

-- AND , OR and NOT  Operators
SELECT *
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';
-- and operators requires both conditions met
-- or operators returs result if either of the conditions is true

SELECT *
FROM Suppliers
WHERE Country = 'Japan' AND City = 'Tokyo';

SELECT *
FROM customers
WHERE Country = 'UK' AND City = 'London';

SELECT *
FROM customers
WHERE Country = 'UK' or country = 'USA';

SELECT *
FROM products
WHERE price < 5 and productid > 10;

select *
from Customers
where city = 'berlin' or city = 'stuttgart';

select *
from Customers
where city= 'portland' or city= 'kirkland';

select *
from orders
where orderdate < '1996-08-27' or orderdate > '1997-02-21';

-- order by (sorting by)
SELECT * FROM Customers
ORDER BY Country;

-- ascending order
SELECT * FROM products
ORDER BY price asc;

-- decending order
SELECT * FROM products
ORDER BY price desc;

-- order of writing column name is important
SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY  CustomerName, Country;

select *
from employees
order by lastname desc, birthdate desc;

select *
from customers
where country = 'USA'
order by CustomerName;

-- The following SQL statement selects the first three records from the "Customers" table
SELECT * FROM Customers
LIMIT 3;

-- The following SQL statement selects the first 5records from the "Products" table ordered by "Price"

SELECT * FROM Products
ORDER BY PRICE 
LIMIT 5;

SELECT * FROM Products
WHERE CategoryID=1
LIMIT 3;

-- Write an SQL query to get the top 10 products from the Products table with a Price greater than 20, limiting the result to 10 rows.

SELECT * FROM Products
where price > 20
limit 10;

-- Write an SQL query to find the first 3 customer in the Customers table who live in 'London'.
select * from customers
where city = 'london'
limit 3;

-- The following SQL statement finds the price of the cheapest product:

SELECT MIN(Price) AS SmallestPrice
FROM Products;


-- The following SQL statement finds the price of the most expensive product:

SELECT MAX(Price) AS LargestPrice
FROM Products;

select count(*)
from products;

-- Average Price
select avg(price)
from products;

select round(avg(price),1)
from products;

-- sum of price
select sum(price)
from products;

-- like Opertor
select *from customers
where customerName like 'a%';

select *from customers
where customerName like '%p';

-- at least 3 characters lomg starting with a
select * from customers
where customerName like 'a__%';

select * from customers
where customerName like '_t%';

select * from customers
where contactName like 'a%o';

select * from customers
where  contactName not like 'ba%';

SELECT * FROM customers
WHERE customerName NOT LIKE 'a%';

SELECT * FROM suppliers
WHERE country  LIKE '&land%';

SELECT * FROM customers
WHERE customerName  LIKE '_n%';

SELECT * FROM shippers
WHERE Shippername  LIKE '%Express%';

-- employee firstname including m and lastname starting with a
select firstname, lastname
from employees
where FirstName like '%m%' and lastname like '%a%';

-- 'In' operator allows you to specify multiple values in a 'where' clause
select *
from customers
where country in('germany', 'france', 'uk');

select *
from customers
where country= 'germany' or country = 'france'or country =  'uk';

-- both code give the same value but the 'in' operation makes it faster.

select *
from customers
where Country not in ('germany', 'france', 'uk');


-- Sub queries

-- customers who are in the same country as suppliers
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

-- gogole Having clause on your own

-- Write an SQL query to find all customers from either Berlin, 'Paris', or 'Madrid' in the Customers table.
select *
from Customers
where city in ('berlin', 'Paris', 'Madrid');


-- Write an SQL query to find all orders that were shipped by ShipperID 1 or 3 from the Orders table.
Select * 
from Orders
where ShipperID in (1, 3);

-- Write an SQL query to find all products that have UnitPrice is 10, 20, or 30.
select *
from products
where Price in (10, 20, 30);

 
-- Write an SQL query to find all customers who have placed an order. Use a subquery on the Orders table to match the customers. (Use subquery)
select *
from customers
where customerID in (select CustomerID from orders);

-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- BETWEEN Syntax
-- SELECT column_name(s)
-- FROM table_name
-- WHERE column_name BETWEEN value1 AND value2;

select*
from products
where Price between 10 and 20; 

select*
from products
where Price not between 10 and 20; 


select*
from products
where Price between 10 and 20
and CategoryID not in (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;


SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' ;

 --  Retrieve all columns from the "Customers" table.
 select * from customers;
 
 -- Retrieve only the "CustomerName" and "City" columns from the "Customers" table.
  select CustomerName, City  from customers;
  
  -- Retrieve distinct values of the "City" column from the "Customers" table.
 select distinct city from customers;
 
 -- Retrieve all columns from the "Products" table where the "Price" is greater than 50.
 select * from products
 where price > 50;
 
 -- Retrieve all columns from the "Customers" table where the "Country" is either 'USA' or 'UK'.
 select * from customers
 where country in ('USA', 'UK');
 
 -- Retrieve all columns from the "Orders" table, sorted by the "OrderDate" in descending order.
 select * from orders
 order by OrderDate desc;
 
 -- Retrieve all columns from the "Products" table where the "Price" is between 20 and 50, ordered by descending "Price".
 
 select * from Products
 where price between 20 and 50
 order by price desc;
 
 -- Retrieve all columns from the "Customers" table where the "Country" is 'USA' and "City" is either 'Portland' or 'Kirkland', ordered by ascending "CustomerName".
 select * from customers
 where Country = 'USA'
 and city in ('Portland', 'Kirkland')
 order by CustomerName;
 
 
 -- Retrieve all columns from the "Customers" table where the "Country" is 'UK' or "City" is 'London', ordered by descending "CustomerName".
 select * from customers
 where Country = 'UK' or City = 'London'
 order by CustomerName desc;
 
 -- Retrieve all columns from the "Products" table where the "CategoryID" is 1 or 2, ordered by ascending "ProductName".
select * from Products 
 where CategoryID in (1,2)
 order by ProductName;
 
  select * from orders
  where CustomerID in (
Select CustomerID from customers
where CustomerName like 'a%');

select avg(price)
from products;

select *
from employees
where LastName like 's%' and FirstName like '%l';

Select price as 'top 5 most expensive products'
from products
order  by price desc
limit 5;

select *
from products
where ProductName like 'CH%';
