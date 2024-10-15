-- EXPERIMENT 12 - TRIGGER TOTAL AND AVERAGE MARKS

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 15/10/2024

-- AIM
-- GIVEN STUDENTS REPORT DATABASE IN WHICH STUDENT MARKS ASSESSMENT IS RECORDED. IN SUCH SCHEMA CREATE A TRIGGER SO THAT THE TOTAL AND AVERAGE OF SEPCIFIED MARKS IS AUTOMATICALLY INSERTED WHEREVER A RECORD IS INSERTED.
-- STUDENT(SID,NAME,SUBJ1,SUBJ2,SUBJ3,TOTAL,AVG)
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE Student3 (
    sid INT NOT NULL,
    name VARCHAR(8),
    subj1 NUMBER(5,2),
    subj2 NUMBER(5,2),
    subj3 NUMBER(5,2),
    total NUMBER(5,2),
    avg NUMBER(5,2)
);
----------------------------------------------------------------

--PROGRAM
SET SERVEROUTPUT ON
create or replace trigger tri_st
before insert or update of  subj1,subj2,subj3 on Student3
for each row

DECLARE
	v_tot number(5,2);
	v_avg number(5,2);
BEGIN
	v_tot:=(:NEW.subj1+:NEW.subj2+:NEW.subj3);
	v_avg:=v_tot/3;
	:NEW.total:=v_tot;
	:NEW.avg:=v_avg;
END;
/

----------------------------------------

--OUTPUT
Trigger created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES (1,'JENNY',9,7,5);

1 row created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES(2,'JASON',8,6,9);

1 row created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES(3,'LUCY',6,5,7);

1 row created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES(4,'DAVID',11,9,8);

1 row created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES(5,'SARAH',7,6,9);

1 row created.

SQL> INSERT INTO Student3 (SID,NAME,SUBJ1,SUBJ2,SUBJ3) VALUES(6,'EMILY',8,7,6);

1 row created.


SQL> SELECT * FROM student3;

       SID NAME          SUBJ1      SUBJ2      SUBJ3      TOTAL        AVG
---------- -------- ---------- ---------- ---------- ---------- ----------
         1 JENNY             9          7          5         21          7
         2 JASON             8          6          9         23       7.67
         3 LUCY              6          5          7         18          6
         4 DAVID            11          9          8         28       9.33
         5 SARAH             7          6          9         22       7.33
         6 EMILY             8          7          6         21          7

6 rows selected.
---------------------------------------------------
