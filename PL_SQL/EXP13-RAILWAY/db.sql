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