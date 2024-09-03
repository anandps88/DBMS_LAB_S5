-- EXPERIMENT 7 - CLASS AVERAGE

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 27/08/2024

-- AIM
-- WRITE A PL/SQL BLOCK TO FIND AVERAGE MARK OF STUDENTS IN A CLASS AND PRINT THE MARKS;PRINT A MESSAGE " NEED IMPROVEMENT " IF THE CLASS AVERAGE IS LESS THAN 40. AT THE BOTTOM PRINT TODAY'S DATE AND DAY OF THE WEEK (MONDAY, TUESDAY ETC.) 
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
Create table STUDENTS
(
    ROLLNO VARCHAR2(5) primary key,
    NAME VARCHAR2(20),
    MARKS NUMBER
);

INSERT INTO STUDENTS VALUES('S001','Rahul',90);
INSERT INTO STUDENTS VALUES('S002','Rohan',45);
INSERT INTO STUDENTS VALUES('S003','Sidhu',35);
INSERT INTO STUDENTS VALUES('S004','Sree',50);
------------------------------------------------


--PROGRAM
SET SERVEROUTPUT ON

DECLARE
    avg_marks NUMBER(10);
    nowdate DATE;
    nowday varchar2(10); 

BEGIN
    SELECT AVG(MARKS) INTO avg_marks FROM STUDENTS;
    DBMS_OUTPUT.PUT_LINE('Average Marks : '||avg_marks);
    if avg_marks<40 then
        dbms_output.put_line('Warning! Low Average Marks Needs Improvement! ');
    else
        dbms_output.put_line('Good Average Marks! Keep it up ! ');
    END if;
    nowdate := SYSDATE;
    DBMS_OUTPUT.PUT_LINE('Current Date : '||nowdate);
    nowday := TO_CHAR(nowdate,'DAY');
    DBMS_OUTPUT.PUT_LINE('Current Day : '||nowday);
END;
/
----------------------------------------

--OUTPUT
Average Marks : 55
Good Average Marks! Keep it up !
Current Date : 27-AUG-24
Current Day : TUESDAY

PL/SQL procedure successfully completed.
---------------------------------------------------