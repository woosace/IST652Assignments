-- down script

if not exists( select * from sys.databases where name = 'compu')

    create database compu

GO
use compu
GO

-- Drop tables in reverse order of creation

DROP TABLE IF EXISTS requests;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS inventorys;
DROP TABLE IF EXISTS devices;
DROP TABLE IF EXISTS donors;
DROP TABLE IF EXISTS schools;
DROP TABLE if exists disability_ranks;
DROP table if exists district_ranks;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS device_types;

-- up script




-- Create table for device types

CREATE TABLE device_types (
  device_type_id INT NOT NULL,
  device_type_name VARCHAR(100)
 CONSTRAINT pk_device_types_device_type_id primary key (device_type_id)
);

INSERT INTO device_types (device_type_id, device_type_name) VALUES (1, 'iPad');
INSERT INTO device_types (device_type_id, device_type_name) VALUES (2, 'Samsung Tablet');
INSERT INTO device_types (device_type_id, device_type_name) VALUES (3, 'Macbook');
INSERT INTO device_types (device_type_id, device_type_name) VALUES (4, 'Chromebook');

-- Create table for districts

CREATE TABLE districts (
  district_id INT NOT NULL,
  district_name VARCHAR(100)
  CONSTRAINT pk_districts_district_id primary key (district_id)
);

-- Insert records for districts

INSERT INTO districts (district_id, district_name) VALUES (1, 'North School District');
INSERT INTO districts (district_id, district_name) VALUES (2, 'West School District');
INSERT INTO districts (district_id, district_name) VALUES (3, 'Town Square District');
INSERT INTO districts (district_id, district_name) VALUES (4, 'Uptown District');
INSERT INTO districts (district_id, district_name) VALUES (5, 'East Town District');

-- create table for district rank

CREATE TABLE district_ranks (
  district_rank_id INT NOT NULL,
  district_rank_district_id INT,
  district_rank_rank INT,
  CONSTRAINT pk_district_ranks_district_rank_id PRIMARY KEY (district_rank_id),
  FOREIGN KEY (district_rank_district_id) REFERENCES districts(district_id)
);

-- insert into district ranks

INSERT INTO district_ranks (district_rank_id, district_rank_district_id, district_rank_rank) VALUES (1, 1, 5);
INSERT INTO district_ranks (district_rank_id, district_rank_district_id, district_rank_rank) VALUES (2, 2, 3);
INSERT INTO district_ranks (district_rank_id, district_rank_district_id, district_rank_rank) VALUES (3, 3, 2);
INSERT INTO district_ranks (district_rank_id, district_rank_district_id, district_rank_rank) VALUES (4, 4, 4);
INSERT INTO district_ranks (district_rank_id, district_rank_district_id, district_rank_rank) VALUES (5, 5, 1);

-- create table for disability priority

create table disability_ranks(
disability_rank_id INT NOT NULL,
disability_rank_type VARCHAR(100) NOT NULL,
disability_rank_priority INT NOT NULL
CONSTRAINT pk_disability_ranks_disability_rank_id PRIMARY KEY (disability_rank_id)
);

-- Insert records into disability_ranks

INSERT INTO disability_ranks (disability_rank_id, disability_rank_type, disability_rank_priority) VALUES (1, 'Multiple Disabilities', 1);
INSERT INTO disability_ranks (disability_rank_id, disability_rank_type, disability_rank_priority) VALUES (2, 'Learning Disability', 2);
INSERT INTO disability_ranks (disability_rank_id, disability_rank_type, disability_rank_priority) VALUES (3, 'Hearing Disability', 3);
INSERT INTO disability_ranks (disability_rank_id, disability_rank_type, disability_rank_priority) VALUES (4, 'Visual Disability', 4);
INSERT INTO disability_ranks (disability_rank_id, disability_rank_type, disability_rank_priority) VALUES (5, 'Physical Disability', 5);

-- Create table for schools

CREATE TABLE schools (
  school_id INT NOT NULL,
  school_name VARCHAR(100),
  school_district_id INT,
  school_disabilities_program TINYINT DEFAULT 0,
  CONSTRAINT pk_schools_school_id PRIMARY KEY (school_id),
  CONSTRAINT fk_schools_district
    FOREIGN KEY (school_district_id)
    REFERENCES districts(district_id)
);

-- Inserting records for District 1
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (1, 'Central Middle School', 1, 0);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (2, 'West High School', 1, 1);

-- Inserting records for District 2
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (3, 'North Middle School', 2, 0);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (4, 'West Middle School', 2, 1);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (5, 'East High School', 2, 0);

