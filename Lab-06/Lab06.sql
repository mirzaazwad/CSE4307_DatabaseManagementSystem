drop table BRANCH;
drop table EMPLOYEES; 
drop table ADMIN;
drop table LIBRARIAN;
drop table MANTAINANCE;
drop table Shift;
drop table junction_BOOKS_BRANCH;
drop table BOOKS;
drop table junction_Employees_Shift;
drop table PUBLISHER;
drop table ACCOUNT;
drop table ISSUED;


create table BRANCH(
    branch_id varchar2(20) NOT NULL,
    location varchar2(50) NOT NULL,
    YearOfEstablishment int NOT NULL,
    constraint pk_branch primary key(branch_id)
);

create table EMPLOYEES(
    NID int not null,
    Name varchar2(100) not null,
    dateOfBirth date not null,
    bloodGroup varchar2(3) not null,
    branch_id varchar2(20) NOT NULL,
    constraint pk_employee primary key(NID),
    constraint fk_employee foreign key(branch_id) references BRANCH
);

create table ADMIN(
    NID int not null,
    baseSalary number not null,
    constraint pk_admin primary key(NID),
    constraint fk_admin foreign key(NID) references EMPLOYEES
);

create table LIBRARIAN(
    NID int not null,
    baseSalary number not null,
    constraint pk_librarian primary key(NID),
    constraint fk_librarian foreign key(NID) references EMPLOYEES
);

create table MANTAINANCE(
    NID int not null,
    baseSalary number not null,
    constraint pk_mantainance primary key(NID),
    constraint fk_mantainance foreign key(NID) references EMPLOYEES
);

create table Shift(
    Time varchar2(15) not null,
    DayOfWeek varchar2(20) not null,
    duration number not null,
    constraint pk_shift primary key(Time,DayOfWeek)
);

create table junction_Employees_Shift(
    NID int not null,
    Time varchar2(15) not null,
    DayOfWeek varchar2(20) not null,
    constraint pk_junctionEmployees primary key(NID,Time,DayOfWeek),
    constraint fk_junctionEmployees1 foreign key(NID) references EMPLOYEES,
    constraint fk_junctionEmployees2 foreign key(Time,DayOfWeek) references EMPLOYEES
);

create table PUBLISHER(
    name varchar2(20) not null,
    city varchar2(20) not null,
    EstablishmentYear int not null,
    constraint pk_publisher primary key(name,city)
);


create table BOOKS(
    ISBN varchar2(50) NOT NULL,
    name varchar2(100) not null,
    author varchar2(100) not null,
    genre varchar2(50) not null,
    price number not null,
    publisher_name varchar2(20) not null,
    publisher_city varchar2(20) not null,
    constraint pk_books primary key(ISBN),
    constraint fk_publisher foreign key(publisher_name,publisher_city) references Publisher
);

create table junction_BOOKS_BRANCH(
    ISBN int not null,
    branch_id varchar2(20) NOT NULL,
    numberOfCopies int not null,
    constraint pk_junction_BOOKS_BRANCH primary key(ISBN,branch_id),
    constraint copyCheck check(numberOfCopies>=0)
);



create table ACCOUNT(
    Username varchar2(50) not null,
    name varchar2(100) not null,
    dateOfBirth date not null,
    hometown varchar2(100) not null,
    occupation varchar2(100) not null,
    constraint pk_account primary key(Username)
);

create table ISSUED(
    Username varchar2(50) not null,
    ISBN varchar2(50) not null,
    Employee_ID int not null,
    issueDate date not null,
    numberOfDays int default 15,
    constraint pk_issued primary key(Username,ISBN),
    constraint fk_issued foreign key(Username) references ACCOUNT,
    constraint fk_issued_books foreign key(ISBN) references BOOKS,
    constraint fk_issued_employee foreign key(Employee_ID) references EMPLOYEES,
    constraint dayConstraint check(numberOfDays>=0) 
);
