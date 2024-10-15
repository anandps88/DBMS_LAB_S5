-- EXPERIMENT 13 A - RAILWAY RESERVATION : COMMIT & ROLLBACK 

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 01/10/2024

-- AIM
-- PERFORM COMMIT AND ROLLBACK OPERATIONS IN THE TRAIN TABLE. THE TRAIN NUMBER SHOULD BE AUTOMATICALLY INCREMENTED FOR EACH ROW INSERTION
-- TRAIN(TNO,TNAME,TDATE,DESTINATION,SEATS)
----------------------------------------------------------------

----------------------------------------------------------------

-- TABLE CREATION
CREATE  TABLE Train (
    TrainNo NUMBER PRIMARY KEY,
    TName VARCHAR(15),
    TDate DATE,
    Destination VARCHAR(15),
    Seats NUMBER
);


CREATE SEQUENCE TrainNo_seq
START WITH 1
INCREMENT BY 1;

----------------------------------------------------------------

-- TRIGGER CREATION
CREATE OR REPLACE TRIGGER TrainNo_trigger
BEFORE INSERT ON Train
FOR EACH ROW
BEGIN
    SELECT TrainNo_seq.NEXTVAL INTO :NEW.TrainNo FROM dual;
END;
/
Trigger created.

-----------------------------------------------------------------


INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Express', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Delhi', 100);
COMMIT;
INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Nirvana', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Doha', 150);


INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Gaadi', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Shimla', 150);
ROLLBACK;


SELECT * FROM Train;



SQL> INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Express', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Delhi', 100);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Nirvana', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Doha', 150);

1 row created.

SQL> SELECT * FROM Train;

   TRAINNO TNAME           TDATE              DESTINATION          SEATS
---------- --------------- ------------------ --------------- ----------
         4 Express         01-OCT-23          Delhi                  100
         5 Nirvana         02-OCT-23          Doha                   150

SQL> INSERT INTO Train (TName, TDate, Destination, Seats) VALUES ('Gaadi', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Shimla', 150);

1 row created.

SQL> SELECT * FROM Train;

   TRAINNO TNAME           TDATE              DESTINATION          SEATS
---------- --------------- ------------------ --------------- ----------
         4 Express         01-OCT-23          Delhi                  100
         5 Nirvana         02-OCT-23          Doha                   150
         6 Gaadi           02-OCT-23          Shimla                 150

SQL> ROLLBACK;

Rollback complete.
