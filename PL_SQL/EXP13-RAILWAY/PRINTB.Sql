-- EXPERIMENT 13 B - RAILWAY RESERVATION : PROCEDURES

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 01/10/2024

-- AIM

-- WRITE A PL/SQL PROGRAM TO IMPLEMENT THE RAILWAY RESERVATION SYSTEM WITH PROCEDURE FOR RESERVATION AND CANCELLATION
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE Train (
  TNO NUMBER PRIMARY KEY,
  Tname VARCHAR2(20),
  TDate DATE,
  Destination VARCHAR2(20),
  Seats NUMBER
);

CREATE SEQUENCE TrainSeq
START WITH 1
INCREMENT BY 1;

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express1', TO_DATE('15-OCT-2024', 'DD-MON-YYYY'), 'City A', 200);

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express2', TO_DATE('01-NOV-2024', 'DD-MON-YYYY'), 'City B', 150);

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express3', TO_DATE('05-DEC-2024', 'DD-MON-YYYY'), 'Mountain Town', 120);

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express4', TO_DATE('20-OCT-2024', 'DD-MON-YYYY'), 'Coastal City', 180);

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express5', TO_DATE('15-NOV-2024', 'DD-MON-YYYY'), 'City C', 250);


INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express6', TO_DATE('10-JAN-2025', 'DD-MON-YYYY'), 'City D', 300);

INSERT INTO Train (TNO, Tname, TDate, Destination, Seats)
VALUES (TrainSeq.NEXTVAL, 'Express7', TO_DATE('25-FEB-2025', 'DD-MON-YYYY'), 'City E', 220);

----------------------------------------------------------------

--PROGRAM

-- PROCEDURE RESERVATION
CREATE OR REPLACE PROCEDURE ReserveTicket (
    P_train_number IN INT,
    p_seats_needed IN INT
) AS
    v_available_seats INT;
BEGIN
-- Check available seats for the specified train number
    SELECT Seats INTO v_available_seats
    FROM Train
    WHERE TNO = P_train_number;

    -- If seats are available, reserve them
    IF v_available_seats >= p_seats_needed THEN
        UPDATE Train
        SET Seats = Seats - p_seats_needed
        WHERE TNO = P_train_number;
        
        COMMIT;

        DBMS_OUTPUT.PUT_LINE(p_seats_needed || ' seats reserved successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sorry, not enough seats available.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid train number');
END ReserveTicket;
/
-- PROCEDURE CANCELLATION
CREATE OR REPLACE PROCEDURE CancelTicket (
    p_train_number IN INT,
    p_seats_cancel IN INT
) AS
BEGIN
    -- Update the Seats column by adding the cancelled seats
    UPDATE Train
    SET Seats = Seats + p_seats_cancel
    WHERE TNO = p_train_number;

    -- Check if any rows were updated
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid train number');
    ELSE
        COMMIT;  -- Commit the changes only if the update was successful
        DBMS_OUTPUT.PUT_LINE(p_seats_cancel || ' seats cancelled successfully');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END CancelTicket;
/


SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('1. TICKET RESERVATION');
    DBMS_OUTPUT.PUT_LINE('2. TICKET CANCELLATION');
END;
/

DECLARE
    train_no INT := &train_number;   
    seat_need INT := &seats_needed;   
    ch INT := &choice;                
BEGIN
    IF ch = 1 THEN
        ReserveTicket(train_no, seat_need);
    ELSIF ch = 2 THEN
        CancelTicket(train_no, seat_need);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter 1 for reservation or 2 for cancellation.');
    END IF;
END;
/

----------------------------------------

--OUTPUT
Procedure created.


Procedure created.

1. TICKET RESERVATION
2. TICKET CANCELLATION

PL/SQL procedure successfully completed.

Enter value for train_number: 1
old   2:     train_no INT := &train_number;
new   2:     train_no INT := 1;
Enter value for seats_needed: 4
old   3:     seat_need INT := &seats_needed;
new   3:     seat_need INT := 4;
Enter value for choice: 1
old   4:     ch INT := &choice;
new   4:     ch INT := 1;
4 seats reserved successfully.

PL/SQL procedure successfully completed.
---------------------------------------------------
