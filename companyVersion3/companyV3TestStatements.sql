select * from employee;
select * from department;
select * from workerPosition;
select * from workerOfDepartment;

select lastname, firstname, departmentName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId;

select lastname, firstname, departmentName,positionName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionId=positionNumber;

select lastname, firstname, departmentName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionId=positionNumber
where positionName='leader';

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionId=positionNumber
where departmentName='transportation';

select lastname, firstname, departmentName, positionName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionId=positionNumber
where departmentName='transportation'
order by positionName asc, lastname asc, firstname asc;

select lastname, firstname, departmentName, case
when positionName='leader' then 'boss'
else '' end as lead from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionId=positionNumber
order by lastname asc, firstname asc;

select avg(salary) as average from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join workerPosition on positionId=positionNumber
where positionName='leader';

select avg(salary) as average from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join workerPosition on positionId=positionNumber
where positionName='worker';


select lastname, firstname, departmentName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
order by lastname asc, firstname asc, departmentName asc;

select lastname, firstname, departmentName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
order by departmentName asc, lastname asc, firstname asc;

select  departmentName, lastname, firstname from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
order by departmentName asc, lastname asc, firstname asc;