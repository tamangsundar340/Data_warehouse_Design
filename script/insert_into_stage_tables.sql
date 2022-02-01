-- procedure for stage_flight table
create or replace procedure pr_stage_flight as
begin

merge into STAGE_FLIGHT d
using FLIGHT_2017 s
on (s.flight_number = d.flight_number and d.DB_SOURCE='FLIGHT_2017')
when matched then
    update  set
        TAIL_NUMBER = s.tail_number,
        CANCELLED	= s.cancelled,
        DIVERTED	= s.diverted,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	= s.destination_airport
when not matched then
    insert (FLIGHT_NUMBER, TAIL_NUMBER, CANCELLED, DIVERTED, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DB_SOURCE) 
    values (s.flight_number, s.tail_number,  s.cancelled, s.diverted, s.origin_airport, s.destination_airport, 'FLIGHT_2017');

merge into STAGE_FLIGHT d
using FLIGHT_2018 s
on (s.flight_number = d.flight_number and d.DB_SOURCE='FLIGHT_2018')
when matched then
    update  set
        TAIL_NUMBER = s.tail_number,
        CANCELLED	= s.cancelled,
        DIVERTED	= s.diverted,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	= s.destination_airport
when not matched then
    insert (FLIGHT_NUMBER, TAIL_NUMBER, CANCELLED, DIVERTED, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DB_SOURCE) 
    values (s.flight_number, s.tail_number,  s.cancelled, s.diverted, s.origin_airport, s.destination_airport, 'FLIGHT_2018');

merge into STAGE_FLIGHT d
using FLYU_FLIGHTS s
on (s.flight_number = d.flight_number and d.DB_SOURCE='FLYU_FLIGHTS')
when matched then
    update  set
        TAIL_NUMBER = s.tail_number,
        CANCELLED	= s.cancelled,
        DIVERTED	= s.diverted,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	= s.destination_airport
when not matched then
    insert (FLIGHT_NUMBER, TAIL_NUMBER, CANCELLED, DIVERTED, ORIGIN_AIRPORT, DESTINATION_AIRPORT, DB_SOURCE) 
    values (s.flight_number, s.tail_number,  s.cancelled, s.diverted, s.origin_airport, s.destination_airport, 'FLYU_FLIGHTS');
end;
/

-- procedure for stage_cutomer table
create or replace procedure pr_stage_customer as
begin
merge into stage_customer d
using customer cu
on (cu.customer_id = d.customer_id)
when matched then
    update  set
        CUSTOMER_TYPE = cu.customer_type,
        CUSTOMER_ZIP_CODE	= cu.customer_zip_code,
        BUSINESS	= cu.business,	
		CUSTOMER_MILES	= cu.customer_miles,	
		DB_SOURCE = 'customer'
when not matched then
    insert (CUSTOMER_ID, CUSTOMER_TYPE, CUSTOMER_ZIP_CODE, BUSINESS, CUSTOMER_MILES, DB_SOURCE) 
    values (cu.customer_id, cu.customer_type, cu.customer_zip_code,  cu.business, cu.customer_miles, 'customer');
end;
/

-- procedure for stage_complaint table
create or replace procedure pr_stage_complaint as
begin
merge into stage_complaint d
using COMPLAINT cmt
on (cmt.complaint_id = d.complaint_id)
when matched then
    update  set
        COMPLAINT_TYPE = cmt.complaint_type,
        COMPLAINT_DESCRIPTION	= cmt.complaint_description,
        COMPLAINT_STATUS	= cmt.complaint_status,	
		COMPENSATION_AMNT	= cmt.compensation_amnt,
        ALLOCATED_TO = cmt.allocated_to,
		DB_SOURCE = 'COMPLAINT'
when not matched then
    insert (COMPLAINT_ID, COMPLAINT_TYPE, COMPLAINT_DESCRIPTION, COMPLAINT_STATUS, COMPENSATION_AMNT, ALLOCATED_TO, DB_SOURCE) 
    values (cmt.complaint_id, cmt.complaint_type, cmt.complaint_description, cmt.complaint_status, cmt.compensation_amnt, cmt.allocated_to, 'COMPLAINT');
end;
