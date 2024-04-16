drop database if exists companyv3db;
create database companyv3db;

use companyv3db;

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

create table workerPosition(
    positionId integer not null primary key,
    positionName varchar(30) not null,
    positionDescription varchar(100)
);

create table workerOfDepartment(
    departmentNumber integer not null,
    employeeNumber integer not null,
    positionNumber integer not null,
    primary key(departmentNumber,employeeNumber,positionNumber),
    foreign key(departmentNumber) references department(departmentId),
    foreign key(employeeNumber) references employee(employeeId),
    foreign key(positionNumber) references workerPosition(positionId)
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

insert into workerPosition values (1,'worker','worker is working hard');
insert into workerPosition values (2, 'leader','leader is leading a nice life');

insert into workerOfDepartment values(1,1,1);
insert into workerOfDepartment values(1,3,2);
insert into workerOfDepartment values(2,3,1);
insert into workerOfDepartment values(2,2,1);
insert into workerOfDepartment values(2,4,1);
insert into workerOfDepartment values(3,5,1);
insert into workerOfDepartment values(5,6,1);
insert into workerOfDepartment values(5,7,2);

drop user if exists 'littleboss2'@'localhost';
create user 'littleboss2'@'localhost' identified by '1234';

grant all privileges on companyv3db.* to 'littleboss2'@'localhost';
