-- EXPERIMENT 4 - CUSTOMER RELATIONS 

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 06/08/2024

-- AIM
-- WRITE QUERIES TO CREATE AND RETRIEVE DATA FROM THE CUSTOMER RELATION USING STRING OPERATIONS
----------------------------------------------------------------

----------------------------------------------------------------


-- CREATING TABLES

-- CUSTOMER TABLE
CREATE TABLE CUSTOMER ( Cust_ID INT PRIMARY KEY NOT NULL, Cust_name VARCHAR2(15) NOT NULL, City VARCHAR2(15) NOT NULL, Amount INT NOT NULL, Discount INT NOT NULL, Salesman_ID VARCHAR2(15));


--INSERTING VALUES

-- CUSTOMER TABLE
INSERT INTO CUSTOMER VALUES (100, 'Deepa', 'Trivandrum', 1050, 2, 'K0010');
INSERT INTO CUSTOMER VALUES (101, 'Don', 'Trivandrum', 8040, 4, 'K0010');
INSERT INTO CUSTOMER VALUES (102, 'Manacy', 'Kollam', 20030, 6, 'A200tmp');
INSERT INTO CUSTOMER VALUES (103, 'Karthika', 'Ernakulam', 8400, 20, 'EkmX1050');
INSERT INTO CUSTOMER VALUES (104, 'Tulasi', 'Ernakulam', 2500, 2, 'EkmY2342');
INSERT INTO CUSTOMER VALUES (105, 'Roy', 'Trivandrum', 2900, 4, 'L1045');
INSERT INTO CUSTOMER VALUES (106, 'Vivek', 'Trivandrum', 3200, 8, 'L1045');
INSERT INTO CUSTOMER VALUES (108, 'Bhasi', 'Kottayam', 12860, 10, 'KtmP1028');
INSERT INTO CUSTOMER VALUES (109, 'Anurag', 'Kottayam', 3860, 12, 'KtmB158tmp');
INSERT INTO CUSTOMER VALUES (110, 'antony', 'Kottayam', 9800, 8, 'KtmP1028');
INSERT INTO CUSTOMER VALUES (111, 'Meeran', 'Trichur', 6700, 6, 'R3085');


-- -------------------------------
-- QUERIES
-- -------------------------------



-- 1.  SELECT ALL CUSTOMERS WITH A CUSTOMERNAME STARTING WITH "a"
SELECT * 
FROM CUSTOMER 
WHERE Cust_name LIKE 'a%';

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       110 antony          Kottayam              9800          8 KtmP1028


-- 2.  SELECT ALL CUSTOMERS WITH A CUSTOMERNAME STARTING WITH "a"  OR "A"
SELECT *
FROM CUSTOMER
WHERE Cust_name LIKE 'a%' 
OR Cust_name LIKE 'A%';

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       109 Anurag          Kottayam              3860         12 KtmB158tmp
       110 antony          Kottayam              9800          8 KtmP1028


-- 3.  MODIFY CUSTOMER NAMES SUCH THAT ALL CUSTOMER NAMES START WITH A CAPITAL LETTER
UPDATE CUSTOMER
SET Cust_name = INITCAP(Cust_name);

11 rows updated.

SELECT CUST_ID,CUST_NAME FROM CUSTOMER;

   CUST_ID CUST_NAME
---------- ---------------
       100 Deepa
       101 Don
       102 Manacy
       103 Karthika
       104 Tulasi
       105 Roy
       106 Vivek
       108 Bhasi
       109 Anurag
       110 Antony
       111 Meeran

11 rows selected.

-- 4.  FIND CITY VALUES  ENDING WITH "a"
SELECT *
FROM CUSTOMER
WHERE CITY LIKE '%a';

no rows selected

-- 5.  RETURN FIRST 3 CHARACTERS OF SALESMAN_ID
SELECT SUBSTR(Salesman_ID, 1, 3) 
FROM CUSTOMER;    

