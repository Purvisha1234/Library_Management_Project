--library management system

--create Branch table

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
	(
		branch_id VARCHAR(35) PRIMARY KEY,
		manager_id VARCHAR(25),
		branch_address VARCHAR(55),
		contact_no VARCHAR(35)
	);
DROP TABLE IF EXISTS employee;
CREATE TABLE employee
	(
		emp_id VARCHAR(55) PRIMARY KEY,
		emp_name VARCHAR(25),
		position VARCHAR(25),
		Salary INT,
		branch_id VARCHAR(35)
	);
DROP TABLE books
CREATE TABLE books
	(
	isbn VARCHAR(35) PRIMARY KEY,
	book_title VARCHAR(75),
	category VARCHAR(30),
	rental_price FLOAT,
	status VARCHAR(15),
	author VARCHAR(35),
	publisher VARCHAR(55)
	);

CREATE TABLE members
	(
		member_id VARCHAR(35) PRIMARY KEY,
		member_name VARCHAR(25),
		member_address VARCHAR(75),
		reg_date DATE
	);
CREATE TABLE issued_status
	(
		issued_id VARCHAR(25) PRIMARY KEY,
		issued_member_id VARCHAR(35),
		issued_book_name VARCHAR(75),
		issued_date DATE,
		issued_book_isbn VARCHAR(25),
		issued_emp_id VARCHAR(25)
	);

drop table issued_status

CREATE TABLE   return_status
	(
		return_id VARCHAR(25) PRIMARY KEY,
		issued_id VARCHAR(25),
		return_book_name VARCHAR(75),
		return_date DATE,
		return_book_isbn VARCHAR(20)
	);

--foreign key
alter table issued_status
add constraint fk_members
foreign key(issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key(issued_book_isbn)
references books(isbn)

alter table issued_status
add constraint fk_employee
foreign key(issued_emp_id)
references employee(emp_id)

alter table employee
add constraint fk_branch
foreign key(branch_id)
references branch(branch_id)

alter table return_status
add constraint fk_issued_status
foreign key(issued_id)
references issued_status(issued_id)

	
