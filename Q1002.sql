-- Username: huayy092
--Q1002 List the different (unique) expiation offence codes and their relative description and the count of tickets issued for all speeding offences that took place in SA in 2018
-- Example output: 
-- offenceCode	offenceDescription			ticketCount
-- A001		EXCEED SIGNED SPEED BY 1 TO 9KPH	5376

--One critical feature of a speeding ticket is the keyword “EXCEED” or "SPEED" 
--appears on the offence description. When constructing my query, 
--I deliberately put this condition in the WHERE clause to ensure the captured 
--results reflected all speeding-related offences. 

SELECT expiationOffenceCode,
	   expiationOffenceLongDescription,
	   COUNT(expiationOffenceCode) AS ticketCount
FROM   Expiations
WHERE  DATEPART (YY,issueDate) = 2018 
	   AND (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
	    OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
		OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
		OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
GROUP BY expiationOffenceCode, 
	     expiationOffenceLongDescription
ORDER BY expiationOffenceCode; 
