use mintclassics;

select country from customers;
#country with highest orders
select country, count(country) as countC
from orders o
join customers c
on o.customerNumber = c.customerNumber
group by country 
order by countC desc;

#employees with their supervisor
select e.employeeNumber,
concat(e.firstName,' ',e.lastName) as Employee_Name,
concat(s.firstName,' ',s.lastName) as Supervisor_Name
from employees e
join employees s
on e.reportsTo = s.employeeNumber;

#company branches and employees
select e.employeeNumber, e.firstName, e.lastName, e.jobTitle,
o.city,o.addressLine1 as address, o.state, o.country
from employees e
join offices o
on e.officeCode = o.officeCode
order by employeeNumber;

#successfully shipped products
select orderNumber, customerNumber, shippedDate, status
from orders
where status = "Shipped"
order by customerNumber;

#total shipped order = 303
select count(status) as totalShipped
from orders 
where status = "Shipped";

#products order by customer
select od.productCode, od.orderNumber,
o.orderDate, od.quantityOrdered,
od.priceEach, p.productName, p.productLine
from orderdetails od
join products p
using(productCode)
join orders o
using(orderNumber)
order by orderNumber;

#list of total sales in 2003
select customerNumber, 
paymentDate, amount
from payments
where paymentDate <= '2003-12-31';

#total of amount in 2003 = 3250217.70
select sum(amount) as totalSum
from payments
where paymentDate <= '2003-12-31';

#total number of product sold in 2003 = 100
select count(customerNumber) as number_of_payments
from payments
where paymentDate <= '2003-12-31';

#list of total sales in 2004
select customerNumber, paymentDate, amount
from payments
where paymentDate between '2004-01-01' and '2004-12-31';

#total of amount in 2004 = 4313328.25
select sum(amount) as totalSum
from payments
where paymentDate between '2004-01-01' and '2004-12-31';

#total number of product sold in 2004 = 136
select count(customerNumber) as number_of_payments
from payments
where paymentDate between '2004-01-01' and '2004-12-31';

#list of total sales in 2005
select customerNumber, paymentDate, amount
from payments
where paymentDate between '2005-01-01' and '2005-12-31';

#total of amount in 2005 = 1290293.28
select sum(amount) as totalSum
from payments
where paymentDate between '2005-01-01' and '2005-12-31';

#total number of product sold in 2005 = 37
select count(customerNumber) as number_of_payments
from payments
where paymentDate between '2005-01-01' and '2005-12-31';

#products in stocks, purchase price, sale price and estimated profit
select p.productCode, p.productName, pl.productLine, p.quantityInStock,
p.buyPrice as purchasePrice, p.MSRP as salePrice,
(p.MSRP - p.buyPrice) as estimatedProfit
from products p
join productlines pl
using(productLine)
order by productCode;

#highest sales by product line
select p.productLine, count(od.productCode) as noOfSales
from products p 
join orderdetails od 
on p.productCode = od.productCode
group by p.productLine
order by noOfSales desc;