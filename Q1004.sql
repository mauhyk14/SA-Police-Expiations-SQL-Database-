-- Username: huayy092
--Q1004 find the highest total fine paid of all expiations, the date it was paid and the offence (code and description) it was for.
-- Example output:
-- penaltyAmount	issueDate	offenceCode	expiationDescription
-- 8120		2016-10-30	D821		OWNER MUST NOT USE/PERMIT USE - VEH IS NOT EQUIP  PER ADG CODE - BODY CORPORATE

--The MAX subquery ensures the query to execute in the most 
--efficient way to find the highest total fine and the additional 
--WHERE conditions also make sure the penalty was issued instead of withdrawn. 

SELECT offencePenaltyAmt AS penaltyAmount,
	   issueDate,
	   expiationOffenceCode AS offenceCode,
	   expiationOffenceLongDescription AS expiationDescription		
FROM   Expiations
WHERE  offencePenaltyAmt = (SELECT MAX(offencePenaltyAmt) 
						    FROM Expiations)
	   AND withdrawnReasonDesc = '';

