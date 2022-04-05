# SA-Police-Expiations-SQL-Database-
Database Fundamentals Assignment 2
Instructions:
1.	Download the Expiation database from the Assignments tab of the course website and attach it to your SQL Server (as per practicals)

2.	There is no UML diagram of the database as the data is presented in an un-normalized form in a single table.  You will need to look through the column titles and some of the data to determine the significance of each column in the table.  You can also visit the Data SA website for further detail about the data sets: https://data.sa.gov.au/data/dataset/expiation-notice-system-data  

3.	You are not allowed to use Views, Stored Procedures or any SQL that contains Data Definition Language (CREATE, ALTER, DROP, ENABLE, DISABLE etc…).  These are deactivated on the test SQL Server.  Sorry!

4.	Use the expiation database to write queries to answer the questions below and paste your final SQL query into the corresponding .SQL file along with your username.  It is recommended that you write your queries to run as efficiently as possible.  Slow queries will cost marks!  If required, include any assumptions you make about the data as a comment in your .SQL file.  It is recommended you try to answer each question using at least two different approaches to double check you are happy with your result output.  Then choose the fastest query as your final answer.  Once you have completed all your files, upload them to the learn-online assignment submission area.

Questions
Note: The example outputs do not indicate the number of rows or the exact values you should expect to see from your answers.  They are indicative of the layout only.  It is up to you to test your responses using the different query approaches discussed throughout the semester and use this to decide if you have written a query correctly!

--Q1001 count the number of different fixed and mobile speed camera locations in SA
-- Example output
-- fixedCameraCount	mobileCameraLocationCount
-- 196			1739


--Q1002 List the different (unique) expiation offence codes and their relative description and the count of tickets issued for all speeding offences that took place in SA in 2018
-- Example output: 
-- offenceCode	offenceDescription			ticketCount
-- A001		EXCEED SIGNED SPEED BY 1 TO 9KPH	5376


--Q1003 List the types of expiations (code and description) handed out in 2018 that applied to a single motorist
-- Example output:
-- expiationOffenceCode	ticketCount	expiationOffenceLongDescription
-- A268				1	CONTRAVENE DO NOT O/TAKE TURNING VEH SIGN (LEFT)


--Q1004 find the highest total fine paid of all expiations, the date it was paid and the offence (code and description) it was for.
-- Example output:
-- penaltyAmount	issueDate	offenceCode	expiationDescription
-- 8120		2016-10-30	D821		OWNER MUST NOT USE/PERMIT USE - VEH IS NOT EQUIP  PER ADG CODE - BODY CORPORATE


--Q1005 calculate the number of mobile/fixed speeding tickets withdrawn for each withdrawal reason
-- Example output:
-- photoRejectedReasonCode	photoRejectedReasonDesc			withdrawnTicketCount
80			VEHICLE NOT VISIBLE IN PHOTOGRAPH B	2521


--Q1006 count the number of actual expiations vs withdrawn/invalid/rejected expiations for 2018
-- Example output:
-- actualTickets	withDrawnTickets
--  100,000,000		200,333


--Q1007 Find the number of known expiations in 2018 for each of the different registration states recorded in the database.  Order the results from highest to lowest expiation count.
-- Example output:
-- regStateDescExpiationVehicle	expiationCount
SOUTH AUSTRALIA		    266,818


--Q1008 Write a query to compare the number of speeding tickets issued for the 3 months leading up to the 2018 March state election (Jan-March inclusive) vs the same tickets issued in the 3 months post election (Apr-Jun inclusive)
-- Example output
offenceCode	offenceDescription					preElecCount	postElecCount
A771	EXCEED DEFAULT SPEED IN BUILT UP AREA BY 10-19 KPH	322		314
A772	EXCEED DEFAULT SPEED IN B.U.A. BY 20-29KPH		78		42


--Q1009 Write a query to compare the number of speeding tickets issued for the past 5 months post 2018 March state election (Apr-Aug inclusive) vs the same tickets issued in the same 5 months of 2017
-- Example output:
offenceCode		offenceDescription				preElecCount	postElecCount
A001			EXCEED SIGNED SPEED BY 1 TO 9KPH		5039		2454
A002			EXCEED SIGNED SPEED BY 10 - 19 KPH		11123		6306


--Q1010 calculate the average number of low range (up to 9kph) speeding tickets issued per day for 2017 vs 2018
-- example output:
-- ticketCount2017	TicketCount2018
57			20


Bonus Questions
These are not necessary to achieve 100% but are worth bonus marks (5% each).  
--Q1011 Using 2016 and 2017 data, determine which month(s) had the most number of motorists caught speeding


--Q1012 find the most common infringement(s) dished out, the year, avg fine paid and the offence (code and description) 

