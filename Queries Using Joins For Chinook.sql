/*   Using a subquery, find the names of all the tracks for the album "Californication".   */

SELECT Name
FROM Tracks 
Where AlbumId  IN (SELECT AlbumId
                    FROM Albums
                    WHERE Title = "Californication")
                    
                    
/*   Find the total number of invoices for each customer along with the customer's full name, city and email.   */

SELECT FirstName,LastName,City,Email,COUNT(*) as total_invoices
FROM Customers INNER JOIN Invoices ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Invoices.CustomerId


/*   Retrieve the track name, album, artistID, and trackID for all the albums.   */


SELECT Name,Title,ArtistId,TrackId
FROM Albums LEFT JOIN Tracks ON Albums.AlbumId = Tracks.AlbumId


/*  Retrieve a list with the managers last name, and the last name of the employees who report to him or her.    */


SELECT e.LastName as Employee, r.LastName as Manager
FROM Employees as e, Employees as r
WHERE e.ReportsTo = r.EmployeeId


/*  Find the name and ID of the artists who do not have albums.   */

SELECT Name, ArtistId
FROM Artists
WHERE ArtistId NOT IN (SELECT ArtistId 
                       FROM Albums) 


/*  Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order. */


SELECT FirstName, LastName
FROM Customers
UNION
SELECT FirstName, LastName
FROM Employees
ORDER BY LastName DESC


/* See if there are any customers who have a different city listed in their billing city versus their customer city.   */ 


SELECT FirstName, LastName 
From Customers INNER JOIN Invoices 
ON Customers.CustomerId= Invoices.CustomerId
WHERE Customers.City <> Invoices.BillingCity

