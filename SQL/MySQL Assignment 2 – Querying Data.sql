
use Employee;

-- ---------------------------------------------------------------------Start of Assignment 2 -------------------------------------------------------------


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

select * from location;
select * from employees;
select * from departments;