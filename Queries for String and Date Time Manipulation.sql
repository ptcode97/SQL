/* Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA) */


SELECT 
CustomerId, FirstName,LastName, Address, UPPER(city || ' ' || country)
FROM Customers


/*  Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work. */

SELECT 
substr("FirstName",1,4) AS First,
substr("LastName",1,2) AS Last ,
LOWER(substr("FirstName",1,4) || substr("LastName",1,2) )
FROM Employees


/* Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.  */


SELECT LastName,FirstName, date('now')-HireDate AS Years
FROM Employees
WHERE Years >= 15
ORDER BY LastName ASC


/*  Profiling the Customers table, answer the following question.  */


PRAGMA table_info(Customers)


/*   Find the cities with the most customers and rank in descending order.   */

SELECT COUNT(*) AS Count, City
FROM Customers
GROUP BY City 
ORDER BY Count DESC


/*  Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.   */

SELECT Customers.FirstName ,Customers.LastName , Invoices.InvoiceId, FirstName||LastName||InvoiceId AS ids
FROM Customers INNER JOIN Invoices ON  Customers.CustomerID = Invoices.CustomerID
ORDER BY ids ASC
