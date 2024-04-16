select * from employee order by salary;
select * from employee order by salary desc;

select * from employee where salary is not null
order by salary desc;

select count(*) from employee;
select count(*) as NumberOfEmployees from employee;
select count(*) as "Number Of Employees" from employee;
select count(salary) from employee;
select count(firstname) from employee;
select count(*)-count(salary) from employee;
select count(*)-count(salary) as nulls from employee;

select firstname, count(*) as amount from employee group by firstname;

select firstname, count(*) from employee group by firstname having count(*)>1;
select firstname, count(*) as amount from employee group by firstname having count(*)<2;
select firstname, count(*) as amount from employee group by firstname having amount<2;


select min(salary) as minimum from employee;
select max(salary) as maximum from employee;
select avg(salary) as average from employee;

select min(salary) as lowest, max(salary) as highest from employee;
select max(salary)-min(salary) as diff from employee;

select sum(salary) from employee;

select rand();
select firstname, rand() from employee;
select firstname from employee order by rand();

select firstname,lastname from employee where lastname='River' or lastname='Smith';
select firstname,lastname from employee where lastname in ('River','Smith');
select firstname,lastname from employee where lastname not in ('River','Smith');

select firstname,lastname, salary from employee where salary between 5000 and 7000;
select firstname,lastname,salary from employee 
where salary>=5000 and salary<=7000;

select * from employee where firstname between 'M' and 'W';
select * from employee where firstname between 'M' and 'Will';

select * from employee where firstname like '_a%';
select * from employee where firstname like '_ar%';

insert into employee values(7,'Mary_Ann','Jonesy','admin',6500);
insert into employee values(8,'MaryAnn','Smithy','ict',5500);

select * from employee where firstname like '__r_';
select * from employee where firstname like '%y';
select * from employee where firstname like '%a';

select * from employee where firstname like 'Mary_%';
select * from employee where firstname like 'Mary\_%';
select * from employee where firstname like 'Mary%';

select * from employee where firstname like 'M%';

update employee set department='marketing' where employeeId=3;
update employee set salary=3500 where employeeId=3;

update employee set salary=8000, department='ict' where employeeId=4;

update employee set firstname='Mary Ann' where employeeId=7;

update employee set firstname='Mathias' where firstname='Matt';
update employee set firstname='Matt' where employeeId=1 or employeeId=6;

-- update employee set salary=round(salary*1.1) where firstname='Matt';

-- update employee set salary=round(salary*1.1) where salary<5000;

-- update employee set salary=6000 where salary>6000;

-- update employee set salary=7000;

-- delete from employee where department='marketing';
-- delete from employee where lastname like '_m%';
-- delete from employee;