SUBSTR(SALES
------------
K00
K00
A20
Ekm
Ekm
L10
L10
Ktm
Ktm
Ktm
R30

11 rows selected.

-- 6.  FINDS SALESMANIDS  WITH "tmp" IN ANY POSITION
SELECT *
FROM CUSTOMER
WHERE Salesman_ID LIKE '%tmp%';

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       102 Manacy          Kollam               20030          6 A200tmp
       109 Anurag          Kottayam              3860         12 KtmB158tmp



-- 7.  FIND COUNT OF  CITY VALUES THAT START WITH "T"
SELECT COUNT(*)
FROM CUSTOMER
WHERE CITY LIKE 'T%';

  COUNT(*)
----------
         5


-- 8.  SELECT CUSTOMER NAMES STARTING WITH D AND OF ATLEAST 4 CHARACTERS
SELECT *
FROM CUSTOMER
WHERE CUST_NAME LIKE 'D%' AND LENGTH(CUST_NAME) >= 4;

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       100 Deepa           Trivandrum            1050          2 K0010


-- 9.  FINDS CITY VALUES THAT START WITH "K" AND ARE AT LEAST 2 CHARACTERS IN LENGTH
SELECT *
FROM CUSTOMER
WHERE CITY LIKE 'K%' AND LENGTH(CITY) >= 2;

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       102 Manacy          Kollam               20030          6 A200tmp
       108 Bhasi           Kottayam             12860         10 KtmP1028
       109 Anurag          Kottayam              3860         12 KtmB158tmp
       110 Antony          Kottayam              9800          8 KtmP1028


-- 10. FINDS CITY VALUES THAT START WITH "K" AND ARE AT LEAST 7 CHARACTERS IN LENGTH     
SELECT *
FROM CUSTOMER
WHERE CITY LIKE 'K%' AND LENGTH(CITY) >= 7;

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       108 Bhasi           Kottayam             12860         10 KtmP1028
       109 Anurag          Kottayam              3860         12 KtmB158tmp
       110 Antony          Kottayam              9800          8 KtmP1028

-- 11. FINDS CITY VALUES THAT START WITH "K" AND ENDS WITH "m" 
SELECT *
FROM CUSTOMER
WHERE CITY LIKE 'K%m';

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       102 Manacy          Kollam               20030          6 A200tmp
       108 Bhasi           Kottayam             12860         10 KtmP1028
       109 Anurag          Kottayam              3860         12 KtmB158tmp
       110 Antony          Kottayam              9800          8 KtmP1028


-- 12. DISPLAY SALESMAN DETAILS WITH SALESMAN_ID, TOTAL AMOUNT GIVEN AS DISCOUNT AND MAXIMUM DISCOUNT PROVIDED BY HIM IN PERCENTAGE WITH '%' SYMBOL
SELECT SALESMAN_ID, SUM(AMOUNT) AS TOTAL_AMOUNT, CONCAT(MAX(DISCOUNT),'%') AS MAX_DISCOUNT
FROM CUSTOMER
GROUP BY SALESMAN_ID;

SALESMAN_ID     TOTAL_AMOUNT MAX_DISCOUNT
--------------- ------------ -----------------------------------------
A200tmp                20030 6%
EkmX1050                8400 20%
KtmB158tmp              3860 12%
R3085                   6700 6%
KtmP1028               22660 10%
K0010                   9090 4%
L1045                   6100 8%
EkmY2342                2500 2%

8 rows selected.

-- 13. DISPLAY CITY NAMES IN UPPERCASE
SELECT UPPER(CITY) AS CITY
FROM CUSTOMER;

CITY
---------------
TRIVANDRUM
TRIVANDRUM
KOLLAM
ERNAKULAM
ERNAKULAM
TRIVANDRUM
TRIVANDRUM
KOTTAYAM
KOTTAYAM
KOTTAYAM
TRICHUR

11 rows selected.


-- 14. UPDATE SALESMAN_ID OF ALL SALESMAN FROM ERNAKULAM BY REMOVING THE PREFIX "Ekm"
UPDATE CUSTOMER
SET SALESMAN_ID = SUBSTR(SALESMAN_ID, 3)
WHERE CITY LIKE 'Ernakulam';

2 rows updated.

SELECT * FROM CUSTOMER WHERE CITY LIKE 'Ernakulam';

   CUST_ID CUST_NAME       CITY                AMOUNT   DISCOUNT SALESMAN_ID
---------- --------------- --------------- ---------- ---------- ---------------
       103 Karthika        Ernakulam             8400         20 mX1050
       104 Tulasi          Ernakulam             2500          2 mY2342



-- 15. DISPLAY TOTAL SALES AMOUNT OF EACH SALESPERSON  TILL TODAY WITH TODAY'S DATE IN DD-MON-YYYY
SELECT SALESMAN_ID, SUM(AMOUNT) AS TOTAL_SALES, TO_CHAR(SYSTIMESTAMP, 'DD-MM-YYYY')
FROM CUSTOMER
GROUP BY SALESMAN_ID;

SALESMAN_ID     TOTAL_SALES TO_CHAR(SY
--------------- ----------- ----------
mY2342                 2500 06-08-2024
A200tmp               20030 06-08-2024
KtmB158tmp             3860 06-08-2024
R3085                  6700 06-08-2024
KtmP1028              22660 06-08-2024
K0010                  9090 06-08-2024
mX1050                 8400 06-08-2024
L1045                  6100 06-08-2024

8 rows selected.