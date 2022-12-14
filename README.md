# SQL_HW_2
## CREATE, INSERT, ALTER

### Таблица employees
1. Создать таблицу employees.
- id. serial,  primary key,
- employee_name. Varchar(50), not null
```sql
create table employees(
	id serial primary key,
	employee_name Varchar(50) not null
);
```
2. Наполнить таблицу employee 70 строками.
```SQL
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
```

### Таблица salary
3. Создать таблицу salary.
- id. Serial  primary key,
- monthly_salary. Int, not null
```sql
create table salary(
	id serial primary key,
	monthly_salary Int not null
);
```
4. Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500

```SQL 
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
```

## Таблица employee_salary
5. Создать таблицу employee_salary.
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
```SQL
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
	);
```

6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
```SQL
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
(32,16),
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
(17,16),
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
```

### Таблица roles
7. Создать таблицу roles.
- id. Serial  primary key,
- role_name. int, not null, unique
```SQL
create table roles(
	id Serial primary key,
	role_name int not null unique
);
```
8. Поменять тип столба role_name с int на varchar(30).
```SQL
ALTER TABLE roles
ALTER COLUMN role_name TYPE varchar(30);
```
9. Наполнить таблицу roles 20 строками:
```SQL
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
```

### Таблица roles_employee
10. Создать таблицу roles_employee.
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
```SQL
create table roles_employee(
	id Serial primary key,
	employee_id Int not null unique, 
	role_id Int not null,
		foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);
```
11. Наполнить таблицу roles_employee 40 строками:
```SQL
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
```
Для просмотра созданных таблиц.
```SQL
select * from employees;
select * from salary;
select * from employee_salary;
select  * from roles;
select * from roles_employee;
```

Удалить созданную таблицу.
```SQL
DROP TABLE table_name;
```

Обновить параметры таблицы.
```SQL
ALTER TABLE table_name
ADD column_name datatype; - варианты
DROP COLUMN column_name; - варианты
ALTER COLUMN column_name datatype; - варианты
```

Обновить данные в существующей таблице.
```SQL
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

Удалить данные в существующей таблице.
```SQL
DELETE FROM table_name WHERE condition;
```



# Joins

1. Вывести всех работников, чьи зарплаты есть в базе вместе с зарплатами.
```SQL
select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
;
```

2. Вывести всех работников, у которых ЗП меньше 2000.
```SQL
select employees.employee_name, salary.monthly_salary 
from employees
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where salary.monthly_salary < 2000
;
```

3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает).
```SQL
select employees.employee_name, salary.monthly_salary 
from employees
right join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where employees.employee_name is null
;
```

4. Вывести все зарплатные позиции  меньше 2000, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает).
```SQL
select employees.employee_name, salary.monthly_salary 
from employees
right join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id
where employees.employee_name is null and salary.monthly_salary < 2000
;
```

5. Найти всех работников, кому не начислена ЗП.
```SQL
select employees.employee_name, salary.monthly_salary 
from employees
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where salary.monthly_salary is null
;
```

6. Вывести всех работников с названиями их должности.
```SQL
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
;
```

7. Вывести имена и должность только Java разработчиков.
```SQL 
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Java%'
;
```

8. Вывести имена и должность только Python разработчиков.
```SQL
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Python%'
;
```

9. Вывести имена и должность всех QA инженеров.
```SQL
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%QA%'
;
```

10. Вывести имена и должность ручных QA инженеров.
```SQL
select employees.employee_name, roles.role_name 
from employees 
left join roles_employee on employees.id = roles_employee.employee_id
left join roles on roles.id  = roles_employee.role_id
where roles.role_name  like '%Manual%QA%'
;
```


11. Вывести имена и должность автоматизаторов QA.
```SQL
select employees.employee_name, roles.role_name 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
where roles.role_name like '%Automation%QA%'
;
```

12. Вывести имена и зарплаты всех специалистов (для проверки).
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
;
```

13. Вывести имена и зарплаты Junior специалистов.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where roles.role_name like '%Junior%'
;
```
Добавлено поле role_name для для проверки.

14. Вывести имена и зарплаты Middle специалистов.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Middle%'
;
```

15. Вывести имена и зарплаты Senior специалистов.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Senior%'
;
```

16. Вывести зарплаты Java разработчиков.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Java developer'
;
```

17. Вывести зарплаты Python разработчиков.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Python%'
;
```

18. Вывести имена и зарплаты Junior Python разработчиков.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Junior_Python%'
;
```

19. Вывести имена и зарплаты Middle JS разработчиков.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Middle JavaScript developer'
;
```

20. Вывести имена и зарплаты Senior Java разработчиков.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Senior_Java dev%'
;
```

21. Вывести зарплаты Junior QA инженеров.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary  
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
left join employee_salary on employees.id  = employee_salary.employee_id
left join salary on salary_id = salary.id
where role_name like '%Junior%QA%'
;
```

 22. Вывести среднюю зарплату всех Junior специалистов.
```SQL
select avg(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%Junior%'
;
```

23. Вывести сумму зарплат JS разработчиков.
```SQL
select sum(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%JavaScript dev%'
;
```

 24. Вывести минимальную ЗП QA инженеров.
```SQL
select min(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%'
;
```

 25. Вывести максимальную ЗП QA инженеров.
```SQL
select max(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%'
;
```

 26. Вывести количество QA инженеров.
```SQL
select count(roles.role_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%QA%'
;
```

27. Вывести количество Middle специалистов.
```SQL
select count(employees.employee_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%Middle%'
;
```

28. Вывести количество разработчиков.
```SQL
select count(employees.employee_name)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%developer%'
;
```

29. Вывести фонд (сумму) зарплаты разработчиков.
```SQL
select sum(salary.monthly_salary)
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where role_name like '%developer%'
;
```

30. Вывести имена, должности и ЗП всех специалистов по возрастанию.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
ORDER by (salary.monthly_salary)
;
```

 31. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП от 1700 до 2300.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary between 1700 and 2300
ORDER by (salary.monthly_salary)
;
```

32. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП меньше 2300.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary < 2300
ORDER by (salary.monthly_salary)
;
```

 33. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП равна 1100, 1500, 2000.
```SQL
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id  = roles_employee.role_id
join employee_salary on employees.id  = employee_salary.employee_id
join salary on salary_id = salary.id 
where salary.monthly_salary in (1100, 1500, 2000)
ORDER by (salary.monthly_salary)
;
```