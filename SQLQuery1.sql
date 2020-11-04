--UC 1
create database AddressBook;
use AddressBook;

--UC 2
CREATE TABLE AddressBook1
(
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	address VARCHAR(50),
	city VARCHAR(15),
	state VARCHAR(15),
	zip NUMERIC(6),
	phoneNumber NUMERIC(10),
	email VARCHAR(50)
);
select * from AddressBook1;
--drop table AddressBook1;

--UC 3
INSERT INTO AddressBook1 VALUES('Sharyu','Raut','akola','xyz','Maharashtra',123456,1234567890,'abc@gmail.com');
INSERT INTO AddressBook1 VALUES('ABC','DEF','abcd','andheri','Maharashtra',123456,1234567890,'abc@gmail.com');
INSERT INTO AddressBook1 VALUES('ABrC','DEAF','abcd','andheri','Maharashtra',123456,1234567890,'abc@gmail.com');
INSERT INTO AddressBook1 VALUES('GBeC','DEF','abcd','andheri','Maharashtra',123456,1234567890,'abc@gmail.com');
INSERT INTO AddressBook1 VALUES('AZBC','DEF','abcd','andheri','Maharashtra',123456,1234567890,'abc@gmail.com');

--UC 4
UPDATE AddressBook1 SET phoneNumber=1234123451 WHERE firstName='Sharyu';

--UC5
DELETE from AddressBook1 WHERE firstName='Sharyu';

--UC 6
SELECT * FROM AddressBook1 WHERE city='andheri' and state='Maharashtra';

--UC 7
SELECT city,COUNT(email) FROM AddressBook1
GROUP BY city;
SELECT state,COUNT(email) FROM AddressBook1
GROUP BY state;

--UC 8
select * FROM AddressBook1 WHERE CITY='andheri' ORDER BY(firstName);
select * from AddressBook1;

--UC 9
