DROP TABLE IF EXISTS booking_commercials;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
user_id TEXT PRIMARY KEY,
name TEXT,
phone_number TEXT,
mail_id TEXT,
billing_address TEXT
);


CREATE TABLE bookings (
booking_id TEXT PRIMARY KEY,
booking_date TIMESTAMP,
room_no TEXT,
user_id TEXT REFERENCES users(user_id)
);


CREATE TABLE items (
item_id TEXT PRIMARY KEY,
item_name TEXT,
item_rate NUMERIC
);


CREATE TABLE booking_commercials (
id TEXT PRIMARY KEY,
booking_id TEXT REFERENCES bookings(booking_id),
bill_id TEXT,
bill_date TIMESTAMP,
item_id TEXT REFERENCES items(item_id),
item_quantity NUMERIC
);


-- Sample inserts (small dataset to test queries)
INSERT INTO users VALUES
('21wrcxuy-67erfn','John Doe','97XXXXXXXX','john.doe@example.com','XX, Street Y, ABC City'),
('u-0002','Jane Smith','98YYYYYYYY','jane.smith@example.com','99, Lane Z');


INSERT INTO bookings VALUES
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-101','21wrcxuy-67erfn'),
('bk-nov-01','2021-11-05 12:10:00','rm-102','21wrcxuy-67erfn'),
('bk-nov-02','2021-11-20 18:30:00','rm-103','u-0002');


INSERT INTO items VALUES
('itm-a9e8-q8fu','Tawa Paratha',18),
('itm-a07vh-aer8','Mix Veg',89),
('itm-w978-23u4','Masala Dosa',45);


INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1),
('b1-nov-01','bk-nov-01','bl-nov-01','2021-11-05 12:11:00','itm-w978-23u4',2),
('b2-nov-02','bk-nov-02','bl-nov-02','2021-11-20 19:00:00','itm-a07vh-aer8',5);