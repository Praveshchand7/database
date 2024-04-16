drop database if exists companyv2db;
create database companyv2db;

use companyv2db;

create table department(
    departmentId integer not null primary key,
    departmentName varchar(30) not null,
    departmentFloor varchar(15) not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    salary decimal(6,2)
);

create table workerOfDepartment(
    departmentNumber integer not null,
    employeeNumber integer not null,
    primary key(departmentNumber,employeeNumber),
    foreign key(departmentNumber) references department(departmentId),
    foreign key(employeeNumber) references employee(employeeId)
);

create table headOfDepartment(
    departmentNumber integer not null,
    employeeNumber integer not null,
    primary key(departmentNumber,employeeNumber),
    foreign key(departmentNumber) references department(departmentId),
    foreign key(employeeNumber) references employee(employeeId)
);

insert into department values (1, 'ict','basement');
insert into department values (2, 'admin','top-floor');
insert into department values (3, 'secr','secret location');
insert into department values (4, 'maintenance','workshop');
insert into department values (5, 'transportation','garage');

insert into employee values(1, 'Matt','River', 5000);
insert into employee values(2, 'Mary','Smith', 7000);
insert into employee values(3, 'Vera','River', 5500);
insert into employee values(4,'Amanda','Jones', 7000);
insert into employee values(5, 'Joe','Doe', 4000);
insert into employee values(6, 'Peter','Bond', 3000);
insert into employee values(7, 'Layla', 'Driver',5000);

insert into workerOfDepartment values(1,1);
insert into workerOfDepartment values(1,3);
insert into workerOfDepartment values(2,2);
insert into workerOfDepartment values(2,4);
insert into workerOfDepartment values(3,5);
insert into workerOfDepartment values(5,6);
insert into workerOfDepartment values(5,7);

drop user if exists 'littleboss'@'localhost';
create user 'littleboss'@'localhost' identified by '1234';

grant all privileges on companyv2db.* to 'littleboss'@'localhost';
