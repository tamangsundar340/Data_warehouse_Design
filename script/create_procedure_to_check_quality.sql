-- for flight data
declare
clean_data number(10);
bad_data number(10);
begin
    clean_data := 0;
    bad_data := 0;
    insert into bad_flight (select *from stage_flight where
        (CANCELLED = 1 and DIVERTED = 1)
        or
        TAIL_NUMBER is null
        or 
        FLIGHT_NUMBER is null
        or 
        CANCELLED is null
        or
        DIVERTED is null
        or 
        ORIGIN_AIRPORT is null
        or 
        REGEXP_LIKE(ORIGIN_AIRPORT, '[^a-zA-Z]')
        or 
        DESTINATION_AIRPORT is null 
        or 
        REGEXP_LIKE(DESTINATION_AIRPORT, '[^a-zA-Z]')
        or 
        DB_SOURCE is null
    );
    bad_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total bad data input is : '|| bad_data);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 10, 'Null data - tail number is null', SYSDATE, 'unfixed', '' from bad_flight bf where tail_number is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 20, 'Data entry - flight diverted even flight is cancelled', SYSDATE, 'unfixed', '' from bad_flight bf where CANCELLED = 1 and DIVERTED = 1);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 30, 'Null data - flight number is null', SYSDATE, 'unfixed', '' from bad_flight bf where FLIGHT_NUMBER is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 40, 'Null data - cancelled is null', SYSDATE, 'unfixed', '' from bad_flight bf where CANCELLED is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 50, 'Null data - diverted is null', SYSDATE, 'unfixed', '' from bad_flight bf where DIVERTED is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 60, 'Null data - origin_airport is null', SYSDATE, 'unfixed', '' from bad_flight bf where  ORIGIN_AIRPORT is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 60, 'Non consistency - airport name consist invalid character', SYSDATE, 'unfixed', '' from bad_flight bf where REGEXP_LIKE(ORIGIN_AIRPORT, '[^a-zA-Z]'));

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 70, 'Null data - destination_airport is null', SYSDATE, 'unfixed', '' from bad_flight bf where DESTINATION_AIRPORT is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 80, 'Non consistency - airport name consist invalid character', SYSDATE, 'unfixed', '' from bad_flight bf where REGEXP_LIKE(DESTINATION_AIRPORT, '[^a-zA-Z]'));

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_flight', bf.flight_key, 90, 'Null data - db_Source is null', SYSDATE, 'unfixed', '' from bad_flight bf where DB_SOURCE is null);

    insert into clean_flight (
        select * from stage_flight where
        (CANCELLED = 1 and DIVERTED = 0 or CANCELLED = 0 and diverted = 0 or cancelled = 0 and diverted = 1)
        AND
        TAIL_NUMBER is not null
        AND
        FLIGHT_NUMBER is not null
        AND
        CANCELLED is not null
        AND
        DIVERTED is not null
        AND
        ORIGIN_AIRPORT is not null
        AND
        not REGEXP_LIKE(ORIGIN_AIRPORT, '[^a-z,A-Z]')
        AND
        DESTINATION_AIRPORT is not null
        AND
        not REGEXP_LIKE(DESTINATION_AIRPORT, '[^a-z,A-Z]')
        AND
        DB_SOURCE is not null
    );
    clean_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total clean data input is : '|| clean_data); 
end;
/

