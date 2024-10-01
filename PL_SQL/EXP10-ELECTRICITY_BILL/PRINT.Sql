-- EXPERIMENT 10 - ELECTRICITY BILL

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 01/10/2024

-- AIM
-- WRITE A PL/SQL PROGRAM USING CURSOR TO PRINT THE ELECTRICITY BILL OF THE CONSUMER 
--
--  UNIT CONSUMED       CHARGE
--  1-100               			5
--  101-300           		  	7.5
--  301-500             			15
--  >501                			22.5
--
-- ACCEPT THE CONSUMER NUMBER , PRESENT AND PAST READING OF THE UNIT CONSUMED BY THE CUSTOMER
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE ELECTRICITY_CHARGE (
    unit_consumed VARCHAR(10) NOT NULL PRIMARY KEY,
    charge NUMBER(10)
);

INSERT INTO ELECTRICITY_CHARGE VALUES('1-100', 5);
INSERT INTO ELECTRICITY_CHARGE VALUES('101-300', 7.5);
INSERT INTO ELECTRICITY_CHARGE VALUES('301-500', 15);
INSERT INTO ELECTRICITY_CHARGE VALUES('>501', 22.5);

create table ELECTRICITY_USER (
    user_id NUMBER(5) NOT NULL PRIMARY KEY,
    user_name VARCHAR(30),
    unit_consumed NUMBER(10)
);

INSERT INTO ELECTRICITY_USER VALUES(1001, 'Alice',150);
INSERT INTO ELECTRICITY_USER VALUES(1002, 'Bob', 550);
INSERT INTO ELECTRICITY_USER VALUES(1003, 'Charlie', 75);
INSERT INTO ELECTRICITY_USER VALUES(1004, 'David', 149);
INSERT INTO ELECTRICITY_USER VALUES(1005, 'Eve', 342);
INSERT INTO ELECTRICITY_USER VALUES(1006, 'Frank', 69);
INSERT INTO ELECTRICITY_USER VALUES(1007, 'Grace', 769);
INSERT INTO ELECTRICITY_USER VALUES(1008, 'Hannah', 88);
INSERT INTO ELECTRICITY_USER VALUES(1009, 'Ivy', 232);
INSERT INTO ELECTRICITY_USER VALUES(1010, 'Jack', 499); 
----------------------------------------------------------------

--PROGRAM
SET SERVEROUTPUT ON;

DECLARE
    v_user_id NUMBER := &user_id;  
    user_record electricity_user%ROWTYPE;
    charge_rate NUMBER(10, 2);
    total_bill NUMBER(10, 2);

BEGIN
    SELECT user_id, user_name, unit_consumed
    INTO user_record
    FROM electricity_user
    WHERE user_id = v_user_id;

    SELECT charge INTO charge_rate
    FROM electricity_charge
    WHERE 
        (user_record.unit_consumed BETWEEN 1 AND 100 AND unit_consumed = '1-100') OR
        (user_record.unit_consumed BETWEEN 101 AND 300 AND unit_consumed = '101-300') OR
        (user_record.unit_consumed BETWEEN 301 AND 500 AND unit_consumed = '301-500') OR
        (user_record.unit_consumed > 500 AND unit_consumed = '>501');

    total_bill := user_record.unit_consumed * charge_rate;

    DBMS_OUTPUT.PUT_LINE('User ID: ' || user_record.user_id );
    DBMS_OUTPUT.PUT_LINE('Name: ' || user_record.user_name );
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || user_record.unit_consumed );
    DBMS_OUTPUT.PUT_LINE('Total Bill: ' || TO_CHAR(total_bill, '9999999.99'));

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No user found with the given ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


----------------------------------------

--OUTPUT
Enter value for user_id: 1004
old   2:     v_user_id NUMBER := &user_id;
new   2:     v_user_id NUMBER := 1004;
User ID: 1004
Name: David
Units Consumed: 149
Total Bill:     1192.00

PL/SQL procedure successfully completed.
---------------------------------------------------
