select firstname,lastname from employee
where salary = (select min(salary) from employee);

select firstname,lastname,salary from employee
where salary<(select avg(salary) from employee);

select avg(salary) from employee;

select firstname,lastname,salary from employee
where salary<(select avg(salary) from employee)
order by salary desc;

select firstname,lastname, case
when salary>6000 then 'topworker' else '-' end as notes
from employee;

select firstname,lastname, case
when salary>6000 then 'topworker' else '-' end as notes
from employee
order by salary desc, lastname asc, firstname asc;

update employee set salary=null where employeeId=4;

select lastname, firstname, salary, case
  when salary=(select min(salary) from employee) then 'min'
  when salary = (select max(salary) from employee) then 'max'
  when salary is null then 'missing'
  else '' end as minmax
from employee
order by lastname asc, firstname asc;

select lastname, firstname, salary, case
  when salary=(select min(salary) from employee) then 'min'
  when salary = (select max(salary) from employee) then 'max'
  when salary is null then 'missing'
  else '' end as minmax, 
  case
    when salary>6000 then 'topworker' else '' end as notes
from employee
order by lastname asc, firstname asc;

select firstname,lastname, case
when salary>6000 then salary*0.2 else salary*0.1 end as bonus
from employee;

