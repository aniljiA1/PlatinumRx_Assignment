DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;


CREATE TABLE clinics (
cid TEXT PRIMARY KEY,
clinic_name TEXT,
city TEXT,
state TEXT,
country TEXT
);


CREATE TABLE customer (
uid TEXT PRIMARY KEY,
name TEXT,
mobile TEXT
);


CREATE TABLE clinic_sales (
oid TEXT PRIMARY KEY,
uid TEXT REFERENCES customer(uid),
cid TEXT REFERENCES clinics(cid),
amount NUMERIC,
datetime TIMESTAMP,
sales_channel TEXT
);


CREATE TABLE expenses (
eid TEXT PRIMARY KEY,
cid TEXT REFERENCES clinics(cid),
description TEXT,
amount NUMERIC,
datetime TIMESTAMP
);


-- Sample data
INSERT INTO clinics VALUES
('cnc-0100001','XYZ clinic','Metropolis','State1','CountryA'),
('cnc-0100002','ABC clinic','Smallville','State1','CountryA'),
('cnc-0100003','North Clinic','Gotham','State2','CountryA');


INSERT INTO customer VALUES
('bk-09f3e-95hj','Jon Doe','97XXXXXXXX'),
('c-0002','Alice','98YYYYYYYY');


INSERT INTO clinic_sales VALUES
('ord-00100-00100','bk-09f3e-95hj','cnc-0100001',24999,'2021-09-23 12:03:22','online'),
('ord-00100-00101','c-0002','cnc-0100002',1500,'2021-09-05 10:00:00','walk-in'),
('ord-00100-00200','bk-09f3e-95hj','cnc-0100003',5000,'2021-09-23 14:00:00','phone');


INSERT INTO expenses VALUES
('exp-0100-00100','cnc-0100001','first-aid supplies',557,'2021-09-23 07:36:48'),
('exp-0100-00200','cnc-0100002','rent',2000,'2021-09-01 00:00:00');