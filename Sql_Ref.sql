CREATE SCHEMA LEARNING;

https://tableplus.com/blog/2018/07/mysql-join-explained-inner-left-right-full.html
https://www.edureka.co/blog/interview-questions/sql-query-interview-questions

CREATE TABLE:
1. CREATE TABLE EMPLOYEES (ID INT NOT NULL, NAME VARCHAR(100) NOT NULL, 
SALARY DECIMAL(10,2) NOT NULL, PRIMARY KEY(ID)) ;

2. create table department (department_id int not null 
primary key, department_name varchar(20));

3. CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

INSERT RECORD:
INSERT INTO EMPLOYEES VALUES(1, 'AAA', 1000);

UPDATE EMPLOYEES SET SALARY = '2000.00' WHERE (ID = '7');


-- SELECT:
SELECT MAX(SALARY) FROM EMPLOYEES

SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 3,1;
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 1 OFFSET 0;
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 1 OFFSET 3;

select  DISTINCT SALARY AS TOP_3RD from employees order by salary desc limit 1 offset 2;

---

INDEX:
CREATE INDEX EMPLOYEES_ID_SALARY ON EMPLOYEES(ID, SALARY);
DROP INDEX EMPLOYEES_ID ON EMPLOYEES;

ALTER:

ALTER TABLE Persons ADD PRIMARY KEY (ID);

ALTER TABLE EMPLOYEES ADD COLUMN EXTRA varchar(100);
alter table employees add column department_id int
ALTER TABLE PERSONS DROP EXTRA;

--To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
ALTER TABLE Persons DROP PRIMARY KEY;
ALTER TABLE Persons DROP CONSTRAINT PK_Person;
--

alter table employees drop primary key 
alter table employees add constraint id_pd primary key(id);
alter table employees add constraint employee_pk primary key(ID);
 -- alter table employees drop constraint employee_pk; -> not working
 
 -- Add Constarint:
 alter table employees add constraint depart_fk foreign key(department_fk) references department(department_id)
 alter table employees drop constraint depart_fk
 ALTER TABLE Persons DROP PRIMARY KEY;
 ALTER TABLE Persons DROP CONSTRAINT PK_Person;
 
 
----

Function:

SELECT MAX(SALARY) FROM interview.employees;
SELECT MIN(SALARY) FROM interview.employees;
SELECT AVG(SALARY) FROM interview.employees;

---

GROUP BY:

select CITY,  COUNT(*) from employees group by CITY
select CITY,  COUNT(CITY) from employees group by CITY having CITY != 'CBE';
select AGE, CITY,  COUNT(CITY) from employees group by AGE , CITY 
select AGE, CITY,  COUNT(CITY) from employees group by AGE , CITY having age >=22
---

-- Find Duplicate:
select name , age , count(*) from employees group by name, age having count(*)>1
select `name`, city, count(*) from employees group by `name`, city having count(*)>1
---


Join:

select * from employees e inner join department d on e.department_id = d.department_id where city = 'cbe'
select * from employees e inner join department d on e.department_id = d.department_id and name = 'aaa' where city = 'cbe'


select * from employees e inner join department d on e.department_id = d.department_id;
select * from employees e left join department d on e.department_id = d.department_id;
select * from employees e right join department d on e.department_id = d.department_id;

full join not support on mysql:

MySQL does not support FULL JOIN, so you have to combine JOIN, UNION and LEFT JOIN to get an equivalent. It gives the results of A union B. It returns all records from both tables. Those columns which exist in only one table will contain NULL in the opposite table.

select * from employees e left join department d on e.department_id = d.department_id
union
select * from employees e right join department d on e.department_id = d.department_id

----

select * from employees e left join department d on e.department_id = d.department_id where city = 'mdkm';

--

1. select d.department_name, max(e.salary) as min_salary from employees e inner join department d on e.department_id = d.department_id
group by department_name order by min_salary asc;

select * from employees where salary > (select avg(salary) from employees)

--
2. select LOWER(d.department_name) as DEPARTNAME, max(SALARY) as max_salary from employees e inner join department d on e.department_id = d.department_id
group by d.department_name order by max_salary desc;

3. select count(*) from employees e inner join department d on e.department_id = d.department_id where d.department_name = 'IT';

4. select * from employees where salary >= 2000 and salary <=5000;
select * from employees where salary between 2000 and 5000

select concat(NAME,' -  ', SALARY) AS NAME_AND_SALARY from employees where salary between 2000 and 5000


