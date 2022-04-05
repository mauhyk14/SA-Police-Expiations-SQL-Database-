-- Username: huayy092
--Q1003 List the types of expiations (code and description) handed out in 2018 that applied to a single motorist
-- Example output:
-- expiationOffenceCode	ticketCount	expiationOffenceLongDescription
-- A268				1	CONTRAVENE DO NOT O/TAKE TURNING VEH SIGN (LEFT)

--This question is quite straightforward, the query groups every offence 
--based on the offence code with the number of issued ticket being 1 as a condition.

SELECT expiationOffenceCode, 
	   COUNT(expiationOffenceCode) AS ticketCount,
	   expiationOffenceLongDescription
FROM   Expiations
WHERE  DATEPART (YYYY,issueDate) = 2018
GROUP BY expiationOffenceCode,
		 expiationOffenceLongDescription
HAVING COUNT(expiationOffenceCode) = 1
ORDER BY expiationOffenceCode;