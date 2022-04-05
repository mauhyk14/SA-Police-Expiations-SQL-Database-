-- Username: huayy092
--Q1005 calculate the number of mobile/fixed speeding tickets withdrawn for each withdrawal reason
-- Example output:
-- photoRejectedReasonCode	photoRejectedReasonDesc			withdrawnTicketCount
--			80				VEHICLE NOT VISIBLE IN PHOTOGRAPH B	2521

--Based on the observation I have done on the database, I have noticed that 
--if an offence has a photo rejection code, it automatically falls into the 
--withdrawan category. This query can calculate the number of issued tickets for 
--each withdrawal reason by grouping every withdrawn offence according to its 
--photo rejection code.

SELECT photoRejectedReasonCode, 
	   photoRejectedReasonDesc, 
	   COUNT (photoRejectedReasonCode) AS withdrawnTicketCount
FROM Expiations
WHERE photoRejectedReasonCode <> ''
GROUP BY photoRejectedReasonCode, 
	     photoRejectedReasonDesc
ORDER BY photoRejectedReasonCode;
