-- The flights_complaints db

DROP TABLE FlyU_flights CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE complaint CASCADE CONSTRAINTS;

-- Create a Database table to represent the "customer" entity.
CREATE TABLE customer(
	customer_id	INTEGER NOT NULL,
	customer_zip_code	VARCHAR(10),
	customer_type	VARCHAR(8),
	business	VARCHAR(20),
	customer_miles	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "customer".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_customer PRIMARY KEY (customer_id)
);

-- Create a Database table to represent the "complaint" entity.
CREATE TABLE complaint(
	complaint_id	INTEGER NOT NULL PRIMARY KEY,
	flight_number	INTEGER,
        tail_number VARCHAR(10),
	the_year	NUMBER(4),
	the_month	NUMBER(2),
	the_day	NUMBER(2),
	complaint_type	VARCHAR(5),
	description	VARCHAR(200),
	complaint_status	VARCHAR(7),
	allocated_to	VARCHAR(8),
	compensation_amnt	INTEGER,
	compensation_type	VARCHAR(8),
	customer_id	INTEGER NOT NULL
	);


CREATE TABLE FlyU_flights
( flight_the_year NUMBER(4),
    the_month NUMBER(2),
    the_day NUMBER(2),
    d_o_w NUMBER(1),
    flight_number NUMBER(10),
    tail_number VARCHAR2(10),
    origin_airport VARCHAR2(6),
    destination_airport VARCHAR2(6),
    arrival_delay VARCHAR2(10),
    diverted NUMBER(1),
    cancelled NUMBER(1),
    cancelled_reason VARCHAR2(1)
 );
 
ALTER TABLE FlyU_flights ADD CONSTRAINT pk1_flights PRIMARY KEY (flight_the_year, the_month, the_day, flight_number);
 

ALTER TABLE complaint ADD CONSTRAINT fk1_complaint_to_customer FOREIGN KEY(customer_id) REFERENCES customer(customer_id);
ALTER TABLE complaint ADD CONSTRAINT fk1_complaint_to_flight FOREIGN KEY(the_year, the_month, the_day, flight_numbe) REFERENCES FlyU_flights(flight_the_year, the_month, the_day, flight_number);
 

-- This constraint ensures that the foreign key of table "complaint"
-- correctly references the primary key of table "Flight"


INSERT INTO Customer VALUES (10, 'NY10', 'BUSINESS', 'IBM', '10000');
INSERT INTO Customer VALUES (101, 'NY101', 'BUSINESS', 'Google', '20000');
INSERT INTO Customer VALUES (102, 'NY102', 'BUSINESS', 'Amazon', '50000');
INSERT INTO Customer VALUES (103, 'NY103', 'BUSINESS', 'Facebook', '110000');
INSERT INTO Customer VALUES (104, 'NY104', 'BUSINESS', 'HP', '100009');
INSERT INTO Customer VALUES (105, 'NY105', 'BUSINESS', 'SkyBet', '19000');
INSERT INTO Customer VALUES (106, 'NY106', 'BUSINESS', 'Hermes', '1000');
INSERT INTO Customer VALUES (107, 'NY107', 'BUSINESS', 'Apple', '110000');
INSERT INTO Customer VALUES (108, 'NY108', 'BUSINESS', 'LCC', '700');
INSERT INTO Customer VALUES (109, 'NY109', 'BUSINESS', 'LB', '0');
INSERT INTO Customer VALUES (100, 'NY100', 'BUSINESS', 'IBM', '10000');

