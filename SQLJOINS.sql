/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name as Product, C.Name as Category FROM products AS P
INNER JOIN categories AS C on C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT P.Name, P.Price, R.Rating FROM products AS P
 INNER JOIN reviews AS R ON R.ProductID = P.ProductID
 WHere R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, Sum(S.Quantity) AS Total FROM sales AS s
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name AS 'Department Name', C.NAME AS 'Category Name' FROM departments AS D
INNER JOIN categories AS C ON C.DepartmentID = D.DepartmentID
WHERE C.NAME = 'Appliances' OR C.NAME = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.NAME, Sum(S.QUANTITY) AS 'Total Sold', Sum(S.QUANTITY * S.PricePerUnit) AS 'Total Price'
FROM products AS P
INNER JOIN sales AS S ON S.ProductID = S.ProductID
WHERE P.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.NAME, R.REVIEWER, Min(R.Rating)
FROM products AS P
INNER JOIN reviews AS R ON R.ProductID = P.ProductID
WHERE P.ProductID = 857
GROUP BY P.productID;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, E.LastName, P.Name, Sum(S.Quantity) AS TotalSold
FROM Sales AS S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P ON p.ProductID = S.ProductID
GROUP BY E.EmployeeID, P.ProductID;
