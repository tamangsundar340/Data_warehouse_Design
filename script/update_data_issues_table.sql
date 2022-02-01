-- update data issues of flight
create or replace procedure update_data_issue_of_flight as
begin
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 10;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 20;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 30;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 40;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 50;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 60;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 70;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 80;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 90;
end;
/

-- update data issues of complaint
create or replace procedure update_data_issue_of_complaint as
begin
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 1;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 2;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 3;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 4;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 5;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 6;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 7;
end;
/

-- update data issues of customer
create or replace procedure update_data_issue_of_customer as
begin
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 100;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 200;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 300;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 400;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 500;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 600;
    update data_issues set ISSUE_STATUS = 'fixed', STATUS_UPDATE_DATE = SYSDATE where DATA_ERROR_CODE = 700;
end;
