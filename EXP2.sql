-- EXPERIMENT 3 - DEPARTMENT — EMPLOYEE RELATIONS 

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 30/07/2022

-- AIM
-- WRITE QUERIES TO CREATE  AND RETRIEVE DEPARTMENT AND EMPLOYEE RELATIONS USING RELATIONSHIP CONSTRAINTS, INDICES, DDL &DML COMMANDS, VIEWS,  BUILT IN FUNCTIONS, SET OPERATIONS, AGGREGATE FUNCTIONS, GROUPING AND ORDERING CLAUSES
----------------------------------------------------------------

----------------------------------------------------------------


-- CREATING TABLES

-- DEPARTMENT TABLE
CREATE TABLE DEPARTMENT ( Dep_No INT PRIMARY KEY NOT NULL, Dep_Name VARCHAR2(15) NOT NULL, Loc VARCHAR2(15) NOT NULL, Mgr INT NOT NULL, Exp_Bdg INT NOT NULL, Rev_Bdg INT NOT NULL);

-- EMPLOYEE TABLE
CREATE TABLE EMPLOYEE ( Empno INT PRIMARY KEY NOT NULL, Name VARCHAR2(15) NOT NULL, Job VARCHAR2(15) NOT NULL, Salary INT NOT NULL, Comm VARCHAR2(15), Dep_No INT, Sex VARCHAR2(6), FOREIGN KEY(Dep_No) REFERENCES Department(Dep_No));

-- DEPENDANT TABLE
CREATE TABLE DEPENDANT ( Pid INT PRIMARY KEY NOT NULL, Fname VARCHAR2(15) NOT NULL, Lname VARCHAR2(15) NOT NULL, Place VARCHAR2(15) NOT NULL, Empno INT, FOREIGN KEY(Empno) REFERENCES Employee(Empno));


--INSERTING VALUES

-- DEPARTMENT TABLE
INSERT INTO DEPARTMENT VALUES (60, 'Shipping', 'Trivandrum', 215, 90000, 0);
INSERT INTO DEPARTMENT VALUES (10, 'Accounting', 'Cochin', 200, 100000, 0);
INSERT INTO DEPARTMENT VALUES (30, 'Research', 'Cochin', 105, 125000, 0);
INSERT INTO DEPARTMENT VALUES (40, 'Sales', 'Trichur', 109, 280000, 8000);
INSERT INTO DEPARTMENT VALUES (50, 'Manufacturing', 'Kottayam', 210, 130000, 0);

