create database try; 
use try;
create table employees(
	employee_id int auto_increment primary key,
    name varchar(100),
    position varchar(100),
    salary decimal (10,2),
    hire_date date);
    
select* from employee_audit;
create table employee_audit(
		audit_id int auto_increment primary key,
        employee_id int,
        name varchar(100),
        position  varchar(100),
        salary decimal (10,2),
		hire_date date,
        action_date timestamp default current_timestamp);
        
        
insert into  employees (name, position, salary, hire_date) 
			VALUES ('John Doe','Software Engineer', 80000.00, '2022-01-15'),
					('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
					('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01'); 
delimiter $$
create trigger emp_audit
	after insert on employees
for each row
begin
	insert into employee_audit(employee_id,name,position,salary,hire_date)
		values(new.employee_id,new.name,new.position,new.salary,new.hire_date);
end; $$
delimiter ;

insert into employees (name, position, salary, hire_date)
VALUES ('Mukesh Ambani', 'Regional Manager', 95000.00, '2023-08-01');


delimiter $$
CREATE PROCEDURE add_employee(
    IN emp_name VARCHAR(100),
    IN emp_position VARCHAR(100),
    IN emp_salary DECIMAL(10, 2),
    IN emp_hire_date DATE
)
BEGIN
    INSERT INTO employees (name, position, salary, hire_date)
    VALUES (emp_name, emp_position, emp_salary, emp_hire_date);
END$$
delimiter ;

select*from employees;
call add_employee("prkruti Beldar","Data Analyst",80000,"2024-02-27");

































