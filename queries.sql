------------------------------- Select everything from the customer table-------------------------
select * from customers;


--------------------------------Select the firstname column from the customer table--------------------
select firstname from customers;


--------------------------------Select the firstname with the id of 1 from customer table---------------
select firstname from customers where customerid = 1;


--------------------------------Updating names for a row in the customer table------------------------
update customers set firstname = 'lerato', lastname = 'mabitso' where customerid = 1;


--------------------------------deleting the row with id = 2 from customer table----------------------
delete from customers where customerid = 2;


--------------------------------Select the number of times "not shipped" and "shipped" appear on the orders table----------------
select count(*) from orders where status = 'Not shipped' ;
select count(*) from orders where status = 'Shipped';


--------------------------------Select biggest value from amount column in the payments table------------------------
select max(amount) from payments;


--------------------------------Order the rows in ascending order of the country column in the customers table-----------------
select * from customers order by country;


---------------------------------Selecting the range amounts from the buyprice column---------------------------------------
select * from products where buyprice between 100 and 600;


---------------------------------Select everything from customers table and filter bu country and city columns------------------
select * from customers where country = 'Germany' and city = 'Berlin';


---------------------------------Select everything from customers table and filter bu country and city columns-------------------
select * from customers where city = 'Durban' or city = 'Cape Town';


---------------------------------Select everything greater than 500 from the products table-----------------------
select * from products where buyprice > 500;


---------------------------------Select the sum from the amounts column in the payments table-----------------------
select sum(amount) from payments;


---------------------------------Select the number of times shipped appeared on the orders table------------------------
select count(*) from orders where status = 'Shipped';


---------------------------------Select the average of the buyprice column both in rands and dollars-----------------------
select avg(buyprice) from products;
select avg(buyprice)/12 from products;


---------------------------------Joining the payments and customer table in reference from the customer id------------------
select * from customers
join payments on customers.customerid = payments.customerid;


---------------------------------Select  everything from products where description in filtered-------------------------
select * from products
where description like '%Turnable front wheels%';