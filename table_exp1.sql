
CREATE TABLE PRODUCT (
  product_no VARCHAR(15) NOT NULL,
  description VARCHAR(50) NOT NULL,
  company VARCHAR(15) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (product_no)
);

CREATE TABLE CUSTOMER (
  cust_no VARCHAR(15) NOT NULL,
  name VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  city VARCHAR(15) NOT NULL,
  pincode INT NOT NULL,
  state VARCHAR(15) NOT NULL,
  PRIMARY KEY (cust_no)
);

CREATE TABLE SUPPLIER (
  s_no VARCHAR(10) NOT NULL,
  sname VARCHAR(15) NOT NULL,
  city VARCHAR(15) NOT NULL,
  PRIMARY KEY (s_no)
);

CREATE TABLE PURCHASE (
  order_no VARCHAR(15) NOT NULL,
  custno VARCHAR(15) NOT NULL,
  prono VARCHAR(15) NOT NULL,
  quantity INT NOT NULL,
  orderdate DATE,
  PRIMARY KEY (order_no),
  FOREIGN KEY (custno) REFERENCES CUSTOMER(cust_no),
  FOREIGN KEY (prono) REFERENCES PRODUCT(product_no)
);

INSERT INTO PRODUCT (product_no, description, company, price)
VALUES ('P00001', LEFT('12 W Flood Light', 15), 'Wipro', 5000),  
       ('P00002', 'Laptop Adapter', 'Dell', 1560),
       ('P00003', 'Tablet', 'HCL', 11000),
       ('P00004', 'Garnet 50W led', 'Wipro', 999),
       ('P00005', 'Laptop Charger', 'HCL', 1690);

INSERT INTO CUSTOMER (cust_no, name, age, city, pincode, state)
VALUES ('C00001', 'Ivan Bayross', 35, 'Bombay', 400054, 'Maharashtra'),
       ('C00002', 'Vandana Saitwal', 35, 'Madras', 780001, 'Tamilnadu'),
       ('C00003', 'Pramada Jaguste', 55, 'Bombay', 400057, 'Maharashtra'),
       ('C00004', 'Basu Navindgi', 45, 'Bombay', 400056, 'Maharashtra'),
       ('C00005', 'Ravi Sreedharan', 25, 'Delhi', 100001, 'Delhi'),
       ('C00006', 'Rukmini', 25, 'Madras', 780001, 'Tamilnadu');

INSERT INTO SUPPLIER (s_no, sname, city)
VALUES ('S001', 'Ivan Bayross', 'Bombay'),
       ('S002', 'Nirmala Agarwal', 'Madras'),
       ('C003', 'Susmitha', 'Bombay'),  
       ('C004', 'Basu Navindgi', 'Bombay'),  
       ('C005', 'Ravi Sreedharan', 'Delhi'),  
       ('C006', 'Nanda Gopal', 'Madras');  

INSERT INTO PURCHASE (order_no, custno, prono, quantity, orderdate)
VALUES ('O00001', 'C00002', 'P00003', 2, '2016-01-20'),
       ('O00002', 'C00003', 'P00002', 1, '2016-01-27'),
       ('O00003', 'C00006', 'P00001', 3, '2016-02-20'),
       ('O00004', 'C00003', 'P00005', 4, '2016-04-07'),
       ('O00005', 'C00004', 'P00002', 2, '2016-05-22'),
       ('O00006', 'C00005', 'P00004', 1, '2016-05-26');
