create table
  students (
    ID varchar(10),
    name varchar(20),
    dob date,
    gender char(1),
    primary key (ID)
  );

ALTER table students add class varchar(2);

ALTER table students add grades varchar(1) not null;

ALTER table students
drop grades;

INSERT INTO
  students
VALUES
  (1, 'rahul', '2003-09-25', 'm'),
  (2, 'vidhatri', '2004-06-01', 'f');

INSERT INTO
  students
VALUES
  (4, 'muskan', '2004-06-02', 'f', 12, 'A');

SELECT
  *
FROM
  students;

-- clear all records
delete FROM students;

-- delete the table
drop table students;

SELECT
  *
FROM
  students
WHERE
  dob > '2004-06-01';