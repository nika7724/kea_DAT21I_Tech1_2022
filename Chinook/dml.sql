#1
SELECT COUNT(*) AS Name
FROM playlist
LEFT JOIN playlisttrack p on playlist.PlaylistId = p.PlaylistId
WHERE Name = 'Grunge'
;
#2
SELECT *
FROM artist
WHERE Name LIKE '%John%'
AND Name NOT LIKE '%Martin%'
OR Name LIKE '%Jack%'
ORDER BY Name
;

#3
SELECT SUM(Total) AS Total_invoice, BillingCountry
FROM invoice
GROUP BY BillingCountry
HAVING Total_invoice >= 100
ORDER BY Total_invoice DESC
;
#4
SELECT DISTINCT employee.Phone, employee.FirstName, employee.LastName, ReportsTo
FROM track
JOIN mediatype ON track.MediaTypeId = mediatype.MediaTypeId
JOIN invoiceline ON track.TrackId = invoiceline.TrackId
JOIN invoice ON invoiceline.InvoiceId = invoice.InvoiceId
JOIN customer ON invoice.CustomerId = customer.CustomerId
JOIN employee on customer.SupportRepId = employee.EmployeeId
WHERE Composer = 'Miles Davis'
AND mediatype.Name = 'MPEG Audio File'
;

#5
SELECT DISTINCT GenreId, Title
From track
INNER JOIN album ON track.AlbumId = album.AlbumId
WHERE GenreId = 11
  AND Title = 'Samba%';

#6
SELECT track.Name AS "Genre", Milliseconds AS Minutes
FROM genre
INNER JOIN track ON genre.GenreId = track.GenreId
WHERE Milliseconds > 1800000 / 1000
ORDER BY Minutes
;

#7
SELECT COUNT(Company)
FROM customer
WHERE State IS NULL
AND Company IS NOT NULL
;

#8
SELECT CONCAT(employee.LastName, ' ', employee.FirstName) AS Employees, COUNT(SupportRepId) AS Clients
FROM employee
JOIN customer ON employee.EmployeeId = customer.SupportRepId
WHERE customer.Country IN ('USA', 'Canada', 'Mexico')
AND SupportRepId >= 6
;


#9
SELECT Country, CONCAT(LastName, ', ', FirstName) AS Name, IFNULL(Fax, 'S/he has no fax') AS Fax
FROM customer
WHERE Country = 'USA'
ORDER BY Name
;

#10
SELECT FirstName, LastName, (YEAR(HireDate) - YEAR(BirthDate)) AS age
FROM employee
ORDER BY FirstName, LastName