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
