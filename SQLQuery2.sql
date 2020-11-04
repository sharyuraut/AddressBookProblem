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

UPDATE employee_payroll set phone_no =
1234561234;
UPDATE employee_payroll set gender =
'F';


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

/*UC 9*/
EXEC sp_RENAME 'employee_payroll.salary', 'basic_pay', 'Column';
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


UPDATE employee_payroll
	SET phone_no='23456789876',address='3/41 chawk',department='.Net Rpa',
        deductions=500, taxable_pay=9500,income_tax=8550,net_pay=2367
     WHERE name='NewName';

UPDATE employee_payroll
	SET phone_no='9876549345',address='xyz',department='Java',
        deductions=200,taxable_pay=799,income_tax=80,net_pay=7000
     WHERE name='ZA';

UPDATE employee_payroll
	SET phone_no='9876543456',address='andheri',department='Sales',
        deductions=399,taxable_pay=1600,income_tax=160,net_pay=3654
     WHERE id=2;

SELECT * FROM employee_payroll;

/*UC 11*/
