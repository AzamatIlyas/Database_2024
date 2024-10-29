--1
create database lab_2;

--2
create table employees(
    employee_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50)  ,
    last_name VARCHAR(50) ,
    department_id INT default NULL,
    salary INT default 0
);
select * from employees;

--3
Insert into employees (first_name, last_name, department_id, salary) values ('Azamat', 'Ilyas',1 , 10000);
select * from employees;

-- 4
insert into employees(first_name,last_name) values ('Almas', 'Anetbek');
select * from employees;

--5
insert into employees (first_name, last_name, salary) values ('Dias','Zhumabay' ,11111);
select * from employees;

--6
insert into employees (first_name, last_name, department_id, salary)
values ('Kenesov','Daryn',3,46161),
       ('Lionel','Messi',4,77777),
       ('Cristiano','Ronaldo',5,100),
       ('Karim','Benzema',6,7150),
       ('Kylian','Mbappe',7,8881);

select * from employees;

--7
alter table employees alter column first_name set default 'John';

--8
insert into employees ( last_name, department_id, salary) values ('Wick',8,82161);
select * from employees;

--9
insert into employees default values ;
select * from employees;

--10
create table employees_archive(
    like employees including constraints
);
select * from employees_archive;

--11
insert into employees_archive
    select * from employees;
select * from employees_archive;

--12
update employees set salary = 1,department_id=1 where department_id is null;
select * from employees;

--13
update employees set salary = salary*1.15 returning first_name,last_name,salary as updated_salary;
select * from employees;

--14
delete from employees where salary<50000;
select * from employees;

--15
delete from employees_archive a using employees b where a.employee_id = b.employee_id returning a.employee_id, a.first_name, a.last_name, a.department_id, a.salary;
select * from employees_archive;

--16
delete from employees returning first_name,last_name,department_id,salary;
select * from employees;

drop table employees;
drop table employees_archive;
drop database lab_2;

























create database hhh;

create table coffee_shop(
    quantity INT,
    name varchar(100),
    clients_name varchar(100),
    date date ,
    id serial primary key
);

insert into coffee_shop values (2,'latte','dias','27.09.2024');

insert into coffee_shop values (3,'cappucino','aza','20.08.2023');

insert into coffee_shop default values ;

delete from coffee_shop where quantity is null;

update coffee_shop set quantity = 4 where quantity = 2;

select * from coffee_shop;

