-- Username: huayy092
--Q1007 Find the number of known expiations in 2018 for each of the different registration states recorded in the database.  Order the results from highest to lowest expiation count.
-- Example output:
-- regStateDescExpiationVehicle	expiationCount
--		SOUTH AUSTRALIA		    266,818

--To ensure the answers accurately represent all states in Australia, 
--I add a WHERE clause to the query to filter out the return results 
--which do not belong to an Australian state. 

SELECT regStateDescExpiationVehicle, 
	   COUNT(regStateDescExpiationVehicle) AS expiationCount
FROM   Expiations
WHERE  DATEPART (YY,issueDate) = 2018 
	   AND regStateDescExpiationVehicle 
	   NOT IN ('OTHER',
			   'UNKNOWN', 
			   'DESCRIPTION UNKNOWN')
GROUP BY regStateDescExpiationVehicle
ORDER BY COUNT(regStateDescExpiationVehicle) DESC;