-- for complaint table
declare
clean_data number(10);
bad_data number(10);
begin
    clean_data := 0;
    bad_data := 0;
    insert into bad_complaint (select *from stage_complaint where
        COMPLAINT_TYPE is null
        or 
        COMPLAINT_DESCRIPTION is null
        or 
        COMPLAINT_STATUS is null
        or
        COMPENSATION_AMNT is null
        or 
        REGEXP_LIKE(COMPENSATION_AMNT, '[^0-9]')
        or 
        ALLOCATED_TO is null
        or 
        DB_SOURCE is null
    );
    bad_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total bad data input is : '|| bad_data);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 1, 'Null data - COMPLAINT_TYPE is null', SYSDATE, 'unfixed', '' from bad_complaint bc where COMPLAINT_TYPE is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 2, 'Null data - COMPLAINT_DESCRIPTION is null', SYSDATE, 'unfixed', '' from bad_complaint bc where COMPLAINT_DESCRIPTION is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 3, 'Null data - COMPLAINT_STATUS is null', SYSDATE, 'unfixed', '' from bad_complaint bc where COMPLAINT_STATUS is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 4, 'Null data - COMPENSATION_AMNT is null', SYSDATE, 'unfixed', '' from bad_complaint bc where COMPENSATION_AMNT is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 5, 'Non consistency - COMPENSATION_AMNT is not in string format', SYSDATE, 'unfixed', '' from bad_complaint bc where REGEXP_LIKE(COMPENSATION_AMNT, '[^0-9]'));

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 6, 'Null data - ALLOCATED_TO is null', SYSDATE, 'unfixed', '' from bad_complaint bc where ALLOCATED_TO is null );


    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_complaint', bc.complaint_key, 7, 'Null data - DB_SOURCE is null', SYSDATE, 'unfixed', '' from bad_complaint bc where DB_SOURCE is null );

    insert into clean_complaint(
        select *from stage_complaint where
        COMPLAINT_TYPE is not null
        AND 
        COMPLAINT_DESCRIPTION is not null
        AND
        COMPLAINT_STATUS is not null
        AND
        COMPENSATION_AMNT is not null
        AND
        not REGEXP_LIKE(COMPENSATION_AMNT, '[^0-9]')
        AND 
        ALLOCATED_TO is not null
        AND 
        DB_SOURCE is not null
    );
    clean_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total clean data input is : '|| clean_data); 
end;
/

-- for customer table
declare
clean_data number(10);
bad_data number(10);
begin
    clean_data := 0;
    bad_data := 0;
    insert into bad_customer (select *from stage_customer where
        CUSTOMER_ID is null
        or 
        CUSTOMER_TYPE is null
        or 
        CUSTOMER_ZIP_CODE is null
        or
        BUSINESS is null
        or 
        CUSTOMER_MILES is null
        or 
        CUSTOMER_MILES<0
        or 
        DB_SOURCE is null
    );
    bad_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total bad data input is : '|| bad_data);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 100, 'Null data - CUSTOMER_ID is null', SYSDATE, 'unfixed', '' from bad_customer bc where CUSTOMER_ID is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 200, 'Null data - CUSTOMER_TYPE is null', SYSDATE, 'unfixed', '' from bad_customer bc where CUSTOMER_TYPE is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 300, 'Null data - CUSTOMER_ZIP_CODE is null', SYSDATE, 'unfixed', '' from bad_customer bc where CUSTOMER_ZIP_CODE is null );

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 400, 'Null data - BUSINESS is null', SYSDATE, 'unfixed', '' from bad_customer bc where BUSINESS is null);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 500, 'Null data - CUSTOMER_MILES is null', SYSDATE, 'unfixed', '' from bad_customer bc where CUSTOMER_MILES is null );

        insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 600, 'Data not consistency - CUSTOMER_MILES can not be less than 0', SYSDATE, 'unfixed', '' from bad_customer bc where CUSTOMER_MILES<0);

    insert into data_issues(TABLE_NAME, ROW_ID, DATA_ERROR_CODE, ISSUE_DESCRIPTION, ISSUE_DATE, ISSUE_STATUS, STATUS_UPDATE_DATE)
    (select 'stage_customer', bc.customer_key, 700, 'Null data - DB_SOURCE is null', SYSDATE, 'unfixed', '' from bad_customer bc where DB_SOURCE is null );

    insert into clean_customer(
        select *from stage_customer where
        CUSTOMER_ID is not null
        AND
        CUSTOMER_TYPE is not null
        AND
        CUSTOMER_ZIP_CODE is not null
        AND
        BUSINESS is not null
        AND 
        CUSTOMER_MILES is not null
        AND
        CUSTOMER_MILES>=0
        AND 
        DB_SOURCE is not null
    );
    clean_data := SQL%ROWCOUNT;
    dbms_output.put_line('Total clean data input is : '|| clean_data); 
end;