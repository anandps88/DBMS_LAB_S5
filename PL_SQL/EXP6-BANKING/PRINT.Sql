-- EXPERIMENT 6 - BANKING SYSTEM

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 27/08/2024

-- AIM
-- WRITE A PL/SQL PROGRAM TO IMPLEMENT THE FOLLOWING OPERATIONS IN A BANKING SYSTEM
-- A. CREDIT , DEBIT AND SHOW BALANCE
-- B. IF THE ACCOUNT HAS MIN BLANACE OF 500 ALERT USER
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE accounts (
    acc_num NUMBER(5) NOT NULL PRIMARY KEY,
    bal NUMBER(10)
);

INSERT INTO accounts values(1245,10000);
INSERT INTO accounts values(6980,50000);
INSERT INTO accounts values(7245,2000);
------------------------------------------------


--PROGRAM
SET SERVEROUTPUT ON
ACCEPT acc NUMBER PROMPT 'Enter Account Number : ';

DECLARE
    balance Number(10);
    min_bal Number(10);
    debit NUMBER;
    credit NUMBER;

BEGIN
    
    debit := &debit;
    UPDATE accounts SET bal=bal-debit WHERE acc_num=&acc;
    credit := &credit;
    UPDATE accounts SET bal=bal+credit WHERE acc_num=&acc;
    SELECT bal INTO balance FROM accounts where acc_num=&acc;
    DBMS_OUTPUT.PUT_LINE('Balance : '||balance);
    if balance<500 then
        dbms_output.put_line('Warning! Maintain Minimum Balance! ');
    END if;
END;
/
----------------------------------------

--OUTPUT
Enter Account Number : 1245
Enter value for debit: 2000
old   9:     debit := &debit;
new   9:     debit := 2000;
old  10:     UPDATE accounts SET bal=bal-debit WHERE acc_num=&acc;
new  10:     UPDATE accounts SET bal=bal-debit WHERE acc_num=          1245;
Enter value for credit: 300
old  11:     credit := &credit;
new  11:     credit := 300;
old  12:     UPDATE accounts SET bal=bal+credit WHERE acc_num=&acc;
new  12:     UPDATE accounts SET bal=bal+credit WHERE acc_num=          1245;
old  13:     SELECT bal INTO balance FROM accounts where acc_num=&acc;
new  13:     SELECT bal INTO balance FROM accounts where acc_num=      1245;
Balance : 8300

PL/SQL procedure successfully completed.
---------------------------------------------------