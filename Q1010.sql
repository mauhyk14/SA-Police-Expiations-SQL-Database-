-- Username: huayy092
--Q1010 calculate the average number of low range (up to 9kph) speeding tickets issued per day for 2017 vs 2018
-- example output:
-- ticketCount2017	TicketCount2018
--	57				20

--The focus of this question is the year when the speeding offence is committed. Hence, 
--I create two variables to sum up the total speeding count in both the years of 
--2017 and 2018. The added WHERE clauses can filter out the results which are not 
--in the category of low range speeding as well as not in the year of 2017 or 2018. 
--Since we are only interested in one aspect of the table (the year), the application 
--of CASE WHEN statements have proven to be the fastest query.

DECLARE @count2017 INT = 0;
DECLARE @count2018 INT = 0;

SELECT SUM(CASE 
		   WHEN DATEPART (YY,issueDate) = 2017 THEN @count2017 + 1 
		   END)/365 AS ticketCount2017,
	   SUM(CASE 
		   WHEN DATEPART (YY,issueDate) = 2018 THEN @count2018 + 1 
		   END)/365 AS ticketCount2018
FROM Expiations
WHERE (vehicleSpeed - expiationZoneSpeedLimit) <= 9
	  AND (vehicleSpeed - expiationZoneSpeedLimit) > 0
	  AND (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
	  OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
	  OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
	  OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%');