-- flight stage table
select *from stage_flight order by flight_key desc;
-- bad data
select count(*) from stage_flight where tail_number is null;
select tail_number, flight_number, origin_airport, destination_airport from stage_flight where tail_number is null;

-- everyting ok with
select count(*) from stage_flight where flight_number is null;
select count(*) from stage_flight where cancelled is null;
select count(*) from stage_flight where diverted is null;
select count(*) from stage_flight where origin_airport is null;
select count(*) from stage_flight where destination_airport is null;

select cancelled,diverted from stage_flight where diverted>0;
select cancelled,diverted from stage_flight where cancelled>0;
select tail_number from stage_flight where

SELECT * FROM stage_flight WHERE REGEXP_LIKE(origin_airport, '![A-Z] [a-z]');
SELECT * FROM stage_flight WHERE REGEXP_LIKE(destination_airport, '![A-Z] [a-z]');


-- complaint stage table
select *from customer;
select *from stage_complaint;
select *from stage_flight;
select *from stage_customer;

select count(*) from stage_complaint where complaint_type is null;
select complaint_type, complaint_description from stage_complaint where complaint_type is null and complaint_description is not null;