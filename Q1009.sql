-- Username: huayy092
--Q1009 Write a query to compare the number of speeding tickets issued for the past 5 months post 2018 March state election (Apr-Aug inclusive) vs the same tickets issued in the same 5 months of 2017
-- Example output:
--offenceCode		offenceDescription				preElecCount	postElecCount
--A001			EXCEED SIGNED SPEED BY 1 TO 9KPH		5039		2454
--A002			EXCEED SIGNED SPEED BY 10 - 19 KPH		11123		6306

--I apply a similar thinking process as question 8 when constructing 
--my query to solve this problem. Please refer to the previous question for an 
--explanation. 

SELECT pre.expiationOffenceCode, 
	   pre.expiationOffenceLongDescription,
	   pre.precount AS preElecCount, 
	   post.postcount AS postElecCount
FROM
	(SELECT expiationOffenceCode,
			expiationOffenceLongDescription,
			COUNT(expiationOffenceCode) AS precount
	 FROM Expiations
	 WHERE issueDate BETWEEN '2017-04-01' AND '2017-08-31'
		   AND (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
		   OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
	 GROUP BY expiationOffenceCode,
			  expiationOffenceLongDescription) As pre
LEFT OUTER JOIN
	(SELECT expiationOffenceCode,
			expiationOffenceLongDescription, 
			COUNT(expiationOffenceCode) AS postcount
	 FROM Expiations
	 WHERE issueDate BETWEEN '2018-04-01' AND '2018-08-31'
		   AND (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
		   OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
	 GROUP BY expiationOffenceCode,
			  expiationOffenceLongDescription) AS post
ON pre.expiationOffenceCode = post.expiationOffenceCode;