CREATE VIEW test_view AS 
SELECT employees.employeeid, employees.lastname, orders.orderdate
FROM employees 
INNER JOIN orders
ON employees.employeeid = orders.employeeid;



SELECT employees.employeeid, employees.lastname, orders.orderdate
FROM employees 
INNER JOIN orders
ON employees.employeeid = orders.employeeid;




SELECT * FROM orders 
WHERE employeeid=3 AND customerid='QUICK';