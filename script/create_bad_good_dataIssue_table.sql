-- create clean tables
create table clean_flight as select *from stage_flight where 1=0;
create table clean_complaint as select *from stage_complaint where 1=0;
create table clean_customer as select *from stage_customer where 1=0;

-- create bad table
create table bad_flight as select *from stage_flight where 1=0;
create table bad_complaint as select *from stage_complaint where 1=0;
create table bad_customer as select *from stage_customer where 1=0;

-- create data issue table
create table data_issues(
    issue_id number not null,
    table_name varchar2(100),
    row_id number,
    data_error_code number(10),
    issue_description varchar2(100),
    issue_date DATE,
    issue_status varchar(100),
    status_update_date DATE
);

-- create sequence
create sequence seq_dataIssue start with 1 increment by 1;

-- create trigger
create or replace trigger tri_data_issues
BEFORE INSERT ON data_issues
FOR EACH ROW
BEGIN
    :new.issue_id := seq_dataIssue.NEXTVAL;
END;