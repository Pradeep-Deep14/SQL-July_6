CREATE TABLE hospital (
 emp_id INT,
 action VARCHAR(10),
 time TIMESTAMP
);

INSERT INTO hospital (emp_id, action, time) VALUES
 (1, 'in', '2019-12-22 09:00:00'),
 (1, 'out', '2019-12-22 09:15:00'),
 (2, 'in', '2019-12-22 09:00:00'),
 (2, 'out', '2019-12-22 09:15:00'),
 (2, 'in', '2019-12-22 09:30:00'),
 (3, 'out', '2019-12-22 09:00:00'),
 (3, 'in', '2019-12-22 09:15:00'),
 (3, 'out', '2019-12-22 09:30:00'),
 (3, 'in', '2019-12-22 09:45:00'),
 (4, 'in', '2019-12-22 09:45:00'),
 (5, 'out', '2019-12-22 09:40:00'); 


SELECT * FROM HOSPITAL



--Question: "Write the SQL query to find the total number of people present inside the hospital."--

-- SOLUTION 1 PDF --
--LATEST TIME IN IS GREATER THAN LATEST OUT TIME--
--This Means the Employee is inside--

WITH CTE AS
(
	SELECT EMP_ID,
		MAX(CASE WHEN ACTION='in'THEN TIME END) AS IN_TIME,
		MAX(CASE WHEN ACTION='out'THEN TIME END) AS OUT_TIME
	FROM HOSPITAL
	GROUP BY EMP_ID
)

SELECT * FROM CTE 
WHERE 
IN_TIME > OUT_TIME
OR OUT_TIME IS NULL
ORDER BY EMP_ID



