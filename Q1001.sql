-- Username: huayy092
--Q1001 count the number of different fixed and mobile speed camera locations in SA
-- Example output
-- fixedCameraCount	mobileCameraLocationCount
-- 196			1739


SELECT COUNT(DISTINCT fixedCameraLocnCode) AS fixedCameraCount,
	   COUNT(DISTINCT locationCodeMobileSpeedCamera) AS mobileCameraLocationCount
FROM   Expiations;


