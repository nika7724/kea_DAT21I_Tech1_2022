#1
SELECT *
FROM tmember
WHERE cName LIKE 'Jens S.%'
AND dBirth <= ('1969-12-31')
AND YEAR(dNewMember) = 2013
;

#2
SELECT *
FROM tbook
WHERE nPublishingCompanyID NOT IN (15, 32)
OR NOT nPublishingYear > 2000
ORDER BY nPublishingCompanyID
;

#3
SELECT cName, cSurname, cPhoneNo, cAddress
FROM tmember
WHERE cPhoneNo  LIKE '%'
AND cAddress IS NULL
;

#4
SELECT cSurname, cName
FROM tauthor
WHERE cSurname = 'Byatt'
AND cName LIKE 'A%S%'
;

#5
SELECT nBookID
FROM tbook
WHERE nPublishingYear = 2007
AND nPublishingCompanyID = 32
;

#6
SELECT nBookID
FROM tbookcopy tb
JOIN tloan t on tb.cSignature = t.cSignature
WHERE cCPR = '0305393207'
AND YEAR(dloan) = '2014' /*BETWEEN '2014-01-01' AND '2014-12-31*/
;

#7
SELECT tmember.*, dLoan
FROM tmember
JOIN tloan on tmember.cCPR = tloan.cCPR
WHERE tloan.cCPR >= 1
AND dLoan BETWEEN '2014-01-01' AND '2014-12-31'
ORDER BY cCPR
;

#8
SELECT *
FROM tmember
ORDER BY dNewMember ASC, cSurname, cName
;

#9
SELECT cTitle, cName
FROM tbooktheme
JOIN tbook on tbooktheme.nBookID = tbook.nBookID
JOIN ttheme on tbooktheme.nThemeID = ttheme.nThemeID
WHERE nPublishingCompanyID = 32
;

#10
SELECT cName, cSurname, tauthorship.nBookID
FROM tauthorship
JOIN tauthor on tauthorship.nAuthorID = tauthor.nAuthorID
JOIN tbook on tauthorship.nBookID = tbook.nBookID
WHERE tauthorship.nBookID = tbook.nBookID
ORDER BY cName, cSurname
;

#11
SELECT cName, cSurname, cTitle, nPublishingYear
FROM tauthorship
JOIN tauthor on tauthorship.nAuthorID = tauthor.nAuthorID
JOIN tbook on tauthorship.nBookID = tbook.nBookID
ORDER BY nPublishingYear, cName, cSurname
;

#12
SELECT cTitle, cName, cSurname
FROM tbookcopy
JOIN tloan on tbookcopy.cSignature = tloan.cSignature
JOIN tbook on tbookcopy.nBookID = tbook.nBookID
JOIN tmember on tmember.cCPR = tloan.cCPR
ORDER BY cTitle
;

#13
#9
SELECT cTitle, cName
FROM tbooktheme
JOIN tbook on tbooktheme.nBookID = tbook.nBookID
JOIN ttheme on tbooktheme.nThemeID = ttheme.nThemeID
WHERE nPublishingCompanyID = 32
;

#10
SELECT cName, cSurname, tauthorship.nBookID
FROM tauthorship
JOIN tauthor on tauthorship.nAuthorID = tauthor.nAuthorID
JOIN tbook on tauthorship.nBookID = tbook.nBookID
WHERE tauthorship.nBookID = tbook.nBookID
ORDER BY cName, cSurname
;

#11
SELECT cName, cSurname, cTitle, nPublishingYear
FROM tauthorship
JOIN tauthor on tauthorship.nAuthorID = tauthor.nAuthorID
JOIN tbook on tauthorship.nBookID = tbook.nBookID
ORDER BY nPublishingYear, cName, cSurname
;

#12
SELECT cTitle, cName, cSurname
FROM tbookcopy
JOIN tloan on tbookcopy.cSignature = tloan.cSignature
JOIN tbook on tbookcopy.nBookID = tbook.nBookID
JOIN tmember on tmember.cCPR = tloan.cCPR
ORDER BY cTitle
;

#14
SELECT cTitle, cName AS "ThemeName"
FROM tbooktheme
RIGHT JOIN tbook on tbooktheme.nBookID = tbook.nBookID
JOIN ttheme on tbooktheme.nThemeID = ttheme.nThemeID
ORDER BY cName
;

#15
SELECT cName, cSurname, cTitle
FROM tloan
JOIN tbookcopy ON tloan.cSignature = tbookcopy.cSignature
JOIN tmember ON tloan.cCPR = tmember.cCPR
JOIN tbook ON tbookcopy.nBookID = tbook.nBookID
WHERE YEAR(dNewMember) = 2013
AND YEAR(dLoan) = 2013
OR YEAR(dloan) IS NULL
ORDER BY cSurname, cName
;

