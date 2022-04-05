-- Username: huayy092
--Q1008 Write a query to compare the number of speeding tickets issued for the 3 months leading up to the 2018 March state election (Jan-March inclusive) vs the same tickets issued in the 3 months post election (Apr-Jun inclusive)
-- Example output
--offenceCode	offenceDescription						preElecCount	postElecCount
--A771	EXCEED DEFAULT SPEED IN BUILT UP AREA BY 10-19 KPH	322			314
--A772	EXCEED DEFAULT SPEED IN B.U.A. BY 20-29KPH			78			42

--Again, I use the same speeding definition I have defined in question 2 to 
--specify my search results, and the additional WHERE clauses in my joint query 
--can ensure the return records are within the periods of three months before the 
--state election or three months after the state election. Based on the sample 
--output, I think the use of a GROUP BY clause is the most appropriate to display 
--the results in the required format.
 
SELECT pre.expiationOffenceCode, 
	   pre.expiationOffenceLongDescription,
	   pre.precount AS preElecCount, 
	   post.postcount AS postElecCount
FROM
	(SELECT expiationOffenceCode,
			expiationOffenceLongDescription,
			COUNT(expiationOffenceCode) AS precount
	 FROM Expiations
	 WHERE issueDate BETWEEN '2018-01-01' AND '2018-03-31'
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
	 WHERE issueDate BETWEEN '2018-04-01' AND '2018-06-30'
		   AND (expiationOffenceLongDescription LIKE '%EXCEED%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%EXCESSIVE%SPEED%'
		   OR expiationOffenceLongDescription LIKE '%BUS%EXCEED%'
		   OR expiationOffenceLongDescription LIKE '%VEHICLE%EXCEED%')
	 GROUP BY expiationOffenceCode,
			  expiationOffenceLongDescription) AS post
ON pre.expiationOffenceCode = post.expiationOffenceCode;
