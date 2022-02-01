-- Drop tables --
DROP TABLE stage_flight CASCADE CONSTRAINT;
DROP TABLE stage_complaint CASCADE CONSTRAINT;
DROP TABLE stage_customer CASCADE CONSTRAINT;


-- Drop sqquence --
DROP sequence seq_stageflight;
DROP sequence seq_stagecomplaint;
DROP sequence seq_stagecustomer;


-- Drop procedures --
DROP procedure pr_stage_flight; 
DROP procedure pr_stage_customer;
DROP procedure pr_stage_complaint;

