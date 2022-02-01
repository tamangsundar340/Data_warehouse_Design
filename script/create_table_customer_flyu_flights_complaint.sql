-- Create a Database table to represent the "customer" entity.
CREATE TABLE customer(
	customer_id	INTEGER NOT NULL,
	customer_zip_code	VARCHAR(10),
	customer_type	VARCHAR(8),
	business	VARCHAR(20),
	customer_miles	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "customer".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_customer PRIMARY KEY (customer_id)
);

-- Create a Database table to represent the "complaint" entity.
CREATE TABLE complaint(
	complaint_id	INTEGER NOT NULL PRIMARY KEY,
	flight_number	INTEGER,
    tail_number VARCHAR(10),
	the_year	NUMBER(4),
	the_month	NUMBER(2),
	the_day	NUMBER(2),
	complaint_type	VARCHAR(5),
	description	VARCHAR(200),
	complaint_status	VARCHAR(7),
	allocated_to	VARCHAR(8),
	compensation_amnt	INTEGER,
	compensation_type	VARCHAR(8),
	customer_id	INTEGER NOT NULL
);


CREATE TABLE FlyU_flights
( flight_the_year NUMBER(4),
    the_month NUMBER(2),
    the_day NUMBER(2),
    d_o_w NUMBER(1),
    flight_number NUMBER(10),
    tail_number VARCHAR2(10),
    origin_airport VARCHAR2(6),
    destination_airport VARCHAR2(6),
    arrival_delay VARCHAR2(10),
    diverted NUMBER(1),
    cancelled NUMBER(1),
    cancelled_reason VARCHAR2(1)
 );
 
ALTER TABLE FlyU_flights ADD CONSTRAINT pk1_flights PRIMARY KEY (flight_the_year, the_month, the_day, flight_number);
 

ALTER TABLE complaint ADD CONSTRAINT fk1_complaint_to_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id);
ALTER TABLE complaint ADD CONSTRAINT fk1_complaint_to_flight FOREIGN KEY(the_year, the_month, the_day, flight_number) REFERENCES FlyU_flights(flight_the_year, the_month, the_day, flight_number);
 