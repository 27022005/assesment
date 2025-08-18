create database information;
use information;
drop table contact;
select * from contact;

#1) Statement to create the Contact table 
create table contact(
		Contact_Id int primary key,
        Company_Id int,
        First_Name varchar(45),
        Last_Name varchar(45),
        Street varchar(45),
        City varchar(45),
        State varchar(2),
        Zip varchar(10),
        ismain boolean,
        email varchar(45),
        phone varchar(12));
 insert into  contact 
		values(11,111,"pallavi","Beldar","153 udhana","surat","GJ",1001,true,"pallavibeldar@gmail.com",'756-647-6474'),
				(12,112,"prakruti","Yadav","352 cali","Mumbai","MH",1002,false,"prakrutiyadav@gmail.com",'464-463-4642'),
                (13,113,"Lesley","Bland","123 Maple St","New York","NY",1003,true,"lblandy@gmial.com",'567-464-5647'),
                (14,114,"Dianne","Connor","456 Oak Ave","Los Angeles","CA",1004,false,"dianneconnor27@gmail.com",'474-574-8684'),
                (15,115,"Jack","Lee","124 tapi ","vyara","GJ",1005,true,"jacklee@gmail.com",'584-437-5775');

select * from Employee;
drop table Employee;
drop table contact;
drop table contact_Employee;

# 2) Statement to create the Employee table
create table Employee(
	employee_Id int primary key,
    First_Name varchar(45),
    Last_Name varchar (45),
    Salary decimal(10,2),
    Hire_Date date,
    Job_title varchar(25),
    Email varchar (45),
    phone varchar (12));

select * from Employee;
insert into  Employee
		values (1,"pallavi","Beldar",100000,"2025-06-5","DA","pallavibeldar@gmail.com",'756-647-6474'),
				(2,"prakruti","Yadav",70000,"2021-05-21","Ds","prakrutiyadav@gmail.com",'464-463-4642'),
                (3,"Lesley","Bland",50000,"2021-05-12","Graphics","lblandy@gmial.com",c),
                (4,"Dianne","Connor",100000,"2021-05-26","DS","dianneconnor27@gmail.com",'474-574-8684'),
                (5,"Jack","Lee",400000,"2021-05-25","softwaretesting","jacklee@gmail.com",'584-437-5775');
        
select * from contact_Employee;
drop table contact_Employee;

# 3) Statement to create the ContactEmployee table 
create table contact_Employee(
		contact_emp_Id int primary key,
        Contact_Id int,
        employee_Id int,
        Contact_date date,
        Description varchar(100),
        foreign key (Contact_Id) references contact(Contact_Id),
		FOREIGN KEY (employee_Id) REFERENCES Employee (employee_Id));
        
insert into contact_Employee
		values(101,11,1,"2024-12-1","Called regarding project update"),
				(102,12,2,"2024-12-2","Met at Delhi branch office"),
                (103,13,3,"2024-12-3","Met at Delhi branch office"),
                (104,14,4,"2024-12-4","Called regarding project update"),
                (105,15,5,"2024-12-5","Called regarding project update");
select * from company;
create table company(
		company_Id int primary key,
        comapnyName varchar(45),
        Street varchar (45),
        city varchar(45),
        state varchar(2),
        zip varchar(10));
        
        
insert into company
		values(111,"Urban Outfitters, Inc.","123 main st","Philadelphia","PA",1970),
			(112,"Toll Brothers","145 market st","Horsham","PA",1945),
            (113,"corporate","344 kgf blvd","Philadelphia","PA",1925),
            (114,"Nakashtra","533 mnf st","Horsham","PA",1936),
            (115,"mahenra","234 main road","Philadelphia","PA",1986);
            
# 4) In the Employee table, the statement that changes Lesley Bland’s phone numberto 215-555-8800 		
# answer 4)
update Employee 
	set phone = '215-555-8800'
    where phone = '567-464-5647';


# 5) In the Company table, the statement that changes the name of “UrbanOutfitters, Inc.” to “Urban Outfitters”
# answer 5)
update  company 
	set comapnyName = "Urban Outfitters, Inc."
    where comapnyName = "Urban Outfitters";

# 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement)    
# answer 6)
DELETE FROM contact_Employee
WHERE contact_emp_Id = 105;


/* 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
		Run the SQL SELECT query in MySQL Workbench. Copy the results below as well.*/
# ansewr 7)
select distinct e.First_Name, e.Last_Name
		from Employee e
join contact_Employee ce 
		on ce.employee_Id = e.employee_Id
join contact c 
	on c.Contact_Id = ce.Contact_Id
join company co
	on co.company_Id = co.company_Id
where co.comapnyName = "Toll Brothers";

# 8)  What is the significance of “%” and “_” operators in the LIKE statement?
/*Answer:-  % Represents zero or more characters for example name like A% 
				so result will come in any name starting with A such as (Amrita, Amar,A)*/

# 9) Explain normalization in the context of databases. 
/*Answer:- Normalization in database means arranging data in a clean and orgnized way so that,
			the Same data is not repeted in multiple places and information is stored only where it belongs.*/
            
# 10)
/*Answer:- A join in MySQL means combining data from two or more tables using a related column between them.
			It’s like matching two lists by a common thing — for example, joining a Students table and a Courses table using the CourseID so you can see which student is in which course.*/
            
#11) 19.What do you understand about DDL, DCL, and DML in MySQL?       
/* Answer:-  DDL Stands for Data Definition Language and in DDL we */

#12) 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
/*Answer:-  The JOIN clause in MySQL is used to connect rows from two or more tables based on a related column between them.
	It helps you get information from multiple tables in one result.
	there are 5 types of join
    1. INNER, 2. LEFT, 3. RIGHT, 4. FULL, 5.CROSS*/




        