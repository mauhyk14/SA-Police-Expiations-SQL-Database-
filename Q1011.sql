-- Username: huayy092
--Q1011 BONUS QUESTION.  Using 2016 and 2017 data, determine which month(s) had the most number of motorists caught speeding


SELECT DATENAME(M, Expiations.incidentStartDate)AS Month, 
	   COUNT(*) AS Number_Of_Speeding_Motorists
FROM Expiations
WHERE (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
       OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
	   OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
	   OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
       AND 
	   (Expiations.incidentStartDate LIKE '2016%' 
       OR Expiations.incidentStartDate LIKE '2017%')
GROUP BY DATENAME(M, Expiations.incidentStartDate)
HAVING COUNT(*) = (
					SELECT MAX(source_table.numbercount) FROM (
						   SELECT COUNT(*) AS numbercount FROM Expiations
						   WHERE (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
								   OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
								   OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
								   OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
								   AND 
								 (Expiations.incidentStartDate LIKE '2016%' 
								  OR Expiations.incidentStartDate LIKE '2017%')
							GROUP BY DATENAME(M, Expiations.incidentStartDate)) AS source_table);  
