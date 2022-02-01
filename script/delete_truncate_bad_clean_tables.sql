-- flight table
select *from clean_flight;
select *from bad_flight;
select *from data_issues;

select count(*)from clean_flight;
select count(*)from bad_flight;
select count(*)from data_issues;

truncate table clean_flight;
truncate table bad_flight;
truncate table data_issues;

-- complaint table
select *from clean_complaint;
select *from bad_complaintt;
select *from data_issues;

select count(*)from clean_complaint;
select count(*)from bad_complaint;
select count(*)from data_issues;

truncate table clean_complaint;
truncate table bad_complaint;
truncate table data_issues;


-- complaint table
select *from clean_customer;
select *from bad_customer;
select *from data_issues;

select count(*)from clean_customer;
select count(*)from bad_customer;
select count(*)from data_issues;

truncate table clean_customer;
truncate table bad_customer;
truncate table data_issues;