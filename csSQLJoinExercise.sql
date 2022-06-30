/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select products.Name, categories.Name from products 
	inner join categories on categories.CategoryID=products.CategoryID;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.name, products.price, reviews.Rating from reviews right join products on products.ProductID=reviews.ProductID; 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.*, sum(s.Quantity) from employees as e left join sales as s on e.EmployeeID= s.EmployeeID group by e.EmployeeID;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name, c.Name from categories as c right join departments as d on d.DepartmentID=c.DepartmentID where c.Name like '%Appliances%' or c.Name like '%Games%'; 
	
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name, sum(s.Quantity), p.Price from products as p left join sales as s on p.ProductID=s.ProductID where p.Name like '%Eagles: Hotel California%' group by p.productid;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name as 'Product Name',sum(s.Quantity) as 'Product Quantity'  from employees as e 
left join sales as s on e.EmployeeID=s.EmployeeID 
left join products as p on s.ProductID=p.ProductID
group by s.ProductID; 