1. Procedures 
2. Triggers 
3. Cursors
4. Sequences 
5. Funtions
6. Packages 


1. flight_2017
2. Flight_2018
3. FLyu_flights 


Dim _flight :
flight_number
tail_number
origin_airport
destination_airport

create table stag_flight
(
flight_number number(10),
tail_number varchar2(30),
origin_airport  varchar2(30),
destination_airport  varchar2(30),
db_source varchar2(30)
);


-----------------------------------------------------------------------------------------------------------------------------------------
1. Merge statement 



************************flight_2018************************************

create or replace procedure pr_insert_stag_flight
is 

begin 

merge into stag_flight d
using flight_2017 s
on (s.flight_number = d.flight_number
and s.tail_number = d.tail_number)
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport,
db_source = 'FLIGHT_2017'
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLIGHT_2017');


************************flight_2018************************************

merge into stag_flight d
using flight_2018 s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and db_source = 'FLIGHT_2018' )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLIGHT_2018');




************************flyu_flights************************************

merge into stag_flight d
using FLYU_FLIGHTS s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and db_source = 'FLYU_FLIGHTS' )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLYU_FLIGHTS');
end;

-----------------------------------------------------------------------------------------------------------------------------------------
2. Using procedures


************************flight_2017************************************

create or replace procedure pr_insert_stag_flight_2017
is 

begin 

merge into stag_flight d
using flight_2017 s
on (s.flight_number = d.flight_number
and s.tail_number = d.tail_number)
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport,
db_source = 'FLIGHT_2017'
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLIGHT_2017');

END;



************************flight_2018************************************

create or replace procedure pr_insert_stag_flight_2018
is 

begin 

merge into stag_flight d
using flight_2018 s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and db_source = 'FLIGHT_2018' )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLIGHT_2018');

END;


************************flyu_flights************************************

create or replace procedure pr_insert_stag_FLUYflight
is 

begin 

merge into stag_flight d
using FLYU_FLIGHTS s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and db_source = 'FLYU_FLIGHTS' )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,'FLYU_FLIGHTS');
end;

-----------------------------------------------------------------------------------------------------------------------------------------



create or replace procedure pr_insert_stag_FLIGHT_UNION
is 

begin 

merge into stag_flight d
using (SELECT FLIGHT_NUMBER, TAIL_NUMBER, ORIGIN_AIRPORT , DESTINATION_AIRPORT , 'FLIGHT_2017'  DB_SOURCE FROM FLIGHT_2017
		UNION
		SELECT FLIGHT_NUMBER, TAIL_NUMBER, ORIGIN_AIRPORT , DESTINATION_AIRPORT, 'FLIGHT_2018'  DB_SOURCE FROM FLIGHT_2018
		UNION
		SELECT FLIGHT_NUMBER, TAIL_NUMBER, ORIGIN_AIRPORT , DESTINATION_AIRPORT, 'FLYU_FLIGHTS'  DB_SOURCE FROM FLYU_FLIGHTS
		) s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and S.db_source = D.DB_SOURCE )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,S.DB_SOURCE);
end;


create or replace procedure pr_insert_stag_FLIGHT_VIEW
is 

begin 

merge into stag_flight d
using VW_FLIGHT_SOURE  s
on (s.flight_number = d.flight_number
    and s.tail_number = d.tail_number
	and S.db_source = D.DB_SOURCE )
when matched then 
update set
origin_airport  =s.origin_airport,
destination_airport =s.destination_airport
when not matched then
insert values (s.flight_number,s.tail_number,s.origin_airport,s.destination_airport,S.DB_SOURCE);
end;




BEGIN
pr_insert_stag_flight;
END;




create or replace procedure pr_stag_FLIGHT_INSERT_STMT
is 

begin 
 INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM FLIGHT_2017
 WHERE FLIGHT_NUMBER  NOT IN (SELECT FLIGHT_NUMBER FROM STAG_FLIGHT));
 
 INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2018' FROM FLIGHT_2018 WHERE FLIGHT_NUMBER  NOT IN (SELECT FLIGHT_NUMBER FROM STAG_FLIGHT));


INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT , 'FLYU_FLIGHTS' FROM FLYU_FLIGHTS WHERE FLIGHT_NUMBER  NOT IN (SELECT FLIGHT_NUMBER FROM STAG_FLIGHT));

end;



create or replace procedure pr_stag_FLIGHT_INSERT_MINUS
is 

begin 
 INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM FLIGHT_2017
  MINUS 
 SELECT  FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM STAG_FLIGHT);
 
 INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2018' FROM FLIGHT_2018 
 MINUS 
 SELECT  FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM STAG_FLIGHT);


INSERT INTO STAG_FLIGHT 
 (SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT , 'FLYU_FLIGHTS' FROM FLYU_FLIGHTS 
 MINUS 
 SELECT  FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM STAG_FLIGHT);

end;


BEGIN
pr_stag_FLIGHT_INSERT_STMT;
END;


create or replace procedure pr_stag_FLIGHT_INSERT_CURSOR
is
ROW_FLIGHT CUR_FLIGHT%rowtype;
 

CURSOR  CUR_FLIGHT IS 
SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM FLIGHT_2017
  MINUS 
 SELECT  FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM STAG_FLIGHT);
 
 
begin 
 OPEN CUR_FLIGHT;
 LOOP
 FETCH CUR_FLIGHT INTO ROW_FLIGHT;
   INSERT INTO STAG_FLIGHT VALUES ( ROW_FLIGHT.FLIGHT_NUMBER,ROW_FLIGHT.TAIL_NUMBER,ROW_FLIGHT.ORIGIN_AIRPORT,ROW_FLIGHT.DESTINATION_AIRPORT)
 
 EXIT WHEN CUR_FLIGHT%NOTFOUND;
 
 CLOSE CUR_FLIGHT;
 
 
end;


create or replace procedure pr_stag_FLIGHT_INSERT_CURSOR
is

CURSOR  CUR_FLIGHT IS 
SELECT FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM FLIGHT_2017
  MINUS 
 SELECT  FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT, 'FLIGHT_2017' FROM STAG_FLIGHT);
 
 
begin 
 FOR ROW_FLIGHT CUR_FLIGHT LOOP
 
   INSERT INTO STAG_FLIGHT VALUES ( ROW_FLIGHT.FLIGHT_NUMBER,ROW_FLIGHT.TAIL_NUMBER,ROW_FLIGHT.ORIGIN_AIRPORT,ROW_FLIGHT.DESTINATION_AIRPORT)
 
END LOOP;

 
 
end;













