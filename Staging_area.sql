flight_2017

Flight_2018

flyu_flight - > flight table 


Dim_flight 

Dim_customer

dim_time 

fact_flight 


dim_flight: 

create table stag_flight
(
flight_key nnumber(5), 
FLIGHT_NUMBER	NUMBER(5),	
TAIL_NUMBER		VARCHAR2(30)	,
ORIGIN_AIRPORT	VARCHAR2(30),	
DESTINATION_AIRPORT	VARCHAR2(30),
DBSource varchar2(20)
);



DB1 (flight 2017)

1 . Insert statement 
2 merge statement 
3 cursors  and loop


-- Procedures with the above mentioned script 

Things to remember :

1 Multiple migration 
2 surrogate key 
3 db source 
4 db structure of source and destination

technology you may use:

1. Procedure 
2. Function 
3. Trigger 
4 .Cursors 
5 . Sequence 
6. Package 


1. create or replace procedure pr_stag_flight is 

begin 


merge into 
1. merge statement -- used for multi migration 


2. insert into stag_flight (select * from flight_2017

minus or not in clause 

); jan , feb, march, apr,may, jun.. 2000

jul,aug, sep, oct,nov, dec 

5000 (2000 + 3000)

3 cursor -- minus or not in clause 



surrogate key - > trigger 

before insert 

:new.surkey := seq.nextval;
 or
 select seq.nextval into :new.surrkey from dual


end ;


 ---------------------------------------------------------------------------------------------------------------------------------

create or replace procedure pr_stag_flight is 

begin

merge into stag_flight d
using flight_2017 s
on (s.flight_number = d.flight_number)
when matched then
		update  set 
		TAIL_NUMBER	= s.tail_number,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	=s.destination_airport
		DBSource = 'flight_2017'

when not matched then
		insert values (s.FLIGHT_NUMBER,s.TAIL_NUMBER, s.ORIGIN_AIRPORT	,s.DESTINATION_AIRPORT,'flight_2017');
 
 
 
 merge into stag_flight d
using flight_2018 s
on (s.flight_number = d.flight_number)
when matched then
		update  set 
		TAIL_NUMBER	= s.tail_number,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	=s.destination_airport
		DBSource = 'flight_2018'

when not matched then
		insert values (s.FLIGHT_NUMBER,s.TAIL_NUMBER, s.ORIGIN_AIRPORT	,s.DESTINATION_AIRPORT,'flight_2018');
 
 
 
 merge into stag_flight d
using flyu_flight s
on (s.flight_number = d.flight_number)
when matched then
		update  set 
		TAIL_NUMBER	= s.tail_number,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	=s.destination_airport
		DBSource = 'flyu_flight'

when not matched then
		insert values (s.FLIGHT_NUMBER,s.TAIL_NUMBER, s.ORIGIN_AIRPORT	,s.DESTINATION_AIRPORT,'flyu_flight');
 
end;




 ---------------------------------------------------------------------------------------------------------------------------------




merge into stag_flight d
using ( select flight_number, tail_number, origin_airport, destination_airport, 'flight_2017' as dbsource  from flight_2017
		union
		select flight_number, tail_number, origin_airport, destination_airport ,'flight_2018' as dbsource from flight_2018
		union 
		select flight_number, tail_number, origin_airport, destination_airport, 'flyu_flight' as dbsource from flyu_flights) s
on (s.flight_number = d.flight_number)
when matched then
		update  set 
		TAIL_NUMBER	= s.tail_number,	
		ORIGIN_AIRPORT	= s.origin_airport,	
		DESTINATION_AIRPORT	=s.destination_airport
		DBSource = 'flight_2017'

when not matched then
		insert values (s.FLIGHT_NUMBER,s.TAIL_NUMBER, s.ORIGIN_AIRPORT	,s.DESTINATION_AIRPORT,'flight_2017');
 
 
 
 create or replace  view vw_flight_information 
 as 
 (
 select flight_number, tail_number, origin_airport, destination_airport, 'flight_2017' as dbsource  from flight_2017
 union
 select to_char(fltno) flight_number, tail_number, origin_airport, destination_airport ,'flight_2018' as dbsource from flight_2018
 union 
 select flight_number, tail_number, origin_airport, destination_airport, 'flyu_flight' as dbsource from flyu_flights
 )
 
 
 
 create or replace  view vw_flight_information 
 as 
 (
 select flight_number, tail_number, origin_airport, destination_airport, 'flight_2017' as dbsource  from flight_2017
 union
 select to_char(fltno) flight_number, tail_number, origin_airport, destination_airport ,'flight_2018' as dbsource from flight_2018
 union 
 select flight_number, tail_number, origin_airport, destination_airport, 'flyu_flight' as dbsource from flyu_flights
 )
 
 



 
 ---------------------------------------------------------------------------------------------------------------------------------

 
create or replace procedure pr_stag_flight is 

cursor curflight is 
select * from flight_2017 where flight_no not in (select flight_number from dim_flight);

vflight curflight%ROWTYPE;

begin

open curflight;

loop
fetch curflight into vflight;

insert into stag_flight values (null, vFlight.flight_number, vFlight.tail_number, vflight.origin_airport, vFlight.destination_airport, 'flight_2017');


end loop;

close curflight;


end


create or replace procedure pr_stag_flight is 

cursor curflight is 
select * from flight_2017 where flight_no not in (select flight_number from dim_flight);

begin

for vFlight in curflight loop

insert into stag_flight values (null, vFlight.flight_number, vFlight.tail_number, vflight.origin_airport, vFlight.destination_airport, 'flight_2017');

end loop;

end;
