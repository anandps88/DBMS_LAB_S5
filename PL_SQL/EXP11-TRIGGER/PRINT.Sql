-- EXPERIMENT 11 - STUDENT DATA MANIPULATION USING TRIGGERS

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 15/10/2024

-- AIM
-- CREATE A TRIGGER TO PRINT THE FOLLOWING MESSAGES WHEN INSERT,DELETE OR UPDATE OPERATION IS PERFORMED ON STUDENTS TABLE MENTIONED IN THE PREVIOUS EXPERIMENT FOR EACH TUPLE THAT IS INSERTED, DELETED OR UPDATED. ASSUME THAT THE SEMESTER GRADES OF S1 AND S2 ARE STORED IN STUDENTS TABLE ALONG WITH THE ROLL NUMBER AND NAME OF STUDENTS.
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE student2 (
    rollno INT NOT NULL,
    name VARCHAR(20),
    grade1 INT NOT NULL,
    grade2 INT NOT NULL
);

----------------------------------------------------------------

--PROGRAM
SET SERVEROUTPUT ON

CREATE OR REPLACE TRIGGER STUD_TRIG
AFTER INSERT OR DELETE OR UPDATE OF ROLLNO,NAME,GRADE1,GRADE2 ON STUDENT2

FOR EACH ROW
DECLARE 
    V_MSG VARCHAR(20);
BEGIN
    IF INSERTING THEN
        V_MSG := 'Inserting '||:NEW.NAME;
    ELSIF DELETING THEN
        V_MSG := 'Deleting '||:OLD.NAME;
    ELSIF UPDATING THEN 
        IF :NEW.NAME != :OLD.NAME THEN
            DBMS_OUTPUT.PUT_LINE('Updated to '||:NEW.NAME||' Previous value '||:OLD.NAME);
            IF :OLD.GRADE1 != :NEW.GRADE1 THEN
                DBMS_OUTPUT.PUT_LINE('Previous value '||:OLD.GRADE1||'   Current value of Grade 1 '||:NEW.GRADE1||'  Current value of Grade 2 '||:NEW.GRADE2);
            END IF;
            IF :OLD.GRADE2 != :NEW.GRADE2 THEN
                DBMS_OUTPUT.PUT_LINE('Previous value '||:OLD.GRADE2||'   Current value of Grade 2 '||:NEW.GRADE2||'  Current value of Grade 1 '||:NEW.GRADE1);
            END IF;
        ELSE
            V_MSG := 'Update '||:NEW.NAME;
            IF :OLD.GRADE1 != :NEW.GRADE1 THEN
                DBMS_OUTPUT.PUT_LINE('Previous value '||:OLD.GRADE1||'    Current value of Grade 1 '||:NEW.GRADE1||'   Current value of Grade 2 '||:NEW.GRADE2);
            END IF;
            IF :OLD.GRADE2 != :NEW.GRADE2 THEN
                DBMS_OUTPUT.PUT_LINE('Previous value '||:OLD.GRADE2||'   Current value of Grade 2 '||:NEW.GRADE2||'    Current value of Grade 1 '||:NEW.GRADE1);
            END IF;
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_MSG);
END;
/


----------------------------------------

--OUTPUT
Trigger created.

SQL> INSERT INTO student2 VALUES (1, 'Aisha', 7, 8);
Inserting Aisha

1 row created.

SQL> INSERT INTO student2 VALUES (10, 'Kavin', 9, 9);
Inserting Kavin

1 row created.

SQL> INSERT INTO student2 VALUES (4, 'Nalini', 8, 7);
Inserting Nalini

1 row created.

SQL> INSERT INTO student2 VALUES (8, 'Suresh', 5, 6);
Inserting Suresh

1 row created.

SQL> INSERT INTO student2 VALUES (7, 'Ramesh', 6, 4);
Inserting Ramesh

1 row created.

SQL> INSERT INTO student2 VALUES (9, 'Saranya', 7, 9);
Inserting Saranya

1 row created.

SQL> DELETE FROM student2;    
Deleting Aisha
Deleting Kavin
Deleting Nalini
Deleting Suresh
Deleting Ramesh
Deleting Saranya

---------------------------------------------------
