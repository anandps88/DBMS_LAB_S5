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
