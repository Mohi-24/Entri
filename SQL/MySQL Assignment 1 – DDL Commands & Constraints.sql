create database Employee_Database;

use Employee_Database;

-- -------------------------------------------------------------------------------------------------------------------------------

-- 1. Table Creation (CREATE):

create table Departments(Department_ID int primary key, Department_Name varchar(100));

create table Location(Location_ID int primary key,Location varchar(30));

create table Employees(Employee_ID int primary key,Employee_Name varchar(50),Gender enum('M','F'),Age int,Hire_Date date, 
Designation varchar(100),Department_ID int,Location_ID int, Salary decimal(10,2),foreign key (Department_ID) references Departments(Department_ID), foreign key (Location_ID) references Location(Location_ID));

-- -------------------------------------------------------------------------------------------------------------------------------

-- 2. Table Alteration (ALTER): 

alter table employees add column (email varchar (50) not null);

alter table employees modify column Designation varchar(200);

alter table employees drop column Age;

alter table employees rename column Hire_Date to Date_of_Joining;

-- -------------------------------------------------------------------------------------------------------------------------------

-- 3. Table Renaming (RENAME):

rename table Departments to Departments_Info;

rename table Location to Locations;

-- -------------------------------------------------------------------------------------------------------------------------------

-- 4. Table Truncation (TRUNCATE): Write an SQL statement to truncate the

Drop table Employees;

-- -------------------------------------------------------------------------------------------------------------------------------

-- 5. Database & Table Dropping (DROP): Write the SQL statements to drop the

Drop database employee_database;

-- -------------------------------------------------------------------------------------------------------------------------------

-- Constraints : 
-- 1.   Database Recreation: 
-- Dropped the 'Employee_Database' database and recreating new Database Employee

create database Employee;

use Employee;

-- -------------------------------------------------------------------------------------------------------------------------------

/*2. Departments Table: 
⦿  Ensure that the "department_id" uniquely identifies each department. 
⦿  Set up constraints on the "department_name" to avoid duplicate and null entries. */

create table Departments(Department_ID int primary key, Department_Name varchar(100) unique not null);

-- -------------------------------------------------------------------------------------------------------------------------------

/*3. Location Table: 
⦿  Establish a mechanism to automatically generate unique identifiers for 
each location, ensuring that they are incremented sequentially. 
⦿  Implement constraints to prevent the insertion of null and duplicate locations. */

create table Location(Location_ID int primary key auto_increment,Location varchar(30) not null unique);

-- -------------------------------------------------------------------------------------------------------------------------------

/*4. Employees Table: 
⦿  Guarantee that each employee has a distinct identifier. 
⦿  Create a restriction to ensure that the employee's name is always 
provided. 
⦿  Limit the acceptable values for the "gender" field to only 'M' or 'F'. 
⦿  Enforce a condition to ensure that the employee's age is 18 or above. 
⦿  Automatically assign the current date to the "hire_date" field if not 
specified. 
⦿  Establish links between the "department_id" and "location_id" fields in 
the "employees" table and their respective tables.*/

create table Employees(Employee_ID int primary key,Employee_Name varchar(50) not null,Gender enum('M','F'),Age int check(Age>=18),Hire_Date date default (current_date), 
Designation varchar(100),Department_ID int,Location_ID int, Salary decimal(10,2),foreign key (Department_ID) references Departments(Department_ID), foreign key (Location_ID) references Location(Location_ID));


-- ---------------------------------------------------------------------Start of Assignment 2 -------------------------------------------------------------

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');


INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);


-- 1. Distinct Values: 
-- ⦿  a query to retrieve distinct salaries from the Employees table. 

select distinct salary Distinct_Salary from employees;

-- 2. Alias (AS): 
-- ⦿  Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.

select age AS Employee_Age, salary Employee_Salary from employees;

-- 3. Where Clause & Operators: 
-- ⦿  Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01. 

select Employee_ID,Employee_Name,salary, Hire_Date from employees where salary >50000 and hire_date<'2016-01-01'; 


-- ⦿  Find the employee whose designation is missing and fill it with "Data Scientist".
set sql_safe_updates=0;
start transaction;
update employees set Designation = 'Data Scientist' where Designation is null;
rollback;
commit;
-- Sorting and Grouping Data: 
-- 1. ORDER BY: 
-- ⦿  Find employees sorted by department ID in ascending order and salary in descending order. 

select * from employees order by Department_ID ASC, salary desc; 

-- 2. LIMIT: 
-- ⦿  Display the first 5 employees hired in the year 2018.

select * from employees where hire_Date>='2018-01-01' and hire_Date<='2018-12-31' order by hire_date ASC limit 5; 

-- 3. Aggregate Functions: 
-- ⦿  Calculate the sum of all salaries in the Finance department. 
select sum(salary) Total_Finance_Salary from employees where Department_ID=7;

-- using joins and giving specific department name
select sum(salary) Total_Finance_Salary from employees e join departments d on e.department_ID=d.department_ID where d.Department_Name='Finance';

-- ⦿  Find the minimum age among all employees. 
select min(age) from employees;

-- 4. GROUP BY: 
-- ⦿  List the maximum salary for each location. 

select Location_id,max(salary) Max_Salary from employees group by location_id;

select l.location,e.Location_id,max(e.salary) Max_Salary from employees e join location l on l.location_Id = e.location_ID group by location_id order by e.location_ID;

-- ⦿  Calculate the average salary for each designation containing the word 'Analyst'. 
select Designation, round(avg (salary)) AVG_Salary from employees group by Designation having Designation like '%Analyst%';


-- 5. HAVING: 
-- ⦿  Find departments with less than 3 employees. 
select e.Department_ID, d.department_Name,count(e.department_ID) 'No of Employees' from employees e join departments d on d.Department_ID=e.Department_ID group by d.Department_Name having count(e.department_ID)<3 order by Department_ID;

-- ⦿  Find locations with female employees whose average age is below 30.
Select round(avg(e.Age)) as AVG_Age, l.location,e.gender from employees e join location l on e.location_ID= l.location_ID 
where e.gender='f' group by l.location having AVG_Age<30;

Select round(avg(e.Age)) as AVG_Age, l.location,e.gender from location l join  employees e on e.location_ID= l.location_ID 
where e.gender='f' group by l.location having AVG_Age<30;

-- Joins: 
-- 1. Inner Join: 
-- ⦿  List employee names, their designations, and department names where employees are assigned to a department. 
select e.Employee_Name,e.Designation,d.Department_Name from employees e inner join Departments d on e.department_ID=d.department_ID order by employee_Name;

-- 2. Left Join: 
-- ⦿  List all departments along with the total number of employees in each department, including departments with no employees.
-- left join using employees as left and departments as right tables

select Count(e.department_ID) Total_No_Of_Employees, d.department_Name from employees e left join departments d on  e.department_ID=d.department_ID group by department_Name Order by Total_No_Of_Employees;

-- left join using departments as left and employees as right tables
select d.department_Name,Count(e.department_ID) Total_No_Of_Employees from departments d left join employees e on  e.department_ID=d.department_ID group by department_Name Order by department_Name;

 
-- 3. Right Join: 
-- ⦿  Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name.
select e.employee_Name,l.location from employees e right join location l on l.location_id=e.location_id order by l.location;

select e.employee_Name,l.location from location l right join employees e on l.location_id=e.location_id order by l.location;

-- ---------------------------------end of assignment ------------------------------------------------
use employee;
select * from location;
select * from employee.employees;
select * from departments;