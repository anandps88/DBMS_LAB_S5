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