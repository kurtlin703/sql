. ------------------------------------------Create a database called “Umuzi”.--------------------------------


.-- Create the following tables in the Umuzi database:3. Create a primary key for each table with auto-increment.--

    
create table Customers (
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

create table Employees (
EmployeeID SERIAL PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
JobTitle VARCHAR(20)
);


create table Payments(
PaymentId SERIAL PRIMARY KEY,
PaymentDate DATE,
"Amount(R)" DECIMAL 
);


create table Products(
ProductId SERIAL PRIMARY KEY,
ProductName VARCHAR(100),	
Description VARCHAR(300),
"BuyPrice(R)" DECIMAL
);


 --Create foreign keys so that every ID in the order table references an existing ID in the tables referenced . --
 
create table Orders (
OrderID SERIAL PRIMARY KEY,
ProductID INT REFERENCES Products(ProductID),
PaymentID INT REFERENCES Payments(PaymentID),
UNIQUE(PaymentID),
FulfilledByEmployeeID INT REFERENCES Employees(EmployeeID),
DateRequired DATE,
DateShipped DATE, 
Status VARCHAR(20)
);


. --insert the records in the tables below into the table you created in step 2.--

. Inserting customers information into Customers table.

insert into Customers (
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

. --Inserting employees data into Employees table--

insert into employees (
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

.-- Inserting products information into Products table--

insert into Products(
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

. --Inserting payment information into the Payments table.--

insert into Payments(
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

update Payments SET CustomerID = 1 where paymentID =  1;
update Payments SET CustomerID = 5 where paymentID =  2; 
update Payments SET CustomerID = 4 where paymentID =  3; 



. --Inserting orders information into orders table--

insert into Orders (
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

insert into Orders (
DateRequired,
DateShipped,
Status)
values (
'04-09-2018',
'03-09-2018',
'shipped'
);


insert into Orders (
DateRequired,
DateShipped,
Status)
values (
'04-09-2018',
'03-09-2018',
'shipped'
);

update Orders set ProductID = 1 where OrderID =  1;
update Orders set PaymentID = 1 where OrderID = 1;
update Orders set FulfilledByEmployeeID = 2 where OrderID = 1;

update Orders set ProductID = 1 where OrderID =  2;
update Orders set PaymentID = 2 where OrderID = 2;
update Orders set FulfilledByEmployeeID = 3 where OrderID = 2;

update orders set productID = 3 where orderID = 3;
update orders set paymentID = 3 where orderID = 3;
update orders set fulfilledByEmployeeID = 3 where orderID = 3;


----------------------------------------------------------part 2------------------------------------------------------

select ALL records from table Customers.
select * from customers;

select records only from the name column in the Customers table.
select first_name from customers



Show the name of the Customer whose CustomerID is 1.
select customer_id from customers 
where first_name = 1;

update the record for CustomerID = 1 on the Customer table so that the name is .
update customers 
set first_name = 'lerato'
where customer_id = 1;


update customers 
set last_name = 'mabitso'
where customer_id = 1;

delete the record from the Customers table for customer 2 (CustomerID = 2).
delete from customers 
where customer_id = 2;

select all unique statuses from the Orders table and get a count of the number of orders for each unique status.
select count (status) from orders
where status = 'shipped'
;

Return the MAXIMUM payment made on the PAYMENTS table.
select max(amount)
from payments

select all customers from the table, sorted by the column.
select customer_id 
from customers 
where country =  country;

select all products with a price BETWEEN R100 and R600.
select product_name
from products
where buy_price between 100 and 600

select all fields from where country is AND city is .
select customer_id
from customers
where country = 'germany' city = 'berlin'

select all fields from where city is OR .
select customer_id
from customers
where city  between cape_town and durban

select all records from Products where the Price is GREATER than R500.
select * 
from products
where buy_price > 500


Return the sum of the Amounts on the Payments table.
select sum(buy_price) as rands from products;


Count the number of shipped orders in the Orders table.
select count (status) from orders
where status = 'not shipped'
;


Return the average price of all Products, in Rands and in Dollars.
select AVG(buy_price) as rands
from products

select AVG(buy_price * 12) as rands
from products







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



select all products that have turnable front wheels.

select * from products 
where description = 'turnable front wheels'






























