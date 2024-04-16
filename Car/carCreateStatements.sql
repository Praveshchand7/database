drop database if exists cardb;
create database cardb;
use cardb;

create table car(
    carId integer not null primary key,
    model varchar(20) not null,
    licence varchar(10) not null,
    imagepath varchar(255)
);

 insert into car values(1,'Model T','ABC-1','tmodel.png');

 insert into car (carId,model,licence) values(2,'MbW','XYZ-123');
 insert into car (model, imagepath, carId, licence) 
 values('GtX','gtx.png',3,'A-5');

 select model, imagepath from car;

  select model,imagepath from car where imagepath is not null;
  select model from car where imagepath is null;


 show create table car;

  +-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| car   | CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `model` varchar(20) NOT NULL,
  `licence` varchar(10) NOT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [cardb]>





create user 'nimda'@'localhost' identified by '12345';
grant all privileges on *.* to 'nimda'@'localhost' with grant option;

