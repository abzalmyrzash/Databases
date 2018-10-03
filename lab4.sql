--1
CREATE DATABASE lab4;

--2
CREATE TABLE customers(
	customer_id INTEGER,
	cust_name VARCHAR(50),
	city VARCHAR(50),
	grade INTEGER,
	salesman_id INTEGER
);

--3
SELECT * FROM customers WHERE grade > 100;

--4
SELECT * FROM customers WHERE grade > 100 AND city = 'New York';

--5
SELECT * FROM customers WHERE grade > 100 OR city = 'New York';

--6
SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';

--7
SELECT * FROM customers WHERE substring(name from 1 for 1) = 'B';

--8
CREATE TABLE customers(
	order_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	description TEXT,
	purch_amt INTEGER
);

--9
SELECT * FROM orders as o WHERE o.customer_id IN
	(SELECT customer_id FROM customers WHERE city = 'New York');

--10
SELECT * FROM customers as c WHERE c.customer_id IN (SELECT customer_id FROM orders WHERE purch_amt > 10);

--11
SELECT sum(purch_amt) FROM orders;

--12
SELECT avg(purch_amt) FROM orders;

--13
SELECT * FROM customers WHERE name IS NOT NULL;

--14
SELECT max(purch_amt) FROM orders;