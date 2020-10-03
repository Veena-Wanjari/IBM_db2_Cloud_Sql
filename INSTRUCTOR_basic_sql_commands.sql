
---DROP table if it already exists
DROP TABLE INSTRUCTOR;

--TASK-1-Create table
CREATE TABLE INSTRUCTOR
					(ins_id INT , 
					lastname VARCHAR(50) DEFAULT 'not null',
					firstname VARCHAR(50) DEFAULT 'not null', 
					city VARCHAR(50), 
					country CHAR(2));
					
--TASK-2A-Insert one row	
INSERT INTO INSTRUCTOR
					(ins_id, lastname,firstname, city, country)
					VALUES
					(1, 'Ahuja', 'Rav', 'Toronto', 'CA');

--TASK-2A---Insert two rows					
INSERT INTO INSTRUCTOR
				(ins_id, lastname, firstname, city, country)
				VALUES
				(2, 'Chong', 'Raul', 'Toronto', 'CA'), (3, 'Vasudevan', 'Hima', 'Chicago', 'US');
				
--TASK-3A---Select	all rows			
SELECT * FROM INSTRUCTOR;

--TASK-3B---SELECT only few rows 
SELECT firstname, lastname, country FROM INSTRUCTOR WHERE city = 'Toronto';

--TASK-4---UPDATE
UPDATE INSTRUCTOR SET city = 'Markham' WHERE ins_id = 1;

--TASK-5A---DELETE
DELETE FROM INSTRUCTOR WHERE ins_id = 2;

--TASK-5B---Retreive all rows
SELECT * FROM INSTRUCTOR