#16
SELECT tauthor.cName, cSurname, cTitle, tcountry.cName
FROM tauthor
LEFT JOIN tauthorship on tauthor.nAuthorID = tauthorship.nAuthorID
JOIN tnationality on tauthorship.nAuthorID = tnationality.nAuthorID
RIGHT JOIN tbook on tauthorship.nBookID = tbook.nBookID
JOIN tcountry ON tnationality.nCountryID = tcountry.nCountryID
ORDER BY tauthor.cName, cSurname
;

#17
SELECT cTitle, nPublishingYear
FROM tbook
WHERE nPublishingYear IN('1970', '1989')
GROUP BY cTitle
;

#18
SELECT tmember.cSurname, tmember.cName, dNewMember, tauthor.cName
FROM tloan
JOIN tmember on tloan.cCPR = tmember.cCPR
JOIN tbookcopy on tloan.cSignature = tbookcopy.cSignature
JOIN tauthorship on tbookcopy.nBookID = tauthorship.nBookID
JOIN tauthor on tauthor.nAuthorID = tauthorship.nAuthorID
WHERE YEAR(dNewMember) = '2013'
AND MONTH(dNewMember) = '12'
AND tauthor.cName = 'William'
;

#19
SELECT cName, cSurname, dNewMember
FROM tmember
WHERE dNewMember IN
(SELECT MIN(dNewMember)
    FROM tmember)
;

#20 ---I couldn't figure out how to use subqueries with this question
SELECT cTitle, nPublishingYear, CONCAT(tauthor.cName, ' ', tauthor.cSurname) AS 'Name', tnationality.nCountryID, tpublishingcompany.cName, tpublishingcompany.nCountryID
FROM tbook JOIN tpublishingcompany on tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
JOIN tnationality on tpublishingcompany.nCountryID = tnationality.nCountryID
JOIN tauthor on tauthor.nAuthorID = tnationality.nAuthorID
WHERE tnationality.nCountryID = tpublishingcompany.nCountryID
GROUP BY Name
;

#21
SELECT tpublishingcompany.cName AS 'Name', tcountry.cName AS 'Country'
FROM tpublishingcompany
JOIN tcountry ON tpublishingcompany.nCountryID = tcountry.nCountryID
ORDER BY tpublishingcompany.cName
;

#22
SELECT cTitle, nPublishingYear
FROM tbook
JOIN tpublishingcompany on tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
WHERE nPublishingYear BETWEEN '1926' AND '1978'
AND tbook.nPublishingCompanyID != '32'
ORDER BY nPublishingYear
;

#23
SELECT cName, cSurname, cAddress, dNewMember
FROM tmember
WHERE dNewMember >= '2016-1-1'
AND cAddress IS NULL
;

#24
SELECT DISTINCT nCountryID, cName
FROM tpublishingcompany
ORDER BY nCountryID
;

#25
SELECT cTitle, cName
FROM tbook
JOIN tpublishingcompany ON tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
WHERE cTitle LIKE 'The Tale%'
AND cName NOT LIKE 'Lynch Inc%'
;

#26
SELECT DISTINCT ttheme.cName, tpublishingcompany.cName
FROM tbook
JOIN tbooktheme ON tbook.nBookID = tbooktheme.nBookID
JOIN tpublishingcompany ON tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
JOIN ttheme ON tbooktheme.nThemeID = ttheme.nThemeID
WHERE tpublishingcompany.cName = 'Lynch Inc'
;

#27
SELECT cTitle, dLoan
FROM tbookcopy
JOIN tloan ON tbookcopy.cSignature = tloan.cSignature
JOIN tbook ON tbookcopy.nBookID = tbook.nBookID
WHERE tbookcopy.cSignature != tloan.cSignature
;

#28
SELECT tpublishingcompany.cName, COUNT(tbook.cTitle) AS 'No of books'
FROM tpublishingcompany
JOIN tbook on tpublishingcompany.nPublishingCompanyID = tbook.nPublishingCompanyID
GROUP BY tpublishingcompany.cName
ORDER BY tpublishingcompany.cName
;

#29
SELECT COUNT(tloan.cCPR) AS 'No of Members'
FROM tmember
JOIN tloan on tmember.cCPR = tloan.cCPR
WHERE YEAR(dLoan) = '2013'
;

#30
SELECT cTitle, COUNT(tauthorship.nAuthorID) AS 'number of authors'
FROM tbook JOIN tauthorship ON tbook.nBookID = tauthorship.nBookID
JOIN tauthor ON tauthorship.nAuthorID = tauthor.nAuthorID
GROUP BY tauthorship.nAuthorID
HAVING `number of authors` >= 2
;



