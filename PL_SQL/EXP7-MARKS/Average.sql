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