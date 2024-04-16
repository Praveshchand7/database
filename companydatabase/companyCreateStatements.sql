drop database if exists companydb;
create database companydb;

use companydb;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(30) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2),
    departmentNumber integer not null,
    foreign key (departmentNumber) references department(departmentId)
);

insert into department values (1, 'ict','basement');
insert into department values (2, 'admin','top-floor');
insert into department values (3, 'secr','secret location');
insert into department values (4, 'maintenance','workshop');
insert into department values (5, 'transportation','garage');

insert into employee values(1, 'Matt','River', 5000, 1);
insert into employee values(2, 'Mary','Smith', 7000, 2);
insert into employee values(3, 'Vera','River', 5500, 1);
insert into employee values(4,'Amanda','Jones', 7000, 2);
insert into employee values(5, 'Joe','Doe', 4000, 3);
insert into employee values(6, 'Peter','Bond', 3000, 5);
insert into employee values(7, 'Layla', 'Driver',5000,5);

drop user if exists 'bigboss'@'localhost';
create user 'bigboss'@'localhost' identified by '1234';

grant all privileges on companydb.* to 'bigboss'@'localhost';