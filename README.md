# IBM_db2_Cloud_Sql

# Databases and Sql For Data Science by IBM on Coursera 
  
  The hands-on labs for this course uses the IBM Cloud environment for working with a relational database. 
  The database is created and accessed with IBM Db2 from the web browser.

## INSTRUCTOR_basic_sql_commands.sql
  
  This script contains basic sql commands.

  1. dropping table
  2. creating table called INSTRUCTOR with below attributes-
      * ins_id
      *	lastname
      *	firstname
      *	city
      *	country

  3. inserting data into tables
  4. updating tables 
  5. deleting few rows
  6. Printing / retrieving few rows or all rows in the Db2 IBM Cloud database.

## PETSALE_sql_functions.sql
  
  This script uses built in database functions in order to retrieve data from a PETSALE table in the Db2 IBM Cloud database using SQL query. 
  Below mentioned built in functions are used in 'PETSALE' table.
  Aggregate functions or Column functions, Scalar functions, String functions, Date and Time functions, arithmetic operations on Date and Time functions and Special Registers.
  
  _AVG, SUM, MAX, MIN, ROUND, LENGTH, LCASE, UCASE, DISTINCT, DAY, MONTH, DAYOFMONTH, COUNT , CURRENT DATE and CURRENT TIME_
  
  
## HR-Database_tables.sql
  
  This folder contains scripts for querying an HR database with advanced SQL commands.
  
   1)	HR Database Tables.pdf illustrates the structure of the HR database.
    
   2)	HRDATABASE_Table.sql contains the code for creating the 5 HR database tables.
    
   3)	It also contains SQL queries with _LIKE, BETWEEN, WHERE, ORDER BY, GROUP BY, COUNT, AVG, and HAVING_ clauses. It also contains a query that uses aliases and extracts information from two tables.
      
   4)	Additionally, it also contains some advance SQL queries with JOIN operations.
  
## Accessing Database
  
  This folder contains Jupyter Notebook scripts that connect to and query an IBM Db2 database.
  
   1)	Connecting_to_db2.ipynb connects to a Db2 database on IBM Cloud using Python.
    
   2)	Querying_db.ipynb accesses a Db2 database on IBM Cloud using Python. This script also creates a table, inserts data, queries the data, and retrieves a result set into a Pandas data frame.
    
   3)	SQLmagic.ipynb uses SQL Magic to accesse a Db2 database on IBM Cloud using Python. This script also uses SQL Magic to create a table, insert data, query the data, and     retrieve a result set into a Pandas data frame.
    
   4)	Analyzing_data.ipynb stores a dataset into a database from a .CSV file using Python. This script also queries and analyzes the data using SQL and Python.
  
 ## Chicago School Progress
  
  This folder contains the Chicago Public School Progress Report files. 
  The lab involved working with a real world dataset using SQL and Python to query columns with spaces or special characters in their names and with mixed names.
  It also required the use of built in database functions.
  
   1)	Chicago_School_Report- 2011-12.csv is the dataset showing all school-level performance data used to create CPS School Report Cards for the 2011-2012 school year.The data  was loaded into a Db2 database on IBM Cloud.
    
   2)	Reportcard_description.pdf contains descriptions of the report card dataset CPS Progress Report 2011-12.csv
    
   3)	RealDataPractice.ipynb contains the scripts used to connect to and query the database.

## Final Assignment

  This folder contains data files and a Jupyter Notebook script that demonstrates use of a variety of SQL commands to query the three datasets.
  
   1)	Census_Data.csv contains six socioeconomic indicators of public health significance and a “hardship index,” by Chicago community area, for the years 2008 – 2012. For more detailed information, see the  [https://data.cityofchicago.org/Health-Human-Services/Census-Data-Selected-socioeconomic-indicators-in-C/kn9c-c2s2]
      
   2)	Chicago_Crime_Data.csv reflects reported incidents of crime (with the exception of murders where data exists for each victim) that occurred in the City of Chicago from     2001 to present, minus the most recent seven days.For more detailed information, see the [https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2]
      
   3)	Chicago_Public_Schools_2011-2012.csv shows all school level performance data used to create CPS School Report Cards for the 2011-2012 school year.For more detailed information, see the [https://data.cityofchicago.org/Education/Chicago-Public-Schools-Progress-Report-Cards-2011-/9xs2-f89t]
      
   4)	Final_course_assignment.ipynb contains the script with ipython-sql code, which is used to query the datasets after they were loaded into a Db2 database on IBM Cloud.
   
   

  
  > _Keep Querying_
  

