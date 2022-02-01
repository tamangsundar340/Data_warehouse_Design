
--------------------------------------------------------------
-- Database creation Script

-- Auto-Generated by QSEE-SuperLite (c) 2001-2004 QSEE-Technologies Ltd.

-- Verbose generation: ON

-- note: spaces within table/column names have been replaced by underscores (_)

-- Target DB: SQL2

-- Entity Model :Entity Relationship Diagram

-- To drop the tables generated by this script run -
--   'D:\British\Oracle\Assignemnt\SQL_drop.sql'

--------------------------------------------------------------



--------------------------------------------------------------
-- Table Creation --

-- Each entity on the model is represented by a table that needs to be created within the Database.
-- Within SQL new tables are created using the CREATE TABLE command.
-- When a table is created its name and its attributes are defined.
-- The values of which are derived from those specified on the model.
-- Certain constraints are sometimes also specified, such as identification of primary keys.

-- Create a Database table to represent the "fact_table" entity.
CREATE TABLE fact_table(
	facttable_id	INTEGER NOT NULL,
	time_id	INTEGER,
	complaint_id	INTEGER,
	customer_id	INTEGER,
	flight_id	INTEGER,
	total_cancelled_flights	NUMERIC(8,2),
	total_number_of_customers	NUMERIC(8,2),
	total_complaints	NUMERIC(8,2),
	fk1_time_id	INTEGER NOT NULL,
	fk2_flight_id	INTEGER NOT NULL,
	fk3_complaint_id	INTEGER NOT NULL,
	fk4_customer_id	INTEGER NOT NULL,
	-- Specify the PRIMARY KEY constraint for table "fact_table".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_fact_table PRIMARY KEY (facttable_id)
);

-- Create a Database table to represent the "dim_flights" entity.
CREATE TABLE dim_flights(
	flight_id	INTEGER NOT NULL,
	flight_number	INTEGER NOT NULL,
	cancelled	NUMERIC(8,2),
	diverte	NUMERIC(8,2),
	origin_airport	VARCHAR(200),
	destination_airport	VARCHAR(200),
	-- Specify the PRIMARY KEY constraint for table "dim_flights".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_dim_flights PRIMARY KEY (flight_id)
);

-- Create a Database table to represent the "dim_time" entity.
CREATE TABLE dim_time(
	time_id	INTEGER NOT NULL,
	year	DATE NOT NULL,
	month	DATE NOT NULL,
	day	DATE NOT NULL,
	-- Specify the PRIMARY KEY constraint for table "dim_time".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_dim_time PRIMARY KEY (time_id)
);

-- Create a Database table to represent the "dim_compalint" entity.
CREATE TABLE dim_compalint(
	complaint_id	INTEGER NOT NULL,
	complaint_type	VARCHAR(200),
	description	VARCHAR(200),
	complain_status	VARCHAR(200) NOT NULL,
	compensation_amount	NUMERIC(8,2),
	allocated_to	VARCHAR(200),
	-- Specify the PRIMARY KEY constraint for table "dim_compalint".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_dim_compalint PRIMARY KEY (complaint_id)
);

-- Create a Database table to represent the "dim_customers" entity.
CREATE TABLE dim_customers(
	customer_id	INTEGER NOT NULL,
	customer_type	VARCHAR(200) NOT NULL,
	customer_zip_code	VARCHAR(200),
	customer_miles	VARCHAR(200),
	-- Specify the PRIMARY KEY constraint for table "dim_customers".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_dim_customers PRIMARY KEY (customer_id)
);


--------------------------------------------------------------
-- Alter Tables to add fk constraints --

-- Now all the tables have been created the ALTER TABLE command is used to define some additional
-- constraints.  These typically constrain values of foreign keys to be associated in some way
-- with the primary keys of related tables.  Foreign key constraints can actually be specified
-- when each table is created, but doing so can lead to dependency problems within the script
-- i.e. tables may be referenced before they have been created.  This method is therefore safer.

-- Alter table to add new constraints required to implement the "fact_table_dim_time" relationship

-- This constraint ensures that the foreign key of table "fact_table"
-- correctly references the primary key of table "dim_time"

ALTER TABLE fact_table ADD CONSTRAINT fk1_fact_table_to_dim_time FOREIGN KEY(fk1_time_id) REFERENCES dim_time(time_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "fact_table_dim_flights" relationship

-- This constraint ensures that the foreign key of table "fact_table"
-- correctly references the primary key of table "dim_flights"

ALTER TABLE fact_table ADD CONSTRAINT fk2_fact_table_to_dim_flights FOREIGN KEY(fk2_flight_id) REFERENCES dim_flights(flight_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "fact_table_dim_compalint" relationship

-- This constraint ensures that the foreign key of table "fact_table"
-- correctly references the primary key of table "dim_compalint"

ALTER TABLE fact_table ADD CONSTRAINT fk3_fact_table_to_dim_compalint FOREIGN KEY(fk3_complaint_id) REFERENCES dim_compalint(complaint_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "fact_table_dim_customers" relationship

-- This constraint ensures that the foreign key of table "fact_table"
-- correctly references the primary key of table "dim_customers"

ALTER TABLE fact_table ADD CONSTRAINT fk4_fact_table_to_dim_customers FOREIGN KEY(fk4_customer_id) REFERENCES dim_customers(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


--------------------------------------------------------------
-- End of DDL file auto-generation
--------------------------------------------------------------
