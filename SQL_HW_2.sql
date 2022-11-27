create table employees(
	id serial primary key,
	employee_name Varchar(50) not null
);

insert into employees (employee_name)
values 
('Василий'),
('Герасим'),
('Георгий'),
('Пётр'),
('Вадим'),
('Юрий'),
('Вадим'),
('Юрий'),
('Никита'),
('Иван'),
('Вадим'),
('Семён'),
('Илья'),
('Никита'),
('Василий'),
('Руслан'),
('Семён'),
('Максим'),
('Станислав'),
('Григорий'),
('Роман'),
('Пётр'),
('Владислав'),
('Денис'),
('Геннадий'),
('Денис'),
('Артём'),
('Артур'),
('Владислав'),
('Аркадий'),
('Василий'),
('Аркадий'),
('Ярослав'),
('Илья'),
('Иван'),
('Вадим'),
('Семён'),
('Денис'),
('Геннадий'),
('Денис'),
('Артём'),
('Семён'),
('Илья'),
('Василий'),
('Пётр'),
('Пётр'),
('Дарья'),
('Оксана'),
('Полина'),
('Анастасия'),
('Анастасия'),
('Алла'),
('Наталья'),
('Александра'),
('Виолетта'),
('Вероника'),
('Ольга'),
('Дарья'),
('Ирина'),
('Анастасия'),
('Светлана'),
('Дарья'),
('Полина'),
('Катерина'),
('Надежда'),
('Полина'),
('София'),
('Оксана'),
('Анастасия'),
('Надежда');

create table salary(
	id serial primary key,
	monthly_salary Int not null
);

insert into salary (monthly_salary)
values 
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400);

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
	);

insert into employee_salary (employee_id, salary_id)
values 
(38,14),
(25,8),
(89,11),
(28,3),
(12,2),
(15,12),
(88,9),
(40,10),
(5,5),
(32,13),
(77,6),
(13,13),
(22,1),
(36,15),
(20,4),
(30,7),
(94,14),
(16,8),
(29,11),
(4,3),
(33,5),
(17,11),
(27,6),
(73,13),
(9,1),
(95,15),
(6,4),
(19,7),
(1,1),
(23,15),
(10,4),
(31,7),
(75,14),
(2,8),
(21,11),
(8,3),
(105,2),
(102,12),
(14,9),
(78,10);

create table roles(
	id Serial primary key,
	role_name int not null unique
);

ALTER TABLE roles
ALTER COLUMN role_name TYPE varchar(30);

insert into roles(role_name)
values 
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

create table roles_employee(
	id Serial primary key,
	employee_id Int not null unique, 
	role_id Int not null,
		foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

insert into roles_employee(employee_id, role_id)
values 
(38,17),
(25,12),
(3,8),
(28,10),
(12,19),
(15,19),
(39,3),
(40,5),
(5,1),
(32,4),
(24,8),
(13,11),
(22,16),
(36,16),
(20,10),
(30,15),
(35,3),
(16,11),
(29,18),
(4,6),
(33,2),
(17,9),
(27,13),
(34,1),
(9,20),
(18,17),
(6,6),
(19,15),
(1,14),
(23,18),
(10,7),
(31,4),
(7,12),
(2,7),
(21,9),
(8,20),
(11,2),
(26,14),
(14,13),
(37,5);

select * from employees;
select * from salary;
select * from employee_salary;
select  * from roles;
select * from roles_employee;

--DROP TABLE table_names;
DROP TABLE employee_salary;
---------------------------
UPDATE employee_salary
SET salary_id = 15, 
WHERE id = 15;


-- SQL HomeWork 2. Joins

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
;

 -- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where salary.monthly_salary < 2000
;

 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary.monthly_salary 
from employees
right join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where employees.employee_name is null
;

 -- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employees.employee_name, salary.monthly_salary 
from employees
right join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where employees.employee_name is null and salary.monthly_salary < 2000
;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, salary.monthly_salary 
from employees
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where salary.monthly_salary is null
;

--6. Вывести всех работников с названиями их должности (включая работников без должности).
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
;

--6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
;

--7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Java %'
;

--8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Python%'
;

--9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%QA%'
;

--10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name  like '%Manual%QA%'
;

--11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Automation%QA%'
;

--12. Вывести имена и зарплаты всех
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
;


--12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where roles.role_name like '%Junior%'
;
-- Добавлено поле role_name для для проверки.

--13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Middle%'
;

--14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Senior%'
;

--15. Вывести зарплаты Java разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Java developer';

--16. Вывести зарплаты Python разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Junior_Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Middle JavaScript developer';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Senior_Java dev%'
;

--20. Вывести зарплаты Junior QA инженеров
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Junior%QA%'
;

-- 21. Вывести среднюю зарплату всех Junior специалистов.
select avg(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%Junior%'
;

-- 22. Вывести сумму зарплат JS разработчиков.
select sum(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%JavaScript dev%'
;

-- 23. Вывести минимальную ЗП QA инженеров.
select min(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров.
select max(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров.
select count(roles.role_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%'
;

--26. Вывести количество Middle специалистов.
select count(employees.employee_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%Middle%'
;

--27. Вывести количество разработчиков.
select count(employees.employee_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%developer%'
;

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%developer%'
;


--29. Вывести имена, должности и ЗП всех специалистов по возрастанию.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
ORDER by (salary.monthly_salary)
;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary between 1700 and 2300
ORDER by (salary.monthly_salary)
;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary < 2300
ORDER by (salary.monthly_salary)
;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary in (1100, 1500, 2000)
ORDER by (salary.monthly_salary)
;