------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;



CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
    
  
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
                            
-----------------------------------------Query-1------------------------------------------------------
----To retrieve all employees whose address is in Elgin,IL                         
SELECT * FROM EMPLOYEES;
SELECT F_NAME , ADDRESS 
					FROM EMPLOYEES 
					WHERE ADDRESS LIKE '%Elgin,IL';

-----------------------------------------Query-2------------------------------------------------------
----To retrieve all employees who were born during the 1970's
SELECT F_NAME, L_NAME, B_DATE 
					FROM EMPLOYEES
					WHERE B_DATE LIKE '197%';


-----------------------------------------Query-3------------------------------------------------------
----Retrieve all employees in department 5 whose salary is between 60000 and 70000 (inclusive of both the numbers)
SELECT * FROM EMPLOYEES
					WHERE SALARY BETWEEN 60000 AND 70000;
----for department 2
SELECT * FROM EMPLOYEES
					WHERE SALARY BETWEEN 60000 AND 70000 AND DEP_ID = 2;
					
-----------------------------------------Query-4-A------------------------------------------------------
----Retrieve a list of employees ordered by department ID.
SELECT * FROM EMPLOYEES 
					ORDER BY DEP_ID;
					
SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES
				ORDER BY 3;
				
SELECT F_NAME, JOB_ID, DEP_ID FROM EMPLOYEES
					ORDER BY DEP_ID DESC;

-----------------------------------------Query-4-B------------------------------------------------------
----Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name
SELECT * FROM EMPLOYEES
				ORDER BY DEP_ID, L_NAME DESC;

SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES
				ORDER BY DEP_ID, L_NAME DESC ;
				


-----------------------------------------Query-5-A------------------------------------------------------
----For each department ID retrieve the number of employees in the department

SELECT DEP_ID , COUNT(DEP_ID) AS COUNT FROM EMPLOYEES
				GROUP BY DEP_ID;

SELECT DEP_ID, COUNT
				FROM (SELECT DEP_ID, COUNT(DEP_ID) AS COUNT 
							FROM EMPLOYEES GROUP BY DEP_ID);
				
-----------------------------------------Query-5-B------------------------------------------------------
----For each department retrieve the number of employees in the department, and the average employees salary in the department.
SELECT DEP_ID, COUNT(*) AS COUNT , AVG(SALARY) AS AVERAGE_SALARY 
				FROM EMPLOYEES
				GROUP BY DEP_ID; 

-----------------------------------------Query-5-C------------------------------------------------------
----Label the computed columns in the result set of Query 5B as “NUM_EMPLOYEES” and “AVG_SALARY”

SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES , AVG(SALARY) AS AVG_SALARY 
				FROM EMPLOYEES
				GROUP BY DEP_ID; 

--using label
SELECT DEP_ID, NUM_EMPLOYEES, AVG_SALARY
				FROM (SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY 
							FROM EMPLOYEES GROUP BY DEP_ID);


-----------------------------------------Query-5-D------------------------------------------------------
----In Query 5C order the result set by Average Salary
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES , AVG(SALARY) AS AVG_SALARY 
				FROM EMPLOYEES
				GROUP BY DEP_ID
				ORDER BY AVG_SALARY;
				
--Using label, OR using in FROM clause
SELECT DEP_ID, NUM_EMPLOYEES, AVG_SALARY
				FROM (SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY 
																			FROM EMPLOYEES GROUP BY DEP_ID  ORDER BY AVG_SALARY); 
 
------------------------------------------Query-5-E------------------------------------------------------
----In Query 5D limit the result to departments with fewer than 4 employees(GROUP BY & HAVING GO TOGETHER)
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES , AVG(SALARY) AS AVG_SALARY 
				FROM EMPLOYEES
				GROUP BY DEP_ID
				HAVING COUNT(*) < 4
				ORDER BY AVG_SALARY;
--Using LABEL
SELECT DEP_ID, NUM_EMPLOYEES, AVG_SALARY
				FROM (SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DEP_ID)
				WHERE NUM_EMPLOYEES < 4;

-----------------------------------------BONUS - Query-6------------------------------------------------------
----Similar to 4B but instead of department ID use department name. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME 
				FROM EMPLOYEES E, DEPARTMENTS D
				WHERE E.DEP_ID = D.DEP_ID_DEP
				ORDER BY D.DEP_NAME, E.L_NAME DESC;
				

--Miscellaneous
SELECT * FROM JOB_HISTORY;
------EMPL_ID-----START_DATE----JOBS_ID-----DEPT_ID
------E1001	            2000-08-01	             100	               2
       
--Using LIKE
SELECT EMPL_ID, START_DATE FROM JOB_HISTORY WHERE START_DATE LIKE '%08%' ;       
SELECT * FROM JOB_HISTORY WHERE JOBS_ID LIKE '%6%'  ORDER BY JOBS_ID DESC; 

--Using BETWEEN AND
SELECT EMPL_ID, JOBS_ID FROM JOB_HISTORY WHERE JOBS_ID BETWEEN '200' AND '400';

--Using FROM Clause, retreive number of employees department wise         
SELECT DEPT_ID, COUNT
 	FROM (SELECT DEPT_ID, COUNT(DEPT_ID) AS COUNT 
 				FROM JOB_HISTORY GROUP BY DEPT_ID HAVING COUNT < 4);
 				
------------------------------------SUBQUERIES AND NESTED SELECT-----------------------------------------------

--AGGREGATE frunctions cannot always be evaluated in the WHERE clause.
--We can make use of a sub-select expression after WHERE clause

SELECT EMP_ID, F_NAME, L_NAME, SALARY 
									FROM EMPLOYEES
									WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES); 