-- EMPLOYEE TABLE
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (100, 'Wilson', 'CLRK', 17000, 10, 'M'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (101, 'Smitha', 'SLSM', 25000, 40, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (103, 'Roy', 'ANLST', 35000, 30, 'M'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (105, 'Watson', 'MNGR', 45000, 30, 'M'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (109, 'Alan', 'MNGR', 30000, 40, 'M'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (110, 'Tina', 'CLRK', 18000, 50, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (200, 'Karthika', 'MNGR', 29000, 10, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (210, 'Rita', 'MNGR', 36500, 50, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (213, 'Manacy', 'CLRK', 16250, 10, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (214, 'Simpson', 'DRVR', 8250, 60, 'M'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (215, 'Deepa', 'ANLST', 27000, 60, 'F'); 
INSERT INTO EMPLOYEE (Empno, Name, Job, Salary, Dep_No, Sex) VALUES (220, 'Soosan', 'SLSM', 28500, 60, 'F');

UPDATE EMPLOYEE SET COMM = '1300' WHERE Empno = 101;
UPDATE EMPLOYEE SET COMM = '0' WHERE Empno = 105;
UPDATE EMPLOYEE SET COMM = '8000' WHERE Empno = 109;
UPDATE EMPLOYEE SET COMM = '5300' WHERE Empno = 220;


-- DEPENDANT TABLE
INSERT INTO DEPENDANT VALUES (1010, 'Anu', 'Jose', 'Trivandrum', 214);
INSERT INTO DEPENDANT VALUES (1020, 'Neenu', 'Thomas', 'Kollam', 200);
INSERT INTO DEPENDANT VALUES (1022, 'AnamikA', 'Thampi', 'Kollam', 200);
INSERT INTO DEPENDANT VALUES (1031, 'Swetha', 'Das', 'Kottayam', 109);


-- -------------------------------
-- QUERIES
-- -------------------------------


-- 1.  RETURN DETAILS OF  ALL MANAGERS FROM  EMPLOYEE TABLE SORTED  ALPHABETICALLY BY NAME. 
SELECT NAME 
FROM EMPLOYEE 
WHERE JOB = 'MNGR' 
ORDER BY NAME ASC;

NAME
---------------
Alan
Karthika
Rita
Watson

-- 2. RETURN DETAILS OF ALL EMPLOYEES IN DEPARTMENT 40 ORDERED BY EMPNO. 
SELECT * 
FROM EMPLOYEE 
WHERE DEP_NO = 40 
ORDER BY EMPNO ASC;

     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       101 Smitha          SLSM                 25000 1300                    40
F

       109 Alan            MNGR                 30000 8000                    40
M


-- 3. RETURN INFORMATION ABOUT ALL FEMALE EMPLOYEE ORDERED BY NAME.
SELECT * 
FROM EMPLOYEE 
WHERE SEX = 'F' 
ORDER BY NAME ASC;

     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       215 Deepa           ANLST                27000                         60
F

       200 Karthika        MNGR                 29000                         10
F

       213 Manacy          CLRK                 16250                         10
F


     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       210 Rita            MNGR                 36500                         50
F

       101 Smitha          SLSM                 25000 1300                    40
F

       220 Soosan          SLSM                 28500 5300                    60
F


     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       110 Tina            CLRK                 18000                         50
F


7 rows selected.

-- 4. FIND MAXIMUM AND MINIMUM  COMMISSION PAID(COMM),TOTAL  COMMISSION  PAID AND COUNT OF EMPLOYEES WHO WERE PAID WITH COMMISSION. 
SELECT MAX(COMM) , MIN(COMM) , SUM(COMM) , COUNT(*) 
FROM EMPLOYEE 
WHERE COMM > 0;

MAX(COMM)       MIN(COMM)        SUM(COMM)   COUNT(*)
--------------- --------------- ---------- ----------
8000            1300                 14600          3

-- 5. NUMBER OF  EMPLOYEES  LISTED IN EACH JOB.
SELECT JOB , COUNT(*) 
FROM EMPLOYEE 
GROUP BY JOB;

JOB               COUNT(*)
--------------- ----------
CLRK                     3
SLSM                     2
ANLST                    2
MNGR                     4
DRVR                     1

-- 6. TOTAL SALARY  PAID TO EACH JOB IN THE CATEGORY.
SELECT JOB , SUM(SALARY) 
FROM EMPLOYEE 
GROUP BY JOB;

JOB             SUM(SALARY)
--------------- -----------
CLRK                  51250
SLSM                  53500
ANLST                 62000
MNGR                 140500
DRVR                   8250

-- 7. RETURN ALL DEPT_NOS IN EMPLOYEE TABLE(ENSURE THAT EACH DEPT_ÑO APPEARS ONLY ONCE).
SELECT DISTINCT DEP_NO 
FROM EMPLOYEE;

    DEP_NO
----------
        10
        40
        30
        50
        60


-- 8. RETURN EMPNO,NAME AND SALARY OF FEMALES IN DEPARTMENT 10.
SELECT EMPNO , NAME , SALARY 
FROM EMPLOYEE 
WHERE DEP_NO = 10 
AND SEX = 'F';

     EMPNO NAME                SALARY
---------- --------------- ----------
       200 Karthika             29000
       213 Manacy               16250


-- 9. RETURN NAME AND JOB OF ALL FEMALE  SALES MAN AND MANAGERS.
SELECT NAME , JOB 
FROM EMPLOYEE 
WHERE JOB IN ('SLSM','MNGR') 
AND SEX = 'F';

NAME            JOB
--------------- ---------------
Smitha          SLSM
Karthika        MNGR
Rita            MNGR
Soosan          SLSM


-- 10. DISPLAY EMPNO AND NAME OF EMPLOYEES IN EMPLOYEE TABLE WHO ARE A EITHER MANAGER OR A CLERK IN DEPARTMENT 50.
SELECT EMPNO , NAME 
FROM EMPLOYEE 
WHERE DEP_NO = 50 
AND JOB IN ('MNGR','CLRK');

     EMPNO NAME
---------- ---------------
       110 Tina
       210 Rita

-- 11. LIST THE NAME OF EMPLOYEE WHO ARE NEITHER A CLERK NOR A SALESMAN.
SELECT NAME 
FROM EMPLOYEE 
WHERE JOB NOT IN ('CLRK','SLSM');

NAME
---------------
Roy
Watson
Alan
Karthika
Rita
Simpson
Deepa

7 rows selected.

-- 12. RETURN DETAILS OF ALL CLERKS WORKING IN DEPARTMENTS OTHER THAN DEPARTMENT 10.
SELECT * 
FROM EMPLOYEE 
WHERE JOB = 'CLRK' 
AND DEP_NO != 10;

     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       110 Tina            CLRK                 18000                         50
F

-- 13. FIND NAMES OF EMPLOYEES CONTAINING LETTERS U AND E.
SELECT NAME 
FROM EMPLOYEE 
WHERE NAME LIKE '%U%E%' 
OR NAME LIKE '%E%U%';

no rows selected


-- 14. LIST ALL EMPLOYEE WHO EARNED COMMISSION.
SELECT * 
FROM EMPLOYEE 
WHERE COMM != 0;

     EMPNO NAME            JOB                 SALARY COMM                DEP_NO
---------- --------------- --------------- ---------- --------------- ----------
SEX
------
       101 Smitha          SLSM                 25000 1300                    40
F

       109 Alan            MNGR                 30000 8000                    40
M

       220 Soosan          SLSM                 28500 5300                    60
F



-- 15. FIND EMPNO ,NAME AND JOB OF ALL FEMALES WHO ARE NOT MANAGERS.
SELECT EMPNO , NAME , JOB 
FROM EMPLOYEE 
WHERE SEX = 'F' 
AND JOB != 'MNGR';

     EMPNO NAME            JOB
---------- --------------- ---------------
       101 Smitha          SLSM
       110 Tina            CLRK
       213 Manacy          CLRK
       215 Deepa           ANLST
       220 Soosan          SLSM


-- 16. FIND EMPNO,NAME AND SALARY OF ALL EMPLOYEES WHO EARN MORE THAN 10000 BUT LESS THAN 40000.
SELECT EMPNO , NAME , SALARY 
FROM EMPLOYEE 
WHERE SALARY > 10000 
AND SALARY < 40000;

     EMPNO NAME                SALARY
---------- --------------- ----------
       100 Wilson               17000
       101 Smitha               25000
       103 Roy                  35000
       109 Alan                 30000
       110 Tina                 18000
       200 Karthika             29000
       210 Rita                 36500
       213 Manacy               16250
       215 Deepa                27000
       220 Soosan               28500

10 rows selected.



-- 17. USE IN OPERATOR TO FIND NAME AND EMPNO OF EMPLOYEE WHO ARE ANALYST OR MANAGER ORDERED BY NAME.
SELECT NAME , EMPNO 
FROM EMPLOYEE 
WHERE JOB IN ('ANLST' , 'MNGR');

NAME                 EMPNO
--------------- ----------
Roy                    103
Watson                 105
Alan                   109
Karthika               200
Rita                   210
Deepa                  215

6 rows selected.


-- 18. FIND THE EMPLOYEE NUMBER, NAME AND SALARY WHO BEEN PAID COMMISSION AND WHOSE SALARY IS GREATER THAN 30000.
SELECT EMPNO , NAME , SALARY 
FROM EMPLOYEE 
WHERE COMM IS NOT NULL 
AND SALARY >30000;

     EMPNO NAME                SALARY
---------- --------------- ----------
       105 Watson               45000


-- 19. FIND DEP-NO ,DEP-NAME, SALARY, JOB, SEX ORDERED BY EMPNO WITHIN DEPARTMENT.
SELECT D.DEP_NO, D.DEP_NAME, E.SALARY, E.JOB, E.SEX 
FROM DEPARTMENT D 
INNER JOIN EMPLOYEE E ON D.DEP_NO = E.DEP_NO 
ORDER BY D.DEP_NO, E.EMPNO;

    DEP_NO DEP_NAME            SALARY JOB             SEX
---------- --------------- ---------- --------------- ------
        10 Accounting           17000 CLRK            M
        10 Accounting           29000 MNGR            F
        10 Accounting           16250 CLRK            F
        30 Research             35000 ANLST           M
        30 Research             45000 MNGR            M
        40 Sales                25000 SLSM            F
        40 Sales                30000 MNGR            M
        50 Manufacturing        18000 CLRK            F
        50 Manufacturing        36500 MNGR            F
        60 Shipping              8250 DRVR            M
        60 Shipping             27000 ANLST           F

    DEP_NO DEP_NAME            SALARY JOB             SEX
---------- --------------- ---------- --------------- ------
        60 Shipping             28500 SLSM            F

12 rows selected.

-- 20. DISPLAY THE NAME OF EMPLOYEE AND DEPENDANT NAME IF DEPENDANT IS STAYING IN THE SAME LOCATION  WHERE EMPLOYEE IS WORKING.
SELECT E.NAME, D.FNAME 
FROM EMPLOYEE E 
INNER JOIN DEPENDANT D ON E.EMPNO = D.EMPNO 
INNER JOIN DEPARTMENT DEP ON E.DEP_NO = DEP.DEP_NO 
WHERE D.PLACE = DEP.LOC;

NAME            FNAME
--------------- ---------------
Simpson         Anu


-- 21. FIND COMPANY LOCATION OF EMPLOYEE NAMED WATSON.
SELECT DEP.LOC 
FROM EMPLOYEE E,DEPARTMENT DEP 
WHERE E.NAME = 'Watson' 
AND E.DEP_NO = DEP.DEP_NO; 

LOC
---------------
Cochin



-- 22. FIND NAME, EMPNO,DEP-NAME FOR ALL EMPLOYEE WHO WORK IN ‘TRICHUR’ AND ORDER BY EMPNO IN DESCENDING ORDER.
SELECT E.NAME, E.EMPNO, DEP.DEP_NAME 
FROM EMPLOYEE E, DEPARTMENT DEP 
WHERE E.DEP_NO = DEP.DEP_NO 
AND DEP.LOC = 'Trichur' 
ORDER BY E.EMPNO DESC;

NAME                 EMPNO DEP_NAME
--------------- ---------- ---------------
Alan                   109 Sales
Smitha                 101 Sales


-- 23. RETRIEVE NAME AND SALARY OF ALL EMPLOYEE WHO EARNED MORE THAN AVERAGE SALARY.
SELECT NAME, SALARY FROM EMPLOYEE 
WHERE SALARY > 
(
  SELECT AVG(SALARY) 
  FROM EMPLOYEE
);

NAME                SALARY
--------------- ----------
Roy                  35000
Watson               45000
Alan                 30000
Karthika             29000
Rita                 36500
Deepa                27000
Soosan               28500

7 rows selected.


-- 24. FIND THE EMPNAME,DEP,NAME OF ALL MANAGER ORDER BY DEPARTMENT NAME.
SELECT E.NAME , D.DEP_NAME 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEP_NO = D.DEP_NO 
WHERE E.JOB = 'MNGR' 
ORDER BY D.DEP_NAME;

NAME            DEP_NAME
--------------- ---------------
Karthika        Accounting
Rita            Manufacturing
Watson          Research
Alan            Sales


-- 25. FIND NAME AND DEP-NAME OF EMPLOYEE WHO EARNS HIGHEST SALARY.
SELECT E.NAME , D.DEP_NAME 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEP_NO = D.DEP_NO 
WHERE E.SALARY = 
(
  SELECT MAX(SALARY) 
  FROM EMPLOYEE
);

NAME            DEP_NAME
--------------- ---------------
Watson          Research

-- 26. FIND NAME, DEPARTMENT NAME, COMMISSION OF ALL EMPLOYEE WHO PAID COMMISSION ORDER BY NAME. 
SELECT E.NAME , D.DEP_NAME , E.COMM 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEP_NO = D.DEP_NO 
WHERE E.COMM IS NOT NULL 
ORDER BY E.NAME;

NAME            DEP_NAME        COMM
--------------- --------------- ---------------
Alan            Sales           8000
Smitha          Sales           1300
Soosan          Shipping        5300
Watson          Research        0



-- 27. DISPLAY EMPLOYEE NAME AND DEPARTMENT NAME OF ALL EMPLOYEES WORKING IN DEPARTMENTS THAT HAS AT LEAST THREE EMPLOYEES. ORDER THE OUTPUT IN ALPHABETICAL ORDER FIRST BY DEPARTMENT NAME AND THEN BY EMPLOYEE NAME. 
SELECT E.NAME, D.DEP_NAME 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEP_NO = D.DEP_NO 
WHERE D.DEP_NO IN 
( 
  SELECT DEP_NO 
  FROM EMPLOYEE 
  GROUP BY DEP_NO 
  HAVING COUNT(*) >= 3
)
ORDER BY D.DEP_NAME, E.NAME;

NAME            DEP_NAME
--------------- ---------------
Karthika        Accounting
Manacy          Accounting
Wilson          Accounting
Deepa           Shipping
Simpson         Shipping
Soosan          Shipping

6 rows selected.


-- 28. FIND NAME, DEPARTMENT NAME AND COMMISSION OF ALL EMPLOYEES WHO NOT PAID COMMISSION ORDER BY NAME.
SELECT E.NAME , D.DEP_NAME , E.COMM 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEP_NO = D.DEP_NO 
WHERE E.COMM IS NULL 
ORDER BY E.NAME; 

NAME            DEP_NAME        COMM
--------------- --------------- ---------------
Deepa           Shipping
Karthika        Accounting
Manacy          Accounting
Rita            Manufacturing
Roy             Research
Simpson         Shipping
Tina            Manufacturing
Wilson          Accounting

8 rows selected.



-- 29. LIST NAME AND SALARY OF ALL EMPLOYEE IN DEPARTMENT NUMBER 10 AND 30.
SELECT NAME , SALARY 
FROM EMPLOYEE 
WHERE DEP_NO IN (10,30);

NAME                SALARY
--------------- ----------
Wilson               17000
Roy                  35000
Watson               45000
Karthika             29000
Manacy               16250



-- 30. LIST JOBS OF EMPLOYEES IN DEPARTMENT 30 WHICH ARE NOT DONE IN DEPARTMENT 40.
SELECT DISTINCT JOB 
FROM EMPLOYEE 
WHERE DEP_NO = 30 
EXCEPT SELECT DISTINCT JOB 
FROM EMPLOYEE  
WHERE DEP_NO = 40;

JOB
---------------
ANLST


-- 31. LIST OUT JOB AND SALARY OF EMPLOYEES IN DEPARTMENT 10 AND 40 WHO DRAW THE SAME SALARY  (RESULT- NO RECORD FOUND). 
SELECT E1.JOB, E2.SALARY 
FROM EMPLOYEE E1 
JOIN EMPLOYEE E2 ON E1.SALARY=E2.SALARY 
WHERE E1.DEP_NO = 10 
AND E2.DEP_NO = 40;

no rows selected


-- 32. CREATE A VIEW TO DISPLAY EMPNO' NAME ' JOB OF EMPLOYEE FROM EMPLOYEE TABLE WHO WORKS AS MANAGER.
CREATE VIEW MANAGER AS 
SELECT EMPNO , NAME , JOB 
FROM EMPLOYEE 
WHERE JOB = 'MNGR';

View created.

SELECT * FROM MANAGER;

     EMPNO NAME            JOB
---------- --------------- ---------------
       105 Watson          MNGR
       109 Alan            MNGR
       200 Karthika        MNGR
       210 Rita            MNGR


-- 33. SELECT EMPNO, NAME,JOB AND SALARY OF EMPLOYEE WHO WORKS AS CLERK AND HAVING SALARY GREATER THAN 1650.
SELECT EMPNO , NAME , JOB , SALARY 
FROM EMPLOYEE 
WHERE JOB = 'CLERK' 
AND SALARY > 1650;

     EMPNO NAME            JOB                 SALARY
---------- --------------- --------------- ----------
       100 Wilson          CLRK                 17000
       110 Tina            CLRK                 18000
       213 Manacy          CLRK                 16250


-- 34. CREATE AN INDEX FOR COLUMN FNAME AND LNAME IN DEPENDANT  TABLE.
CREATE INDEX DEPENDANT_NAME ON 
DEPENDANT (FNAME , LNAME);

Index created.

SELECT INDEX_NAME, TABLE_NAME 
FROM ALL_INDEXES 
WHERE TABLE_NAME = 'DEPENDANT';

INDEX_NAME
-------------------------------------------------------------------------------- 
TABLE_NAME
-------------------------------------------------------------------------------- 
SYS_C008354
DEPENDANT

DEPENDANT_NAME
DEPENDANT


-- 35. DELETE PERSON WITH ID=1031 IN DEPENDANT TABLE. 
DELETE FROM DEPENDANT 
WHERE PID = 1031;

1 row deleted.

SELECT * FROM DEPENDANT;

       PID FNAME           LNAME           PLACE                EMPNO
---------- --------------- --------------- --------------- ----------
      1010 Anu             Jose            Trivandrum             214
      1020 Neenu           Thomas          Kollam                 200
      1022 AnamikA         Thampi          Kollam                 200


-- 36. RETURN EMPNO,NAME AND SALARY OF ANY ONE  OF THE FEMALES IN DEPARTMENT 10. 

SELECT EMPNO, NAME, SALARY 
FROM EMPLOYEE 
WHERE DEP_NO = 10 
AND SEX = 'F' 
AND ROWNUM = 1;

     EMPNO NAME                SALARY
---------- --------------- ----------
       200 Karthika             29000


-- 37. DELETE THE EMPLOYEE KARTHIKA WITH ALL HER DEPENDANTS.
DELETE FROM DEPENDANT 
WHERE EMPNO IN 
(
  SELECT EMPNO 
  FROM EMPLOYEE 
  WHERE NAME = 'Karthika'
);

2 rows deleted.

SELECT * FROM DEPENDANT;

       PID FNAME           LNAME           PLACE                EMPNO
---------- --------------- --------------- --------------- ----------
      1010 Anu             Jose            Trivandrum             214