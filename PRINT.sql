-- EXPERIMENT 9 - HONOURS ELIGIBILITY

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 01/10/2024

-- AIM
-- CREATE A CURSOR THAT SHOWS THE DETAILS OF STUDENT ELIGIBLE FOR HONOURS IN ROLL NO ORDER. ASSUME THAT SEMESTER GRADES OF S1 AND S2 ARE STORED IN STUDENT TABLE ALONG WITH ROLL NO AND NAME OF STUDENTS. A STUDENT IS ELIGIBLE FOR HONOURS IF THE TOTAL GRADE FOR S1 AND S2 IS GREATER THAT 12 PRINT THE HIGHEST GRADE OBTAINED IN PREVIOUS SEMESTERS FOR HONOURS STUDENTS USING
 ----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE STD_HONORS (
    rollno NUMBER PRIMARY KEY,
    name VARCHAR(30),
    s1 NUMBER,
    s2 NUMBER
);

INSERT INTO STD_HONORS VALUES (52, 'Bob', 8,8);
INSERT INTO STD_HONORS VALUES (53, 'Charlie', 9, 4);
INSERT INTO STD_HONORS VALUES (51, 'Alice', 5, 2);
INSERT INTO STD_HONORS VALUES (54, 'David', 65, 70);
INSERT INTO STD_HONORS VALUES (55, 'Eve', 80, 85);
INSERT INTO STD_HONORS VALUES (56, 'Frank', 55, 60);
INSERT INTO STD_HONORS VALUES (57, 'Grace', 7, 8);
INSERT INTO STD_HONORS VALUES (58, 'Hannah', 88, 90);
INSERT INTO STD_HONORS VALUES (59, 'Ivy', 32, 94);
INSERT INTO STD_HONORS VALUES (510, 'Jack', 70, 5);
----------------------------------------------------------------

--PROGRAM
SET SERVEROUTPUT ON;

DECLARE
    CURSOR honor_students_cursor IS
        SELECT rollno, name, s1, s2
        FROM std_honors
        WHERE (s1 + s2) > 12
        ORDER BY rollno;

    roll std_honors.rollno%TYPE;
    sname std_honors.name%TYPE;
    s1m std_honors.s1%TYPE;
    s2m std_honors.s2%TYPE;
    tot NUMBER;
    maxs NUMBER := 0;

BEGIN
    OPEN honor_students_cursor;
    DBMS_OUTPUT.PUT_LINE('Students ELigible for honors : ');
    LOOP
        FETCH honor_students_cursor INTO roll, sname, s1m, s2m;
        
        EXIT WHEN honor_students_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Roll No: ' || roll || ', Name: ' || sname || ', S1: ' || s1m || ', S2: ' || s2m);
        tot:=s1m+s2m;
        DBMS_OUTPUT.PUT_LINE('Total Marks : '|| tot);

        IF s1m > maxs THEN
            maxs := s1m;
        END IF;

    END LOOP;

    CLOSE honor_students_cursor;
    DBMS_OUTPUT.PUT_LINE('.');
    DBMS_OUTPUT.PUT_LINE('Highest grade obtained in the previous semester for honor students: ' || maxs);
END;
/
----------------------------------------

--OUTPUT
Students ELigible for honors :
Roll No: 52, Name: Bob, S1: 8, S2: 8
Total Marks : 16
Roll No: 53, Name: Charlie, S1: 9, S2: 4
Total Marks : 13
Roll No: 54, Name: David, S1: 65, S2: 70
Total Marks : 135
Roll No: 55, Name: Eve, S1: 80, S2: 85
Total Marks : 165
Roll No: 56, Name: Frank, S1: 55, S2: 60
Total Marks : 115
Roll No: 57, Name: Grace, S1: 7, S2: 8
Total Marks : 15
Roll No: 58, Name: Hannah, S1: 88, S2: 90
Total Marks : 178
Roll No: 59, Name: Ivy, S1: 32, S2: 94
Total Marks : 126
Roll No: 510, Name: Jack, S1: 70, S2: 5
Total Marks : 75
.
Highest grade obtained in the previous semester for honor students: 88

PL/SQL procedure successfully completed.
---------------------------------------------------


