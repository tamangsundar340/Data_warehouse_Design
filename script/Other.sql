	create table flight_2017
	(
	    ID number(22),
	    FLIGHT_ID number(22),
	    YEAR number(22),
	    FLIGHT_NUMBER number(22),
	    TAIL_NUMBER varchar2(50),
	    ORIGIN_AIRPORT varchar2(50),
	    DESTINATION_AIRPORT varchar2(50),
	    SCHEDULED_DEPARTURE number(22),
	    DEPARTURE_TIME number(22),
	    DEPARTURE_DELAY number(22),
	    TAXI_OUT number(22),
	    WHEELS_OFF number(22),
	    SCHEDULED_TIME number(22),
	    ELAPSED_TIME number(22),
	    AIR_TIME number(22),
	    DISTANCE number(22),
	    WHEELS_ON number(22), 
	    TAXI_IN number(22),
	    SCHEDULED_ARRIVAL number(22),
	    ARRIVAL_TIME number(22),
	    ARRIVAL_DELAY number(22),
	    DIVERTED number(22),
	    CANCELLED number(22),
	    CANCELLATION_REASON varchar2(1),
	    AIR_SYSTEM_DELAY number(22),
	    SECURITY_DELAY number(22),
	    AIRLINE_DELAY number(22),
	    LATE_AIRCRAFT_DELAY number(22),
	    WEATHER_DELAY number(22),
	    COL029 VARCHAR2(4000),
	    FK_CUSTOMER_ID number(22)
	);
	
	
	To add new colun in flight_2017, flight_2018, flyu_flights
	truncate table flight_2017;
	
	To delete column
	alter table flight_2018 drop column fk_customer_id;
	
	-- To make column foreign key
	ALTER TABLE flyu_flights 
	ADD fk_customer_id number(22) NOT NULL
	CONSTRAINT flyu_flights_fk REFERENCES customer(customer_id);
	
	-- To make column foreign key
	
	ALTER TABLE flight_2018 
	ADD fk_customer_id number(22) NOT NULL
	CONSTRAINT flight2018_fk REFERENCES customer(customer_id);

	
	ALTER TABLE flight_2017 
	ADD fk_customer_id number(22) NOT NULL
	CONSTRAINT flight2017_fk REFERENCES customer(customer_id);
	
	
	
	-- To count number of data
	select count(*) from flight_2017;
	
	
	-- To Alter column name
	ALTER TABLE flight_2018 RENAME column COL001 TO flight_id;
	
	
	
	-- To add foreing key contraint key to existing column
	alter table flight_2018
	add constraint fk_customer_id foreign key(fk_customer_id)
	references customer(customer_id);
	
	
	
	-- To modify datatype
	ALTER TABLE flight_2017
	MODIFY FK_CUSTOMER_ID number(22);
