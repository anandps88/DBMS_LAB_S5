CREATE TABLE Department (
  Dep_No NUMBER(38) PRIMARY KEY NOT NULL,
  Dep_Name VARCHAR2(15) NOT NULL,
  Loc VARCHAR2(15) NOT NULL,
  Mgr NUMBER(38) NOT NULL,
  Exp_Bdg NUMBER(38) NOT NULL,
  Rev_Bdg NUMBER(38) NOT NULL
);

CREATE TABLE Employee (
  Empno NUMBER(38) PRIMARY KEY NOT NULL,
  Name VARCHAR2(15) NOT NULL,
  Job VARCHAR2(15) NOT NULL,
  Salary NUMBER(38) NOT NULL,
  Comm VARCHAR2(15),
  Dep_No NUMBER(38) FOREIGN KEY REFERENCES Department(Dep_No),
  Sex VARCHAR2(6)
);

CREATE TABLE Dependant (
  Pid NUMBER(38) PRIMARY KEY NOT NULL,
  Fname VARCHAR2(15) NOT NULL,
  Lname VARCHAR2(15) NOT NULL,
  Place VARCHAR2(15) NOT NULL,
  Empno NUMBER(38) FOREIGN KEY REFERENCES Employee(Empno)
);

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (100, 'Wilson', 'CLERK', 17000, 'Y', 10, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (101, 'Smitha', 'SALESMAN', 25000, 'NO', 40, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (103, 'Roy', 'ANALYST', 35000, 'NO', 30, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (105, 'Watson', 'MANAGER', 45000, 'NO', 30, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (109, 'Alan', 'MANAGER', 30000, 'YES', 40, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (110, 'Tina', 'CLERK', 18000, 'NO', 50, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (200, 'Karthika', 'MANAGER', 29000, 'NO', 10, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (210, 'Rita', 'MANAGER', 36500, 'NO', 50, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (213, 'Manacy', 'CLERK', 16250, 'NO', 10, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (214, 'Simpson', 'DRIVER', 8250, 'NO', 60, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (215, 'Deepa', 'ANALYST', 27000, 'NO', 60, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (220, 'Soosan', 'SALESMAN', 28500, 'YES', 60, 'F');




INSERT INTO Department (Dep_No, Dep_Name, Loc, Mgr, Exp_Bdg, Rev_Bdg)
VALUES (60, 'Shipping', 'Trivandrum', 215, 90000, 0);

INSERT INTO Department (Dep_No, Dep_Name, Loc, Mgr, Exp_Bdg, Rev_Bdg)
VALUES (10, 'Accounting', 'Cochin', 200, 100000, 0);

INSERT INTO Department (Dep_No, Dep_Name, Loc, Mgr, Exp_Bdg, Rev_Bdg)
VALUES (30, 'Research', 'Cochin', 105, 125000, 0);

INSERT INTO Department (Dep_No, Dep_Name, Loc, Mgr, Exp_Bdg, Rev_Bdg)
VALUES (40, 'Sales', 'Trichur', 109, 280000, 8000);

INSERT INTO Department (Dep_No, Dep_Name, Loc, Mgr, Exp_Bdg, Rev_Bdg)
VALUES (50, 'Manufacturing', 'Kottayam', 210, 130000, 0);





INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (1010, 'Anu', 'Jose',  NULL, NULL, 214, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (1020, 'Neenu', 'Thomas', NULL, NULL, 200, 'F');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (1022, 'Anamik', 'Thampi', NULL, NULL, 200, 'M');

INSERT INTO Employee (Empno, Name, Job, Salary, Comm, Dep_No, Sex)
VALUES (1031, 'Swetha', 'Das',  NULL, NULL, 109, 'F');


