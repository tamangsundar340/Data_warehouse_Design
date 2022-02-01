-- clean bad_flight data
create or replace procedure clean_bad_flight as
begin 
    update bad_flight set TAIL_NUMBER = 'unknown' where TAIL_NUMBER is null;
    update bad_flight set FLIGHT_NUMBER = 'unknown' where FLIGHT_NUMBER is null;
    update bad_flight set CANCELLED = 0 where CANCELLED is null;
    update bad_flight set DIVERTED = 0 where DIVERTED is null;
    update bad_flight set ORIGIN_AIRPORT = 'unknown' where ORIGIN_AIRPORT is null;
    update bad_flight set DESTINATION_AIRPORT = 'unknown' where DESTINATION_AIRPORT is null;
    update bad_flight set DB_SOURCE = 'unknown' where DB_SOURCE is null;
    update bad_flight set DIVERTED = 0 where CANCELLED = 1;
    update bad_flight set ORIGIN_AIRPORT = 'JFK' where REGEXP_LIKE(ORIGIN_AIRPORT, '[^J(.*)K$]');
end;
/

-- clean bad_complaintt data
create or replace procedure clean_bad_complaint as
begin 
    update bad_complaint set COMPLAINT_TYPE = 'unknown' where COMPLAINT_TYPE is null;
    update bad_complaint set COMPLAINT_DESCRIPTION = 'unknown' where COMPLAINT_DESCRIPTION is null;
    update bad_complaint set COMPLAINT_STATUS = 'unknown' where COMPLAINT_STATUS is null;
    update bad_complaint set COMPENSATION_AMNT = 0 where COMPENSATION_AMNT is null;
    update bad_complaint set ALLOCATED_TO = 'unknown' where ALLOCATED_TO is null;
    update bad_complaint set DB_SOURCE = 'unknown' where DB_SOURCE is null;
    update bad_complaint set COMPENSATION_AMNT = 5000 where complaint_key = 10;
end;
/

-- clean customer data
create or replace procedure clean_bad_customer as
begin 
    update bad_customer set CUSTOMER_TYPE = 'unknown' where CUSTOMER_TYPE is null;
    update bad_customer set CUSTOMER_ZIP_CODE = 'unknown' where CUSTOMER_ZIP_CODE is null;
    update bad_customer set BUSINESS = 'unknown' where BUSINESS is null;
    update bad_customer set CUSTOMER_MILES = 0 where CUSTOMER_MILES is null;
    update bad_customer set CUSTOMER_MILES = 1000 where CUSTOMER_ID=106;
end;