--Using Coloumn Expressions
SELECT EMP_ID, F_NAME, (SELECT AVG(SALARY) AS AVERAGE_SALARY FROM EMPLOYEES) FROM EMPLOYEES;

--Using Table Expressions or Derived Expressions(part of FROM clause)
SELECT * FROM (SELECT EMP_ID, F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ) AS CONFIDENTIAL_DETAILS;
       
-------------------------------WORKING WITH MULTIPLE TABLES---------------------------------------------------------
-------------------Using Subquery
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;                            
--Subquery to retreive EMPLOYEE details of those employees whose department id  exists in DEPARTMENT table 
SELECT * FROM EMPLOYEES 
				WHERE DEP_ID IN
				(SELECT DEPT_ID_DEP FROM DEPARTMENTS);

--Subquery to retreive Location Id also along with above query
SELECT * FROM EMPLOYEES 
				WHERE DEP_ID IN
				(SELECT DEPT_ID_DEP FROM DEPARTMENTS
				WHERE LOC_ID = 'L0002');

--Subquery to retrieve the department ID and department name for employees who earn more than $70,000
SELECT DEPT_ID_DEP, DEP_NAME
				FROM DEPARTMENTS
				WHERE DEPT_ID_DEP IN
				(SELECT DEP_ID FROM EMPLOYEES
				WHERE SALARY > 7000);


----------------Implicit Join---------
--Full Join or Cartesian Join
SELECT * FROM EMPLOYEES, DEPARTMENTS;

--To restrict the result set to only rows with matching department ID
SELECT * FROM EMPLOYEES, DEPARTMENTS
			WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;

--Using aliases
SELECT * FROM EMPLOYEES E, DEPARTMENTS D
			WHERE E.DEP_ID = D.DEPT_ID_DEP;

--To see the DEPSRTMENT NAME for each EMPLOYEE 
SELECT EMPLOYEES.EMP_ID, DEPARTMENTS.DEP_NAME
			FROM EMPLOYEES, DEPARTMENTS
			WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;  

--Using Aliases
SELECT E.EMP_ID, D.DEP_NAME
			FROM EMPLOYEES E, DEPARTMENTS D
			WHERE E.DEP_ID = D.DEPT_ID_DEP; 

--to find the average salary from employees and name from department
Select d.DEP_NAME , (select CAST(AVG(salary) as decimal(10,0)) from employees e where e.DEP_ID = d.DEPT_ID_DEP ) as Avg_Sal from departments d;

--This will return the 0 decimal value and if you want it to be a 2 decimal then change the value 0 to 2

Select d.DEP_NAME , (select CAST(AVG(salary) as decimal(10,2)) from employees e where e.DEP_ID = d.DEPT_ID_DEP ) as Avg_Sal from departments d;

----------------------------------------------WORKING WITH JOIN OPERATOR-------------------------------------------------
SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;

---------------------------Query-1-A---Using INNER JOIN(2 TABLES)-------------
--Select the names and job start dates of all employees who work for the department number 5.

SELECT E.F_NAME, E.L_NAME, E.DEP_ID,
				J.START_DATE 
				FROM EMPLOYEES E INNER JOIN JOB_HISTORY J
				ON  E.EMP_ID = J.EMPL_ID
				WHERE E.DEP_ID = 5;

---------------------------Query-1-B----Using INNER JOIN(3 TABLES)-------------
--Select the names, job start dates, and job titles of all employees who work for the department number 5.			

SELECT E.F_NAME, E.L_NAME, E.DEP_ID,
				JH.START_DATE, JS.JOB_TITLE
				FROM EMPLOYEES E 
							INNER JOIN JOB_HISTORY JH 	ON E.EMP_ID = JH.EMPL_ID
							INNER JOIN JOBS JS ON E.JOB_ID = JS.JOB_IDENT
							WHERE E.DEP_ID = 5;

-------------------------Query-2-A----Using LEFT OUTER JOIN 
--Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees

SELECT E.EMP_ID, E.F_NAME, E.L_NAME, E.DEP_ID,
				D.DEP_NAME
				FROM EMPLOYEES E LEFT OUTER JOIN  DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP;
				
-------------------------Query-2-B----Using LEFT OUTER JOIN
--Re-write the query for 2A to limit the result set to include only the rows for employees born before 1980.
				
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, E.DEP_ID, E.B_DATE,
				D.DEP_NAME
				FROM EMPLOYEES E LEFT OUTER JOIN  DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP
				WHERE YEAR(E.B_DATE)  < 1980;

-------------------------Query-2-C----Using LEFT OUTER JOIN
--Re-write the query for 2A to have the result set include all the employees but department names for only the employees who were born before 1980.		
 	
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, E.DEP_ID, E.B_DATE,
				D.DEP_NAME
				FROM EMPLOYEES E LEFT OUTER JOIN  DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP
				AND YEAR(E.B_DATE) < 1980;
				
-------------------------Query-3-A----Using FULL OUTER JOIN
--Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.

SELECT E.F_NAME, E.L_NAME,
				D.DEP_NAME
				FROM EMPLOYEES E FULL JOIN DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP;

-------------------------Query-3-B----Using FULL OUTER JOIN				
--Re-write Query 3A to have the result set include all employee names but department id and department names only for male employees.
--METHOD -1(Using FULL OUTER JOIN)
SELECT E.F_NAME, E.L_NAME, E.SEX,
				D.DEP_NAME
				FROM EMPLOYEES E FULL JOIN DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP
				WHERE E.SEX = 'M';

--METHOD-2(Using LEFT OUTER JOIN)
SELECT E.F_NAME, E.L_NAME, E.SEX,
				D.DEP_NAME
				FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
				ON E.DEP_ID = D.DEPT_ID_DEP
				AND E.SEX = 'M';