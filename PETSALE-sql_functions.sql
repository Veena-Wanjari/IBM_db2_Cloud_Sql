-- Drop the PETSALE table in case it exists
drop table PETSALE;
-- Create the PETSALE table 
create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE	);
	
-- Insert sample data into PETSALE table
insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15');
	
SELECT * FROM PETSALE;
---------------------Aggregate Functions or Coloumn Functions(Perform on entire coloumn)----------------
--Using SUM()
SELECT SUM(SALEPRICE) FROM PETSALE;
SELECT SUM(SALEPRICE) AS SUM_SALEPRICE FROM PETSALE;

--Using MAX()
SELECT MAX(QUANTITY) FROM PETSALE;

--Using MIN()
SELECT MIN(QUANTITY) AS MIN_QUANTITY FROM PETSALE WHERE ANIMAL = 'Cat' ;
SELECT MIN(QUANTITY) AS MIN_QUANTITY FROM PETSALE WHERE ANIMAL = 'Dog' ;

--Using AVG()
SELECT AVG(SALEPRICE) AS AVERAGE_SALEPRICE FROM PETSALE;
SELECT AVG(SALEPRICE) AS AVERAGE_SALEPRICE FROM PETSALE WHERE ANIMAL = 'Dog';

--Calculating average sale price per dog 
SELECT AVG(SALEPRICE/ QUANTITY) AS AVERAGE_SALEPRICE_FOR_DOG  
					FROM PETSALE WHERE ANIMAL = 'Dog';
-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------Scalar Functions(Perform on individual values)

--Using ROUND()(returns upto 2 decimal point)
SELECT ROUND(SALEPRICE) FROM PETSALE;

---------------------------String Functions
--Using LENGTH() - This is a subclass of Scalar functions called String Functions
SELECT LENGTH(ANIMAL) FROM PETSALE;

---Using UPPER() or UCASE()
SELECT UPPER(ANIMAL) FROM PETSALE;
SELECT UPPER(ANIMAL) AS ANIMAL_NAME, ROUND(SALEPRICE) AS PRICE FROM PETSALE;
SELECT UCASE(ANIMAL) FROM PETSALE;

--Using LOWER() or LCASE()
SELECT LOWER(ANIMAL) FROM PETSALE;
SELECT LOWER(ANIMAL) AS ANIMAL_NAME, ROUND(SALEPRICE) AS PRICE FROM PETSALE;
SELECT LCASE(ANIMAL) FROM PETSALE;

--Using DISTINCT() (unique names in the entire coloumn and also in upper case)
SELECT DISTINCT(UPPER(ANIMAL)) FROM PETSALE;

-----------------------------DATE AND TIME FUNCTIONS
--Using day()
SELECT ANIMAL, SALEDATE, DAY(SALEDATE) AS DAY_DATE FROM PETSALE WHERE ANIMAL = 'Cat';

--Using Month()
SELECT COUNT(*) AS COUNT FROM PETSALE WHERE MONTH(SALEDATE) = '05';

--Using DAYOFMONTH()
SELECT DAYOFYEAR("2018-06-15") FROM PETSALE;
SELECT DAYOFWEEK("2017-06-15") FROM PETSALE; 



--to get the count of each animal when the month is June
SELECT ANIMAL, COUNT 
					FROM (SELECT ANIMAL, COUNT(*) AS COUNT 
								FROM PETSALE 
								WHERE MONTH(SALEDATE) = '06'
								GROUP BY ANIMAL);

--Date and Time arthemetic
SELECT (SALEDATE + 3 DAYS) FROM PETSALE;

--Using Special Registers
SELECT (CURRENT_DATE - SALEDATE) FROM PETSALE;
SELECT CURRENT_TIME FROM PETSALE;





