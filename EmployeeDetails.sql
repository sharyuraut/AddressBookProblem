/*UC 1*/
create database EmployeeDetails;

use EmployeeDetails;

/*UC 2*/
create table employee_payroll(
	id int NOT NULL identity(1,1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	start_Date DATETIME NOT NULL ) ;

/*UC 3*/
insert into employee_payroll values('Sharyu',  1000,'2020-1-1');
insert into employee_payroll values('Name',  1000,'2020-1-1');
insert into employee_payroll values('ZA',  1000,'2020-1-1');
insert into employee_payroll values('XYZ',  1000,'2020-2-1');
insert into employee_payroll values('ABC',  1000,'2020-1-3');
insert into employee_payroll values('POQ',  1000,'2020-2-1');

/*UC 4*/
select * from employee_payroll;

delete from employee_payroll 
	where name= 'Sharyu';

/*UC 5*/
SELECT salary FROM employee_payroll
WHERE name = 'XYZ';

/*UC 6*/
ALTER TABLE employee_payroll
add gender char;

UPDATE employee_payroll set gender =
'M' where name = 'XYZ' or name =
'POQ';
UPDATE employee_payroll set gender =
'F' where name != 'XYZ' or name !=
'POQ';

/*UC 7*/
SELECT SUM(salary) FROM employee_payroll
	WHERE gender = 'M' GROUP BY gender;

SELECT COUNT(salary) FROM employee_payroll
	WHERE gender = 'F' GROUP BY gender;

/*UC 8*/
ALTER TABLE employee_payroll ADD phone_no varchar(250);
ALTER TABLE employee_payroll ADD address varchar(250) NOT NULL default 'MUMBAI';
ALTER TABLE employee_payroll ADD department varchar(150) NOT NULL default 'dept';
insert into employee_payroll (name, salary, start_date) values ('Samplename',2345,'2020-02-03')

alter table employee_payroll drop column address;

/*UC 9*/
EXEC sp_RENAME 'employee_payroll.salary', 'basic_pay', 'COLUMN';
SELECT * FROM employee_payroll;

ALTER TABLE employee_payroll
	ADD deductions DECIMAL(10,2) NOT NULL DEFAULT(0);
ALTER TABLE employee_payroll
	ADD  taxable_pay DECIMAL(10,2) NOT NULL DEFAULT(0);
ALTER TABLE employee_payroll
	ADD  income_tax DECIMAL(10,2) NOT NULL DEFAULT(0);
ALTER TABLE employee_payroll
	ADD  net_pay DECIMAL(10,2) NOT NULL DEFAULT(0);
SELECT * FROM employee_payroll;

/*UC 10*/
SELECT * FROM employee_payroll WHERE name='NewName';
INSERT INTO employee_payroll 
	VALUES('NewName',15000,'2019-10-31','F',123456789,'Mumbai','Marketing',1000,14000,1400,12600);
SELECT * FROM employee_payroll WHERE name='NewName';

SELECT HOST_NAME();

/*UC 11*/
--Add the tables according to ER Diagram
DROP TABLE employee_payroll;

--Creating table Company
CREATE TABLE Company(
    company_id INT NOT NULL PRIMARY KEY,
    company_name VARCHAR(30) NOT NULL,
);
--Inserting data into table Company
INSERT INTO Company(company_id,company_name)
    VALUES(171,'BridgeLabz'),(206,'Capgemini'),(987,'Google');
--Creating table Employee
CREATE TABLE Employee(
    employee_id INT NOT NULL PRIMARY KEY,
    employee_name VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone_no VARCHAR(15),
    address VARCHAR(100)
);
select * from Company;
Select * from Employee;
--Inserting data into table Employee
INSERT INTO Employee(employee_id,employee_name,gender,phone_no,address)
    VALUES(23,'A','M','9899125354','Mumbai'),(39,'B','F','7896534218','Delhi'),
            (78,'C','M','6578923546','Pune'),(11,'D','F','8796345567','Amritsar');
--Creating table Department
CREATE TABLE Department(
    department_id INT NOT NULL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    employee_id INT FOREIGN KEY REFERENCES Employee(employee_id)
);
select * from Department;
--Inserting into table Department
INSERT INTO Department(department_id,department_name,employee_id)
    VALUES(333,'.Net Rpa',23),(877,'Java',78),(121,'Sales',39),(809,'Marketing',11);
--Creating table Payroll
CREATE TABLE Payroll(
    payroll_id VARCHAR(20) NOT NULL PRIMARY KEY,
    basic_pay DECIMAL(10,2),
    deduction DECIMAL(10,2),
    taxable_pay DECIMAL(10,2),
    income_tax DECIMAL(10,2),
    net_pay DECIMAL(10,2),
    employee_id INT FOREIGN KEY REFERENCES Employee(employee_id)
);
--Inserting into table Payroll
INSERT INTO Payroll(payroll_id,basic_pay,deduction,taxable_pay,income_tax,net_pay,employee_id)
    VALUES('#1245',10000,500,9500,950,8550,23),('#8765',15000,750,14250,1425,12825,78),
            ('#7689',25000,3000,22000,2200,19800,39),('#9008',29000,3500,25500,2550,22950,11);

--LETS CHECK THE TABLE AND ITS FIELDS
SELECT * FROM Company;
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Payroll;

--Redoing usecase7 to perform database functions and use group bu function
--Using joins
SELECT SUM(basic_pay) AS SALARY_F, AVG(taxable_pay) AS AVERAGE_F, 
        MIN(income_tax) AS MINIMUM_F, MAX(net_pay) AS MAXIMUM_F, COUNT(payroll_id) AS COUNT_PAYROLL
    FROM Payroll p INNER jOIN Employee e
    ON p.employee_id=e.employee_id
    WHERE e.gender = 'F' GROUP BY e.gender;

/*UC 12*/
SELECT * FROM Payroll;

/*StoredProcedure*/
create procedure [dbo].[AddNewEmployee]
	@Name varchar(50),
	@basic_pay decimal,
	@start_Date datetime,
	@gender char(1),
	@phone_no varchar(250),
	@address varchar(250),
	@department varchar(150),
	@deductions decimal,
	@taxable_pay decimal,
	@income_tax decimal,
	@net_pay decimal
as 
BEGIN
declare @id int
	insert into employee_payroll values(@Name,@basic_pay ,@start_Date ,@gender ,@phone_no ,@address ,@department ,@deductions ,@taxable_pay ,@income_tax ,@net_pay);
	set @id=(select top 1 id from employee_payroll order by id desc);
	insert into Employee values(@id,100,200,400,500);
END
