-- table creation

	create table stage_flight
	(
        flight_key number(5),
	    tail_number varchar2(30),
	    flight_number varchar(30),
	    cancelled number(10),
	    diverted number(10),
	    origin_airport varchar2(50),
	    destination_airport varchar2(50),
	    db_source varchar2(30)
	);
	
	
	
	create table stage_customer
	(
        customer_key number(5),
        customer_id number(10),
	    customer_type varchar2(50),
	    customer_zip_code varchar2(50),
	    business varchar2(30),
	    customer_miles varchar(100),
	    db_source varchar2(30)
	);
	
	
	
	create table stage_complaint
	(
        complaint_key number(5),
        complaint_id number(10),
	    complaint_type varchar2(50),
	    complaint_description  varchar2(100),
	    complaint_status varchar2(50),
	    compensation_amnt varchar2(30),
	    allocated_to varchar(100),
	    db_source varchar2(30)
	);


-- Sequences
create sequence seq_stageflight start with 1 increment by 1;
create sequence seq_stagecomplaint start with 1 increment by 1;
create sequence seq_stagecustomer start with 1 increment by 1;



--Triger for stage tables
CREATE OR REPLACE TRIGGER tri_stage_flight
BEFORE INSERT ON stage_flight
FOR EACH ROW
BEGIN
   :new.flight_key := seq_stageflight.NEXTVAL;
END;
/


CREATE OR REPLACE TRIGGER tri_complaint
BEFORE INSERT ON stage_complaint
FOR EACH ROW
BEGIN
   :new.complaint_key := seq_stagecomplaint.NEXTVAL;
END;
/


CREATE OR REPLACE TRIGGER tri_customer
BEFORE INSERT ON stage_customer
FOR EACH ROW
BEGIN
   :new.customer_key := seq_stagecustomer.NEXTVAL;
END;
/