-- There is no PK for FlyU_flights, as the flight may have a number of reasons for complaints 
INSERT INTO FlyU_flights VALUES ('2017','1','3','6','291','N3GYAA','JFK','AUS','883','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','1','3','6','2314','N3LCAA','JFK','BOS','128','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','1','4','7','1096','N3DJAA','JFK','BOS','104','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','1','4','7','291','N3KHAA','JFK','AUS','107','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','1','4','7','2314','N3DJAA','JFK','BOS','114','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','1','6','2','2314','N3JYAA','JFK','BOS','144','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','1','7','3','291','N3GPAA','JFK','AUS','119','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','2','3','2','1096','N3CMAA','JFK','BOS','138','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','2','3','2','2314','N3CMAA','JFK','BOS','157','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','2','5','4','2314','N3KFAA','JFK','BOS','103','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','2','8','7','1096','N3AAAA','JFK','BOS','135','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','2','10','2','1096','N3ADAA','JFK','BOS','102','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','2','16','1','193','N3CRAA','JFK','BOS','159','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','2','16','1','1096','N3EKAA','JFK','BOS','111','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','2','16','1','2314','N3JLAA','JFK','BOS','152','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','2','21','6','1096','N3BVAA','JFK','BOS','183','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','2','21','6','2314','N3ATAA','JFK','BOS','198','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','2','22','7','84','N3BVAA','JFK','BOS','157','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','2','27','5','2314','N3GNAA','JFK','BOS','121','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','3','1','7','193','N3CWAA','JFK','BOS','166','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','3','5','4','193','N3BVAA','JFK','BOS','183','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','3','5','4','2314','N3FYAA','JFK','BOS','169','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','3','7','6','291','N3CHAA','JFK','AUS','156','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','3','15','7','291','N3FBAA','JFK','AUS','178','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','3','17','2','2314','N3DCAA','JFK','BOS','217','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','3','20','5','291','N3KDAA','JFK','AUS','257','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','3','21','6','84','N3BWAA','JFK','BOS','107','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','3','25','3','2314','N3GAAA','JFK','BOS','103','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','3','26','4','291','N3AXAA','JFK','AUS','197','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','3','26','4','2314','N3BGAA','JFK','BOS','688','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','3','28','6','193','N3MEAA','JFK','BOS','105','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','4','4','6','84','N3FGAA','JFK','BOS','104','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','4','4','6','2314','N3HUAA','JFK','BOS','227','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','4','10','5','1664','N342AA','JFK','BOS','104','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','4','12','7','84','N3LEAA','JFK','BOS','345','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','4','13','1','291','N3ADAA','JFK','AUS','113','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','4','13','1','2314','N3EVAA','JFK','BOS','147','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','4','20','1','1664','N3GEAA','JFK','BOS','228','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','4','20','1','291','N3BUAA','JFK','AUS','221','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','4','20','1','2314','N3EFAA','JFK','BOS','131','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','4','22','3','291','N3JFAA','JFK','AUS','166','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','4','24','5','2314','N3JCAA','JFK','BOS','103','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','4','29','3','1664','N3EKAA','JFK','BOS','190','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','5','7','4','143','N3KXAA','JFK','BOS','206','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','5','18','1','67','N3GMAA','JFK','AUS','127','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','5','21','4','143','N3EMAA','JFK','BOS','253','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','5','22','5','67','N3BXAA','JFK','AUS','124','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','5','31','7','199','N3KMAA','JFK','BOS','113','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','5','31','7','235','N3ANAA','JFK','BOS','238','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','6','12','5','235','N3CPAA','JFK','BOS','101','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','6','15','1','1443','N790AA','JFK','BOS','195','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','6','20','6','67','N3DLAA','JFK','AUS','113','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','6','20','6','235','N3AFAA','JFK','BOS','154','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','6','21','7','67','N3ELAA','JFK','AUS','212','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','6','23','2','235','N3BPAA','JFK','BOS','229','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','6','28','7','199','N3DSAA','JFK','BOS','108','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','7','2','4','235','N3GUAA','JFK','BOS','107','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','7','15','3','1443','N3FJAA','JFK','BOS','118','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','7','17','5','199','N5FAAA','JFK','BOS','141','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','7','29','3','67','N3ETAA','JFK','AUS','138','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','7','30','4','67','N3HXAA','JFK','AUS','132','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','8','16','7','199','N3GSAA','JFK','BOS','175','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','8','18','2','199','N3DJAA','JFK','BOS','150','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','9','2','3','1443','N3LNAA','JFK','BOS','227','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','11','2','1','67','N3FGAA','JFK','AUS','221','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','11','5','4','67','N3JXAA','JFK','AUS','109','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','11','11','3','67','N3FSAA','JFK','AUS','171','0','0','','103');
INSERT INTO FlyU_flights VALUES ('2017','11','14','6','235','N3DEAA','JFK','BOS','110','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','12','1','2','67','N3MXAA','JFK','AUS','131','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','12','2','3','235','N3BPAA','JFK','BOS','135','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','12','3','4','84','N3APAA','JFK','BOS','152','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','12','14','1','67','N3HCAA','JFK','AUS','176','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','12','17','4','199','N795AA','JFK','BOS','104','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','12','23','3','199','N785AA','JFK','BOS','124','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','12','23','3','235','N3BXAA','JFK','BOS','175','0','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','12','25','5','235','N3DWAA','JFK','BOS','185','0','0','','102');
INSERT INTO FlyU_flights VALUES ('2017','12','26','6','84','N792AA','JFK','BOS','144','0','0','','104');
INSERT INTO FlyU_flights VALUES ('2017','12','26','6','199','N792AA','JFK','BOS','133','0','0','','105');
INSERT INTO FlyU_flights VALUES ('2017','12','27','7','235','N3LNAA','JFK','BOS','152','0','0','','106');
INSERT INTO FlyU_flights VALUES ('2017','12','28','1','235','N3DFAA','JFK','BOS','159','0','0','','107');
INSERT INTO FlyU_flights VALUES ('2017','12','29','2','391','N785AA','JFK','BOS','122','0','0','','108');
INSERT INTO FlyU_flights VALUES ('2017','12','29','2','199','N785AA','JFK','BOS','207','0','0','','109');
INSERT INTO FlyU_flights VALUES ('2017','12','29','2','67','N3KNAA','JFK','AUS','148','0','0','','10');
INSERT INTO FlyU_flights VALUES ('2017','5','5','2','291','N3EUAA','JFK','AUS','','1','0','','101');
INSERT INTO FlyU_flights VALUES ('2017','1','1','4','291','N3DNAA','JFK','AUS','','0','1','A','102');
INSERT INTO FlyU_flights VALUES ('2017','1','26','1','193','N3FMAA','JFK','BOS','','0','1','B','103');
INSERT INTO FlyU_flights VALUES ('2017','1','26','1','1096','N3AKAA','JFK','BOS','','0','1','B','104');
INSERT INTO FlyU_flights VALUES ('2017','1','26','1','291','N3JFAA','JFK','AUS','','0','1','B','105');
INSERT INTO FlyU_flights VALUES ('2017','1','26','1','2314','N3AKAA','JFK','BOS','','0','1','B','106');
INSERT INTO FlyU_flights VALUES ('2017','2','1','7','1096','N3DAAA','JFK','BOS','','0','1','B','108');
INSERT INTO FlyU_flights VALUES ('2017','2','1','7','2314','N3DAAA','JFK','BOS','','0','1','B','109');
INSERT INTO FlyU_flights VALUES ('2017','2','2','1','84','N3HSAA','JFK','BOS','','0','1','B','10');
INSERT INTO FlyU_flights VALUES ('2017','2','2','1','1096','N3LHAA','JFK','BOS','','0','1','B','10');
INSERT INTO FlyU_flights VALUES ('2017','2','2','1','291','N3BMAA','JFK','AUS','','0','1','B','101');
INSERT INTO FlyU_flights VALUES ('2017','2','2','1','2314','N3GRAA','JFK','BOS','','0','1','B','102');
INSERT INTO FlyU_flights VALUES ('2017','2','8','7','2314','N3AAAA','JFK','BOS','','0','1','B','103');
INSERT INTO FlyU_flights VALUES ('2017','2','9','1','84','N3ELAA','JFK','BOS','','0','1','B','104');
INSERT INTO FlyU_flights VALUES ('2017','2','9','1','291','N3BMAA','JFK','AUS','','0','1','B','105');
INSERT INTO FlyU_flights VALUES ('2017','2','9','1','2314','N3FHAA','JFK','BOS','','0','1','B','106');
INSERT INTO FlyU_flights VALUES ('2017','2','15','7','2314','N3FFAA','JFK','BOS','','0','1','B','107');
INSERT INTO FlyU_flights VALUES ('2017','3','1','7','2314','N3ADAA','JFK','BOS','','0','1','B','108');
INSERT INTO FlyU_flights VALUES ('2017','3','3','2','2314','N3CDAA','JFK','BOS','','0','1','B','109');
INSERT INTO FlyU_flights VALUES ('2017','3','5','4','84','N3EMAA','JFK','BOS','','0','1','B','10');
INSERT INTO FlyU_flights VALUES ('2017','3','5','4','1096','N3EMAA','JFK','BOS','','0','1','B','101');
INSERT INTO FlyU_flights VALUES ('2017','3','5','4','291','N3ATAA','JFK','AUS','','0','1','B','102');
INSERT INTO FlyU_flights VALUES ('2017','3','8','7','84','N3CDAA','JFK','BOS','','0','1','A','103');
INSERT INTO FlyU_flights VALUES ('2017','3','15','7','193','N3DSAA','JFK','BOS','','0','1','C','104');
INSERT INTO FlyU_flights VALUES ('2017','3','15','7','2314','N3BMAA','JFK','BOS','','0','1','B','105');
INSERT INTO FlyU_flights VALUES ('2017','3','20','5','193','N3KAAA','JFK','BOS','','0','1','A','106');
INSERT INTO FlyU_flights VALUES ('2017','4','20','1','178','N3GPAA','JFK','BOS','','0','1','B','107');
INSERT INTO FlyU_flights VALUES ('2017','4','21','2','84','N3JSAA','JFK','BOS','','0','1','B','108');
INSERT INTO FlyU_flights VALUES ('2017','6','8','1','199','N3CRAA','JFK','BOS','','0','1','C','109');
INSERT INTO FlyU_flights VALUES ('2017','7','13','1','84','N3JDAA','JFK','BOS','','0','1','A','10');
INSERT INTO FlyU_flights VALUES ('2017','7','14','2','67','N3BCAA','JFK','AUS','','0','1','B','101');
INSERT INTO FlyU_flights VALUES ('2017','7','16','4','1443','N3KGAA','JFK','BOS','','0','1','A','102');
INSERT INTO FlyU_flights VALUES ('2017','7','30','4','84','N3FCAA','JFK','BOS','','0','1','A','103');
INSERT INTO FlyU_flights VALUES ('2017','8','19','3','84','N3FTAA','JFK','BOS','','0','1','B','104');
INSERT INTO FlyU_flights VALUES ('2017','9','2','3','67','N3BLAA','JFK','AUS','','0','1','A','105');
INSERT INTO FlyU_flights VALUES ('2017','9','10','4','199','N3KVAA','JFK','BOS','','0','1','C','106');
INSERT INTO FlyU_flights VALUES ('2017','11','19','4','199','N3FTAA','JFK','BOS','','0','1','C','107');


