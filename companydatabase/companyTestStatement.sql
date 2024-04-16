 use companydb;

 select * from department;
 select * from employee;

 select * from employee where departmentNumber=1;
 select * from department where departmentId=1;

 select departmentNumber from employee 
 where firstname='Vera' and lastname='River';
  
select departmentName,departmentFloor from department 
where departmentId=1;

select departmentName, departmentFloor from department,employee
where employee.departmentNumber=department.departmentId and 
firstname='Vera' and lastname='River';

select firstname,departmentName, departmentFloor from department,employee
where departmentNumber=departmentId and 
firstname='Vera' and lastname='River';

select firstname, departmentFloor from employee
inner join department on departmentNumber=departmentId
where firstname='Vera' and lastname='River';

select firstname, departmentFloor from employee
inner join department on departmentNumber=departmentId;

select firstname,lastname, departmentFloor from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select avg(salary) as "ict average" from employee
where departmentNumber=1;

select avg(salary) as "ict average" from employee
inner join department on departmentNumber=departmentId
where departmentName='ict';

select firstname,lastname,departmentName from employee
inner join department on departmentNumber=departmentId
where  salary=(select max(salary) from employee);

select firstname,lastname,departmentName from employee
inner join department on departmentNumber=departmentId
where  salary=(select min(salary) from employee);

select firstname,lastname,departmentName,salary from employee
inner join department on departmentNumber=departmentId
where  salary=(select min(salary) from employee);

select firstname,lastname,departmentName,salary from employee
inner join department on departmentNumber=departmentId
where  salary>(select avg(salary) from employee);

select departmentName, firstname from department
inner join employee on departmentId=departmentNumber
order by departmentName asc, firstname asc;

select departmentName, firstname from department
inner join employee on departmentId=departmentNumber;

select departmentName, firstname from department
left join employee on departmentId=departmentNumber;

select departmentName, count(employeeId) as "number of employees" from department
left join employee on departmentId=departmentNumber
group by departmentName;

select departmentName, count(employeeId) as "number of employees" from department
left join employee on departmentId=departmentNumber
group by departmentName having count(employeeId)=0;

select departmentName, count(employeeId) as "number of employees" from department
inner join employee on departmentId=departmentNumber
group by departmentName;

select firstname,lastname,departmentName,salary, case
when salary>(select avg(salary) from employee) then 'above average'
when salary<(select avg(salary) from employee) then 'below average'
else 'average' end as "salary level" from employee
inner join department on departmentNumber=departmentId;

select departmentName, count(employeeId) as "number of employees",
min(salary) as minimum, max(salary) as maximum, avg(salary) as average from department
inner join employee on departmentId=departmentNumber
group by departmentName;

select departmentName, count(employeeId) as "number of employees",
min(salary) as minimum, max(salary) as maximum, avg(salary) as average from department
left join employee on departmentId=departmentNumber
group by departmentName;

select departmentName, count(employeeId) as "number of employees",
min(salary) as minimum, max(salary) as maximum, avg(salary) as average,
sum(salary) as "total sum" from department
left join employee on departmentId=departmentNumber
group by departmentName;