-- Inserting records for District 3
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (6, 'East Middle School', 3, 1);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (7, 'South High School', 3, 0);

-- Inserting records for District 4
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (8, 'West Middle School', 4, 1);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (9, 'North High School', 4, 0);

-- Inserting records for District 5
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (10, 'South Middle School', 5, 0);
INSERT INTO schools (school_id, school_name, school_district_id, school_disabilities_program)
VALUES (11, 'East High School', 5, 1);

select * from schools

-- Create table for donors

CREATE TABLE donors (
  donor_id INT NOT NULL,
  donor_firstname VARCHAR(50) NOT NULL,
  donor_lastname VARCHAR(50) NOT NULL,
  donor_email VARCHAR(100) NOT NULL
  CONSTRAINT pk_donors_donor_id PRIMARY KEY (donor_id)
);

-- Insert records for donors

INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (1, 'John', 'Smith', 'john.smith@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (2, 'Jane', 'Doe', 'jane.doe@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (3, 'Michael', 'Johnson', 'michael.johnson@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (4, 'Emily', 'Brown', 'emily.brown@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (5, 'David', 'Miller', 'david.miller@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (6, 'Olivia', 'Taylor', 'olivia.taylor@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (7, 'Daniel', 'Anderson', 'daniel.anderson@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (8, 'Sophia', 'Clark', 'sophia.clark@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (9, 'Matthew', 'Walker', 'matthew.walker@example.com');
INSERT INTO donors (donor_id, donor_firstname, donor_lastname, donor_email) VALUES (10, 'Ava', 'Harris', 'ava.harris@example.com');

-- Create table for devices

CREATE TABLE devices (
  device_id INT NOT NULL,
  device_device_type_id INT,
  CONSTRAINT pk_devices_device_id primary key (device_id),
  CONSTRAINT fk_devices_device_type
    FOREIGN KEY (device_device_type_id)
    REFERENCES device_types(device_type_id)
);

-- Insert table into devices
INSERT INTO devices (device_id, device_device_type_id) VALUES (1, 1);
INSERT INTO devices (device_id, device_device_type_id) VALUES (2, 1);
INSERT INTO devices (device_id, device_device_type_id) VALUES (3, 2);
INSERT INTO devices (device_id, device_device_type_id) VALUES (4, 3);
INSERT INTO devices (device_id, device_device_type_id) VALUES (5, 3);
INSERT INTO devices (device_id, device_device_type_id) VALUES (6, 4);
INSERT INTO devices (device_id, device_device_type_id) VALUES (7, 4);
INSERT INTO devices (device_id, device_device_type_id) VALUES (8, 2);

select * from devices

-- Create table for inventory

CREATE TABLE inventorys (
  inventory_id INT NOT NULL,
  inventory_device_id INT,
  inventory_donor_id INT,
  inventory_is_available TINYINT,
  CONSTRAINT pk_inventorys_inventory_id primary key (inventory_id),
  CONSTRAINT fk_inventorys_device_id
    FOREIGN KEY (inventory_device_id)
    REFERENCES devices(device_id),
constraint fk_inventorys_donor_id
    FOREIGN KEY (inventory_donor_id)
    REFERENCES donors(donor_id)
);

-- Insert records into inventorys

-- Inserting records for inventory_id 1-10
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (1, 1, 1, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (2, 2, 2, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (3, 3, 3, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (4, 4, 4, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (5, 5, 5, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (6, 1, 6, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (7, 2, 7, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (8, 3, 8, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (9, 4, 9, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (10, 5, 10, 1);

-- Inserting records for inventory_id 11-20
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (11, 1, 1, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (12, 2, 2, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (13, 3, 3, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (14, 4, 4, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (15, 5, 5, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (16, 1, 6, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (17, 2, 7, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (18, 3, 8, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (19, 4, 9, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (20, 5, 10, 1);

-- Inserting records for inventory_id 21-30
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (21, 1, 1, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (22, 2, 2, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (23, 3, 3, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (24, 4, 4, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (25, 5, 5, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (26, 1, 6, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (27, 2, 7, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (28, 3, 8, 1);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (29, 4, 9, 0);
INSERT INTO inventorys (inventory_id, inventory_device_id, inventory_donor_id, inventory_is_available)
VALUES (30, 5, 10, 1);

-- Create table for students

CREATE TABLE students (
  student_id INT NOT NULL,
  student_firstname VARCHAR(50) NOT NULL,
  student_lastname VARCHAR(50) NOT NULL,
  student_age VARCHAR(2) NULL,
  student_grade_year VARCHAR(25) NOT NULL,
  student_gpa DECIMAL (2,2) NULL,
  student_disability_id INT not null,
  student_school_id INT NOT NULL,
  student_district_id INT NOT NULL,
  student_requests_made INT NULL
  CONSTRAINT pk_students_student_id PRIMARY key (student_id),
  CONSTRAINT fk_students_disability_id
    FOREIGN KEY (student_disability_id)
    REFERENCES disability_ranks(disability_rank_id),
  CONSTRAINT fk_students_school
    FOREIGN KEY (student_school_id)
    REFERENCES schools(school_id),
  CONSTRAINT fk_students_district
    FOREIGN KEY (student_district_id)
    REFERENCES districts(district_id)
);

ALTER TABLE students
ALTER COLUMN student_gpa DECIMAL(3, 2);

ALTER TABLE students
DROP COLUMN student_requests_made;



-- Insert records for students

INSERT INTO students (student_id, student_firstname, student_lastname, student_age, student_grade_year, student_gpa, student_disability_id, student_school_id, student_district_id)
VALUES
  (1, 'John', 'Smith', '16', '10th Grade', 3.75, 1, 1, 1),
  (2, 'Emily', 'Johnson', '15', '9th Grade', 3.88, 2, 1, 1),
  (3, 'Michael', 'Williams', '17', '11th Grade', 3.60, 1, 1, 1),
  (4, 'Olivia', 'Brown', '14', '8th Grade', 3.92, 2, 2, 1),
  (5, 'James', 'Jones', '15', '9th Grade', 3.80, 1, 2, 1),
  (6, 'Sophia', 'Davis', '16', '10th Grade', 3.65, 2, 3, 2),
  (7, 'Daniel', 'Miller', '15', '9th Grade', 3.95, 1, 4, 2),
  (8, 'Ava', 'Wilson', '17', '11th Grade', 3.72, 2, 4, 2),
  (9, 'Liam', 'Taylor', '14', '8th Grade', 3.81, 1, 5, 2),
  (10, 'Emma', 'Anderson', '15', '9th Grade', 3.88, 2, 5, 2),
  (11, 'Benjamin', 'Martinez', '16', '10th Grade', 3.70, 1, 6, 3),
  (12, 'Mia', 'Hernandez', '14', '8th Grade', 3.91, 2, 6, 3),
  (13, 'Elijah', 'Lopez', '15', '9th Grade', 3.76, 1, 6, 3),
  (14, 'Charlotte', 'Garcia', '17', '11th Grade', 3.84, 2, 7, 3),
  (15, 'William', 'Smith', '14', '8th Grade', 3.90, 1, 7, 3),
  (16, 'Amelia', 'Johnson', '15', '9th Grade', 3.78, 2, 7, 3),
  (17, 'Alexander', 'Williams', '16', '10th Grade', 3.68, 1, 8, 4),
  (18, 'Harper', 'Brown', '14', '8th Grade', 3.89, 2, 8, 4),
  (19, 'Daniel', 'Jones', '15', '9th Grade', 3.83, 1, 9, 4),
  (20, 'Evelyn', 'Davis', '17', '11th Grade', 3.79, 2, 9, 4),
  (26, 'Jacob', 'Miller', '15', '9th Grade', 3.82, 1, 9, 4),
  (27, 'Abigail', 'Wilson', '16', '10th Grade', 3.73, 2, 10, 5),
  (28, 'Noah', 'Taylor', '14', '8th Grade', 3.93, 1, 10, 5),
  (29, 'Sofia', 'Anderson', '15', '9th Grade', 3.87, 2, 11, 5),
  (30, 'Logan', 'Martinez', '17', '11th Grade', 3.77, 1, 11, 5);

-- Create table for requests

CREATE TABLE requests (
  request_id INT NOT NULL,
  request_student_id INT,
  request_device_id INT,
 request_is_eligible TINYINT,
 CONSTRAINT pk_requests_request_id PRIMARY key (request_id),
  CONSTRAINT fk_requests_student
    FOREIGN KEY (request_student_id)
    REFERENCES students(student_id),
  CONSTRAINT fk_requests_device
    FOREIGN KEY (request_device_id)
    REFERENCES devices(device_id)
);

-- insert into requests

INSERT INTO requests (request_id, request_student_id, request_device_id, request_is_eligible)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 0),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 0),
(6, 6, 6, 1),
(7, 7, 7, 0),
(8, 8, 8, 1);