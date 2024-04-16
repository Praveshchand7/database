select firstname,lastname from employee;

select firstname from employee;
select distinct firstname from employee;

select firstname,lastname,department,salary 
from employee where lastname='River';

select firstname,department,salary 
from employee where lastname='River';

select firstname,lastname, department,salary 
from employee where lastname <> 'River';

select firstname,lastname, department,salary 
from employee where lastname != 'River';

select firstname,lastname from employee where department is null;

select lastname,firstname, department, salary from employee
order by lastname asc, firstname asc;

select lastname,firstname, department, salary from employee
order by lastname asc, firstname desc;

select firstname from employee order by firstname desc;

select distinct firstname from employee order by firstname asc;

select firstname, count(*) as count from employee group by firstname;