-- Username: huayy092
--Q1006 count the number of actual expiations vs withdrawn/invalid/rejected expiations for 2018
-- Example output:
-- actualTickets	withDrawnTickets
--  100,000,000		200,333

--Any offence which is not in the category of withdrawn, invalid or rejected 
--can be considered as an actual offence. Hence, we can use the number of total 
--ticket count minus the ticket count from the invalided group to calculate the 
--number of actual expirations. 

SELECT (COUNT(*)-
	   (SELECT COUNT(noticeStatusDesc) 
	    FROM Expiations 
	    WHERE noticeStatusDesc 
	    IN('WITHDRAWN', 
			'INVALID', 
			'REJECTED PHOTOGRAPH'))) AS actualTickets, 
	   (SELECT COUNT(noticeStatusDesc) 
		FROM   Expiations 
		WHERE  noticeStatusDesc 
		LIKE'WITHDRA%') AS withDrawnTickets
FROM   Expiations;