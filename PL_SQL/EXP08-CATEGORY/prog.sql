SET SERVEROUTPUT ON

DECLARE
    balance NUMBER(10);
    Category VARCHAR(10);


    FUNCTION categorize_customer (CID IN NUMBER, bal IN NUMBER)
    RETURN VARCHAR IS
        Category VARCHAR(10);
    BEGIN
        
        IF bal <= 10000 THEN
            Category := 'Silver'; 
            RETURN Category;
        ELSIF bal <= 50000 THEN
            Category := 'Gold' ;
            RETURN Category;
        ELSE
            Category := 'Platinum';
            RETURN Category;
        END IF;
    END;
BEGIN

    FOR customer_rec IN (SELECT CID, bal, Category FROM customer_account) LOOP
        DBMS_OUTPUT.PUT_LINE('CID: ' || customer_rec.CID ||', bal: '||customer_rec.bal ||', Category: ' || categorize_customer(customer_rec.CID,customer_rec.bal));
    END LOOP;

END;
/