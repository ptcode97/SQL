 /*  Finding all the tracks that have a length of 5,000,000 milliseconds or more. */
 
SELECT TrackID,Milliseconds 
FROM Tracks
WHERE Milliseconds >= 5000000


 /*  Finding all the invoices whose total is between $5 and $15 dollars. */
 
 
SELECT *
FROM Invoices
WHERE Total BETWEEN 5 AND 15


/*  Finding all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY. */

SELECT *
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')


/*  Finding all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00. */

SELECT *
FROM Invoices
WHERE (CustomerID = 56 OR CustomerID = 58) AND total BETWEEN 1 AND 5


/*   Finding all the tracks whose name starts with 'All'.  */

SELECT *
FROM Tracks
WHERE Name LIKE "All%"


/*    Finding all the customer emails that start with "J" and are from gmail.com.    */

SELECT *
FROM Customers
WHERE Email LIKE "j%@gmail.com"


/*  Finding all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.     */

SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton','Vancouver')
ORDER BY InvoiceID DESC



/*   Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.  */

SELECT COUNT(*) as count
FROM Invoices
GROUP BY CustomerID
ORDER BY count DESC


/* Find the albums with 12 or more tracks. */

SELECT COUNT(*) as count
FROM Tracks
GROUP BY ALBUMID
HAVING count >=12 
