
--1
SELECT e1.manager_ID, e1.first_name, e1.last_name, COUNT (employee_ID) AS cnt
FROM employees e1, employees e2
GROUP BY e1.manager_ID, e1.first_name, e1.last_name
HAVING COUNT (employee_ID) > 6;


--2
--vers1
SELECT DISTINCT emp.Depatment_ID, dep.Department_Name
	MIN(emp.Salary-(emp.Salary*emp.commission_pct)) OVER(PARTITION BY emp.Department_ID) AS MinSalary
	MAX(emp.Salary-(emp.Salary*emp.commission_pct)) OVER(PARTITION BY emp.Department_ID) AS MaxSalary
FROM Employees emp
JOIN Departments dep ON emp.Department_ID = dep.Department_ID

--vers2

SELECT DISTINCT emp.Depatment_ID, dep.Department_Name
	MIN(SalaryWithoutComiss) OVER(PARTITION BY emp.Department_ID) AS MinSalary
	MAX(SalaryWithoutComiss) OVER(PARTITION BY emp.Department_ID) AS MaxSalary
FROM
	(SELECT Depatment_ID, emp.Salary-(emp.Salary*emp.commission_pct) AS SalaryWithoutComiss
			FROM Employees) table1
    
--3
SELECT Region_Name,  MAX(cnt) 
	FROM 
	(SELECT dep.Department ID, Lokations ID,
	        COUNT (employeed_ID) OVER (PARTITION BY dep.Department ID) AS cnt 
	FROM Empolyees emp
	JOIN Departments dep ON emp.Department ID =dep.Department ID 
	) t1
JOIN Loñations loñ ON loñ.Loñations ID =t1.Loñations ID
JOIN Countries c ON  loñ.Countriy ID =c.Countriy ID
JOIN Regions reg ON c.Region ID =reg.Region ID
GROUP BY Region_Name


--4

SELECT Department_Name, avgSalaryDep, avgSalaryTotal, 
	  avgSalaryDep/avgSalaryTotal*100 AS DiffSalary
FROM
    (
	SELECT Department_Name,
		AVG(Salary) OVER (PARTITION BY dep.Department ID) AS avgSalaryDep,
		AVG(Salary) OVER () AS avgSalaryTotal	
    FROM Departments dep
    JOIN Empolyees emp ON emp.Department ID = dep.Department ID
	) t1 


--5 
SELECT first_name, last_name, COUNT (job.Department ID)
FROM Job_History his
JOIN Empolyees emp ON emp.Empolyees ID = his.Empolyees ID
GROUP BY first_name, last_name
HAVING COUNT (Department ID) =1 AND YEAR(GETDATE())-YEAR(Start-Date)>=10;

--6
SELECT first_name, last_name, RankSalary
FROM	
	(
	SELECT first_name, last_name,
		RANK() OVER (ORDER BY Salary DESC) AS RankSalary
	FROM Employees
	)t
WHERE RankSalary BETWEEN 5 AND 10;