INSERT INTO complaint VALUES ('1','291','N3GYAA','2017','1','3','','late','open','AA','0','0','10');
INSERT INTO complaint VALUES ('2','2314','N3LCAA','2017','1','3','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('3','1096','N3DJAA','2017','1','4','','late','open','BB','0','0','103');
INSERT INTO complaint VALUES ('4','291','N3KHAA','2017','1','4','','late','open','BB','0','0','105');
INSERT INTO complaint VALUES ('5','2314','N3DJAA','2017','1','4','','late','open','CC','0','0','101');
INSERT INTO complaint VALUES ('6','2314','N3JYAA','2017','1','6','','late','open','AA','0','0','108');
INSERT INTO complaint VALUES ('7','291','N3GPAA','2017','1','7','','late','open','AA','0','0','107');
INSERT INTO complaint VALUES ('8','1096','N3CMAA','2017','2','3','','late','open','BB','0','0','10');
INSERT INTO complaint VALUES ('9','2314','N3CMAA','2017','2','3','','late','open','BB','0','0','106');
INSERT INTO complaint VALUES ('10','2314','N3KFAA','2017','2','5','','late','open','CC','0','0','101');
INSERT INTO complaint VALUES ('11','1096','N3AAAA','2017','2','8','','late','open','AA','0','0','102');
INSERT INTO complaint VALUES ('12','1096','N3ADAA','2017','2','10','','late','open','AA','0','0','104');
INSERT INTO complaint VALUES ('13','193','N3CRAA','2017','2','16','','late','open','BB','0','0','107');
INSERT INTO complaint VALUES ('14','1096','N3EKAA','2017','2','16','','late','open','BB','0','0','108');
INSERT INTO complaint VALUES ('15','2314','N3JLAA','2017','2','16','','late','open','CC','0','0','109');
INSERT INTO complaint VALUES ('16','1096','N3BVAA','2017','2','21','','late','open','DD','0','0','10');
INSERT INTO complaint VALUES ('17','2314','N3ATAA','2017','2','21','','late','open','DD','0','0','100');
INSERT INTO complaint VALUES ('18','84','N3BVAA','2017','2','22','','late','open','AA','0','0','100');
INSERT INTO complaint VALUES ('19','2314','N3GNAA','2017','2','27','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('20','193','N3CWAA','2017','3','1','','late','open','BB','0','0','10');
INSERT INTO complaint VALUES ('21','193','N3BVAA','2017','3','5','','late','open','BB','0','0','10');
INSERT INTO complaint VALUES ('22','2314','N3FYAA','2017','3','5','','late','open','CC','0','0','101');
INSERT INTO complaint VALUES ('23','291','N3CHAA','2017','3','7','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('24','291','N3FBAA','2017','3','15','','late','open','AA','0','0','102');
INSERT INTO complaint VALUES ('25','2314','N3DCAA','2017','3','17','','late','open','BB','0','0','103');
INSERT INTO complaint VALUES ('26','291','N3KDAA','2017','3','20','','late','open','BB','0','0','104');
INSERT INTO complaint VALUES ('27','84','N3BWAA','2017','3','21','','late','open','CC','0','0','105');
INSERT INTO complaint VALUES ('28','2314','N3GAAA','2017','3','25','','late','open','AA','0','0','106');
INSERT INTO complaint VALUES ('29','291','N3AXAA','2017','3','26','','late','open','AA','0','0','107');
INSERT INTO complaint VALUES ('30','2314','N3BGAA','2017','3','26','','late','open','BB','0','0','108');
INSERT INTO complaint VALUES ('31','193','N3MEAA','2017','3','28','','late','open','BB','0','0','109');
INSERT INTO complaint VALUES ('32','84','N3FGAA','2017','4','4','','late','open','CC','0','0','10');
INSERT INTO complaint VALUES ('33','2314','N3HUAA','2017','4','4','','late','open','DD','0','0','100');
INSERT INTO complaint VALUES ('34','1664','N342AA','2017','4','10','','late','open','DD','0','0','100');
INSERT INTO complaint VALUES ('35','84','N3LEAA','2017','4','12','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('36','291','N3ADAA','2017','4','13','','late','open','AA','0','0','102');
INSERT INTO complaint VALUES ('37','2314','N3EVAA','2017','4','13','','late','open','BB','0','0','103');
INSERT INTO complaint VALUES ('38','1664','N3GEAA','2017','4','20','','late','open','BB','0','0','104');
INSERT INTO complaint VALUES ('39','291','N3BUAA','2017','4','20','','late','open','CC','0','0','106');
INSERT INTO complaint VALUES ('40','2314','N3EFAA','2017','4','20','','late','open','AA','0','0','107');
INSERT INTO complaint VALUES ('41','291','N3JFAA','2017','4','22','','late','open','AA','0','0','108');
INSERT INTO complaint VALUES ('42','2314','N3JCAA','2017','4','24','','late','open','BB','0','0','109');
INSERT INTO complaint VALUES ('43','1664','N3EKAA','2017','4','29','','late','open','BB','0','0','10');
INSERT INTO complaint VALUES ('44','143','N3KXAA','2017','5','7','','late','open','CC','0','0','100');
INSERT INTO complaint VALUES ('45','67','N3GMAA','2017','5','18','','late','open','AA','0','0','10');
INSERT INTO complaint VALUES ('46','143','N3EMAA','2017','5','21','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('47','67','N3BXAA','2017','5','22','','late','open','BB','0','0','101');
INSERT INTO complaint VALUES ('48','199','N3KMAA','2017','5','31','','late','open','BB','0','0','101');
INSERT INTO complaint VALUES ('49','235','N3ANAA','2017','5','31','','late','open','CC','0','0','101');
INSERT INTO complaint VALUES ('50','235','N3CPAA','2017','6','12','','late','open','DD','0','0','107');
INSERT INTO complaint VALUES ('51','1443','N790AA','2017','6','15','','late','open','DD','0','0','107');
INSERT INTO complaint VALUES ('52','67','N3DLAA','2017','6','20','','late','open','AA','0','0','108');
INSERT INTO complaint VALUES ('53','235','N3AFAA','2017','6','20','','late','open','AA','0','0','109');
INSERT INTO complaint VALUES ('54','67','N3ELAA','2017','6','21','','late','open','BB','0','0','109');
INSERT INTO complaint VALUES ('55','235','N3BPAA','2017','6','23','','late','open','BB','0','0','109');
INSERT INTO complaint VALUES ('56','199','N3DSAA','2017','6','28','','late','open','CC','0','0','109');
INSERT INTO complaint VALUES ('57','235','N3GUAA','2017','7','2','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('58','1443','N3FJAA','2017','7','15','','late','open','AA','0','0','101');
INSERT INTO complaint VALUES ('59','199','N5FAAA','2017','7','17','','late','open','BB','0','0','107');
INSERT INTO complaint VALUES ('60','67','N3ETAA','2017','7','29','','late','open','BB','0','0','107');
INSERT INTO complaint VALUES ('61','67','N3HXAA','2017','7','30','','late','open','CC','0','0','108');
INSERT INTO complaint VALUES ('62','199','N3GSAA','2017','8','16','','late','open','AA','0','0','108');
INSERT INTO complaint VALUES ('63','199','N3DJAA','2017','8','18','','late','open','AA','0','0','108');
INSERT INTO complaint VALUES ('64','1443','N3LNAA','2017','9','2','','late','open','BB','0','0','109');
INSERT INTO complaint VALUES ('65','67','N3FGAA','2017','11','2','','late','open','BB','0','0','100');
INSERT INTO complaint VALUES ('66','67','N3JXAA','2017','11','5','','late','open','CC','0','0','101');
INSERT INTO complaint VALUES ('67','67','N3FSAA','2017','11','11','','late','open','DD','0','0','101');
INSERT INTO complaint VALUES ('68','235','N3DEAA','2017','11','14','','late','open','DD','0','0','101');
INSERT INTO complaint VALUES ('84','291','N3EUAA','2017','5','5','','late','open','DD','0','0','107');
INSERT INTO complaint VALUES ('85','291','N3DNAA','2017','1','1','A','','open','DD','0','0','108');
INSERT INTO complaint VALUES ('86','193','N3FMAA','2017','1','26','B','cancelled','closed','AA','0','rebooked','101');
INSERT INTO complaint VALUES ('87','1096','N3AKAA','2017','1','26','B','cancelled','closed','AA','0','rebooked','102');
INSERT INTO complaint VALUES ('88','291','N3JFAA','2017','1','26','B','cancelled','closed','BB','0','rebooked','103');
INSERT INTO complaint VALUES ('89','2314','N3AKAA','2017','1','26','B','cancelled','closed','BB','0','rebooked','103');
INSERT INTO complaint VALUES ('97','1096','N3DAAA','2017','2','1','B','cancelled','closed','AA','0','rebooked','102');
INSERT INTO complaint VALUES ('98','2314','N3DAAA','2017','2','1','B','cancelled','closed','BB','0','rebooked','102');
INSERT INTO complaint VALUES ('99','84','N3HSAA','2017','2','2','B','cancelled','closed','BB','0','rebooked','103');
INSERT INTO complaint VALUES ('101','1096','N3LHAA','2017','2','2','B','cancelled','closed','DD','0','rebooked','103');
INSERT INTO complaint VALUES ('102','291','N3BMAA','2017','2','2','B','cancelled','closed','DD','0','rebooked','105');
INSERT INTO complaint VALUES ('103','2314','N3GRAA','2017','2','2','B','cancelled','closed','AA','0','rebooked','105');
INSERT INTO complaint VALUES ('104','2314','N3AAAA','2017','2','8','B','cancelled','closed','AA','0','rebooked','106');
INSERT INTO complaint VALUES ('105','84','N3ELAA','2017','2','9','B','cancelled','closed','BB','0','rebooked','106');
INSERT INTO complaint VALUES ('108','291','N3BMAA','2017','2','9','B','cancelled','closed','AA','0','rebooked','101');
INSERT INTO complaint VALUES ('109','2314','N3FHAA','2017','2','9','B','cancelled','closed','AA','0','rebooked','108');
INSERT INTO complaint VALUES ('114','2314','N3FFAA','2017','2','15','B','cancelled','closed','AA','0','rebooked','10');
INSERT INTO complaint VALUES ('117','2314','N3ADAA','2017','3','1','B','cancelled','closed','CC','0','rebooked','103');
INSERT INTO complaint VALUES ('118','2314','N3CDAA','2017','3','3','B','cancelled','closed','DD','0','rebooked','103');
INSERT INTO complaint VALUES ('119','84','N3EMAA','2017','3','5','B','cancelled','closed','DD','0','rebooked','106');
INSERT INTO complaint VALUES ('120','1096','N3EMAA','2017','3','5','B','cancelled','closed','AA','0','rebooked','106');
INSERT INTO complaint VALUES ('121','291','N3ATAA','2017','3','5','B','cancelled','open','AA','500','refund','107');
INSERT INTO complaint VALUES ('122','84','N3CDAA','2017','3','8','A','cancelled','open','BB','0','rebooked','109');
INSERT INTO complaint VALUES ('123','193','N3DSAA','2017','3','15','C','cancelled','open','BB','0','rebooked','109');
INSERT INTO complaint VALUES ('124','2314','N3BMAA','2017','3','15','B','cancelled','open','CC','500','refund','10');
INSERT INTO complaint VALUES ('125','193','N3KAAA','2017','3','20','A','cancelled','open','AA','0','','10');
INSERT INTO complaint VALUES ('126','178','N3GPAA','2017','4','20','B','cancelled','open','AA','600','refund','101');
INSERT INTO complaint VALUES ('127','84','N3JSAA','2017','4','21','B','cancelled','open','BB','700','refund','101');
INSERT INTO complaint VALUES ('128','199','N3CRAA','2017','6','8','C','cancelled','open','BB','0','rebooked','102');
INSERT INTO complaint VALUES ('129','84','N3JDAA','2017','7','13','A','cancelled','open','CC','0','rebooked','102');
INSERT INTO complaint VALUES ('130','67','N3BCAA','2017','7','14','B','cancelled','open','AA','600','refund','103');
INSERT INTO complaint VALUES ('131','1443','N3KGAA','2017','7','16','A','cancelled','open','AA','0','','103');
INSERT INTO complaint VALUES ('132','84','N3FCAA','2017','7','30','A','','open','BB','0','','104');
INSERT INTO complaint VALUES ('134','84','N3FTAA','2017','8','19','B','','open','BB','0','','104');
INSERT INTO complaint VALUES ('135','67','N3BLAA','2017','9','2','A','','open','CC','0','','104');
INSERT INTO complaint VALUES ('136','199','N3KVAA','2017','9','10','C','','closed','DD','100','voucher','105');
INSERT INTO complaint VALUES ('137','199','N3FTAA','2017','11','19','C','','closed','DD','100','voucher','105');
 