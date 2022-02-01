-- add bad data to flight
update stage_flight
set diverted = 1 where flight_key = 9;

update stage_flight
set diverted = 1 where flight_key = 11;

update stage_flight 
set origin_airport = 'J@K' where flight_key = 5110;

update stage_flight 
set origin_airport = 'J1K' where flight_key = 4001;

-- add bad data to complaint
update stage_complaint
set COMPENSATION_AMNT = '500w' where complaint_key = 10;

-- add bad data to customer
update stage_customer
set CUSTOMER_MILES = -500 where customer_key = 10;