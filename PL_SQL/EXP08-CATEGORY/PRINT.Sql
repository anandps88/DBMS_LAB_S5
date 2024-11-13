-- EXPERIMENT 8 - CUSTOMER CATEGORIZATION

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 03/09/2024

-- AIM
-- CREATE A PL/SQL BLOCK FOR CREATING A FUNCTION DC THAT DETERMINES THE CATEGORY/TYPE OF CUSTOMER AFTER  VERIFYING  THEIR  ACCOUNT  BALANCE.  THE  FOLLOWING  ARE  THE  CATEGORIES  CATEGORY  PLATINUM(FOR ACCOUNT BALANCE GREATER THAN 50K) , GOLD (ACCOUNT BALANCE LESS THAN OR EQUAL TO 50K BUT GREATER THAN 10K)  ,SILVER(FOR  ACCOUNT  BALANCE  LESS  THAN  OR  EQUAL  TO  10K).  ASSUME  NECESSARY  ATTRIBUTES  IN CUSTOMER. WRITE A QUERY TO RETRIEVE THE DETAILS OF CUSTOMERS ALONG WITH CUSTOMER CATEGORY(USING THE CREATED FUNCTION DC) 
 ----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE customer_account (
    CID NUMBER(5) NOT NULL PRIMARY KEY,
    bal NUMBER(10)
);

INSERT INTO customer_account VALUES (6901, 10340);
INSERT INTO customer_account VALUES (6950, 7830);
INSERT INTO customer_account VALUES (7001, 45000);
INSERT INTO customer_account VALUES (8756, 69000);
INSERT INTO customer_account VALUES (4200, 500);
INSERT INTO customer_account VALUES (6902, 12003);
INSERT INTO customer_account VALUES (2030, 78030);
----------------------------------------------------------------

--PROGRAM
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
----------------------------------------

--OUTPUT
CID: 6901, bal: 10340, Category: Gold
CID: 6950, bal: 7830, Category: Silver
CID: 7001, bal: 45000, Category: Gold
CID: 8756, bal: 69000, Category: Platinum
CID: 4200, bal: 500, Category: Silver
CID: 6902, bal: 12003, Category: Gold
CID: 2030, bal: 78030, Category: Platinum

PL/SQL procedure successfully completed.
---------------------------------------------------