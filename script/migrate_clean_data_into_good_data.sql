-- for flight data
create or replace procedure migrate_converted_flight_data as
begin
    merge into CLEAN_FLIGHT d
    using BAD_FLIGHT s
    on (s.flight_key = d.flight_key)
    when matched then
    update set
        TAIL_NUMBER = s.tail_number,
        FLIGHT_NUMBER = s.flight_number,
        CANCELLED  = s.cancelled,
        DIVERTED  = s.diverted,
        ORIGIN_AIRPORT = s.origin_airport,
        DESTINATION_AIRPORT = s.destination_airport,
        DB_SOURCE  = s.db_source
    when not matched then
        insert values (s.flight_key, s.tail_number, s.flight_number,  s.cancelled, s.diverted, s.origin_airport, s.destination_airport, s.db_source);
end;
/

-- for complaint data
create or replace procedure migrate_converted_complaint_data as
begin
    merge into CLEAN_COMPLAINT d
    using BAD_COMPLAINT cmt
    on (cmt.complaint_key = d.complaint_key)
    when matched then
    update set
        COMPLAINT_ID = cmt.complaint_id,
        COMPLAINT_TYPE = cmt.complaint_type,
        COMPLAINT_DESCRIPTION	= cmt.complaint_description,
        COMPLAINT_STATUS	= cmt.complaint_status,	
		COMPENSATION_AMNT	= cmt.compensation_amnt,
        ALLOCATED_TO = cmt.allocated_to,
		DB_SOURCE = cmt.db_source
    when not matched then
    insert values (cmt.complaint_key, cmt.complaint_id, cmt.complaint_type, cmt.complaint_description, cmt.complaint_status, cmt.compensation_amnt, cmt.allocated_to, cmt.db_source);
end;
/

-- for customer data
create or replace procedure migrate_converted_customer_data as
begin
    merge into CLEAN_CUSTOMER d
    using BAD_CUSTOMER cu
    on (cu.customer_key = d.customer_key)
    when matched then
    update  set
        CUSTOMER_ID = cu.customer_id,
        CUSTOMER_TYPE = cu.customer_type,
        CUSTOMER_ZIP_CODE	= cu.customer_zip_code,
        BUSINESS	= cu.business,	
		CUSTOMER_MILES	= cu.customer_miles,	
		DB_SOURCE = cu.db_source
    when not matched then
        insert values (cu.customer_key, cu.customer_id, cu.customer_type, cu.customer_zip_code,  cu.business, cu.customer_miles, cu.db_source);
end;