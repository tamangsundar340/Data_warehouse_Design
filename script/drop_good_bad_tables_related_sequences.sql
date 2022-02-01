-- drop clean tables
drop table clean_flight cascade constraint;
drop table clean_complaint cascade constraint;
drop table clean_customer cascade constraint;

-- drop bad tables
drop table bad_flight cascade constraint;
drop table bad_complaint cascade constraint;
drop table bad_customer cascade constraint;

-- drop data_issues table
drop table data_issues cascade constraint;

-- drop sequences
drop sequence seq_dataIssue;