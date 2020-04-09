1. Create a database called “Umuzi”.

CREATE DATABASE Umuzi;


2. Create the following tables in the Umuzi database:
3. Create a primary key for each table with auto-increment (make sure you correctly specify the data types, e.g. the ID    	field should be int).

    
CREATE TABLE Customers (
CustomerID SERIAL PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Gender VARCHAR,
Address VARCHAR(200),
Phone VARCHAR,
Email VARCHAR(100),
City VARCHAR(20),
Country VARCHAR(50)
);

CREATE TABLE Employees (
EmployeeID SERIAL PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
JobTitle VARCHAR(20)
);


CREATE TABLE Payments(
PaymentId SERIAL PRIMARY KEY,
PaymentDate DATE,
"Amount(R)" DECIMAL 
);


CREATE TABLE Products(
ProductId SERIAL PRIMARY KEY,
ProductName VARCHAR(100),	
Description VARCHAR(300),
"BuyPrice(R)" DECIMAL
);


4. Create foreign keys so that every ID in the order table references an existing ID in the tables referenced (e.g.,       ProductID, EmployeeID, etc).
 
CREATE TABLE Orders (
OrderID SERIAL PRIMARY KEY,
ProductID INT REFERENCES Products(ProductID),
PaymentID INT REFERENCES Payments(PaymentID),
UNIQUE(PaymentID),
FulfilledByEmployeeID INT REFERENCES Employees(EmployeeID),
DateRequired DATE,
DateShipped DATE, 
Status VARCHAR(20)
);


5. INSERT the records in the tables below into the table you created in step 2.

a. Inserting customers information into Customers table.

INSERT into Customers (
FirstName,
LastName,
Gender,
Address,
Phone,
Email,
City,
Country
) VALUES
(
'John',	
'Hibert',
'Male',	
'284 chaucer st',	
'084789657',	
'john@gmail.com',	
'Johannesburg',	
'South Africa'
),
(
'Thando',
'Sithole',
'Female',
'240 Sect 1',
'0794445584',	
'thando@gmail.com',	
'Cape Town',
'South Africa'
),
(
'Leon',	
'Glen',	
'Male',	
'81 Everton Rd,Gillits',
'0820832830',	
'Leon@gmail.com',
'Durban',
'South Africa'
),
(
'Charl',
'Muller',
'Mal',
'290A Dorset Ecke',
'+44856872553',
'Charl.muller@yahoo.com',	
'Berlin',	
'Germany'
),
(
'Julia',
'Stein',
'Female',
'2 Wernerring',
'+448672445058',
'Js234@yahoo.com',
'Frankfurt',
'Germany'
);

b. Inserting employees data into Employees table

INSERT into employees (
FirstName,
LastName, 
Email,
JobTitle) 
values (
'Kani',
'Matthew',	
'mat@gmail.com',
'Manager'
),
(
'Lesly',	
'Cronje',
'LesC@gmail.com',
'Clerk'
),
(
'Gideon',
'Maduku',
'm@gmail.com',
'Accountant'
);

c. Inserting products information into Products table

INSERT into Products(
ProductName, 
Descrption,
BuyPrice
)
values (
'Harley Davidson Chopper',
'This replica features working kickstand, front suspension, gear-shift lever',
'150.75'
),
('Classic Car',
'Turnable front wheels, steering function',
'550.75'),
('Sports car',
'Turnable front wheels, steering function',
'700.60'
);

d. Inserting payment information into the Payments table.

INSERT into Payments(
PaymentDate,
Amount
) values (
'01-09-2018',
'150.75'
),
(
'03-09-2018',
'150.75'
),
(
'03-09-2018',	
'700.60'
);

UPDATE Payments SET CustomerID = 1 WHERE paymentID =  1;
UPDATE Payments SET CustomerID = 5 WHERE paymentID =  2; 
UPDATE Payments SET CustomerID = 4 WHERE paymentID =  3; 



e. Inserting orders information into orders table

INSERT into Orders (
DateRequired,
Status)
values (
'05-09-2018',
'Not shipped'
),
(
'06-09-2018',
'Not shipped'
);

INSERT into Orders (
DateRequired,
DateShipped,
Status)
values (
'04-09-2018',
'03-09-2018',
'shipped'
);


INSERT into Orders (
DateRequired,
DateShipped,
Status)
values (
'04-09-2018',
'03-09-2018',
'shipped'
);

UPDATE Orders SET ProductID = 1 WHERE OrderID =  1;
UPDATE Orders SET PaymentID = 1 WHERE OrderID = 1;
UPDATE Orders SET FulfilledByEmployeeID = 2 WHERE OrderID = 1;

UPDATE Orders SET ProductID = 1 WHERE OrderID =  2;
UPDATE Orders SET PaymentID = 2 WHERE OrderID = 2;
UPDATE Orders SET FulfilledByEmployeeID = 3 WHERE OrderID = 2;

UPDATE orders SET productID = 3 WHERE orderID = 3;
UPDATE orders SET paymentID = 3 WHERE orderID = 3;
UPDATE orders SET fulfilledByEmployeeID = 3 WHERE orderID = 3;

----------------------------------------------------------------------------------------------------------------------------
STEP 2

SELECT ALL records from table Customers.
select * from customers;

SELECT records only from the name column in the Customers table.
select first_name from customers



Show the name of the Customer whose CustomerID is 1.
select customer_id from customers 
where first_name = 1;

UPDATE the record for CustomerID = 1 on the Customer table so that the name is .
update customers 
set first_name = 'lerato'
where customer_id = 1;


update customers 
set last_name = 'mabitso'
where customer_id = 1;

DELETE the record from the Customers table for customer 2 (CustomerID = 2).
delete from customers 
where customer_id = 2;

Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.
select count (status) from orders
where status = 'shipped'
;

Return the MAXIMUM payment made on the PAYMENTS table.
select max(amount)
from payments

Select all customers from the table, sorted by the column.
select customer_id 
from customers 
where country =  country;

Select all products with a price BETWEEN R100 and R600.
select product_name
from products
where buy_price between 100 and 600

Select all fields from where country is AND city is .
select customer_id
from customers
where country = 'germany' city = 'berlin'

Select all fields from where city is OR .
select customer_id
from customers
where city  between cape_town and durban

Select all records from Products where the Price is GREATER than R500.
select * 
from products
where buy_price > 500


Return the sum of the Amounts on the Payments table.
select sum(buy_price) as rands from products;


Count the number of shipped orders in the Orders table.
select count (status) from orders
where status = 'not shipped'
;


Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
SELECT AVG(buy_price) as rands
FROM products

SELECT AVG(buy_price * 12) as rands
FROM products







Using INNER JOIN create a query that selects all Payments with Customer information.
select payments.customer_id,
payments.payment_id,
payments.payment_date,
payments.amount,
customers.first_name,
customers.last_name,
customers.address
from payments
inner join customers on payments.customer_id  = customers.customer_id;



Select all products that have turnable front wheels.

select * from products 
where description = 'turnable front wheels'






























