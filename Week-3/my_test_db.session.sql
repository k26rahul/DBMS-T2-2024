SELECT
  *
FROM
  students;

delete FROM students
WHERE
  gender = 'F';

delete FROM students
WHERE
  gender IN (
    SELECT
      gender
    FROM
      students
    WHERE
      gender = 'M'
  );

delete FROM students
WHERE
  dateofbirth IN (
    SELECT
      dateofbirth
    FROM
      students
    WHERE
      dateofbirth < '2000-01-01'
  );

-- https://en.m.wikipedia.org/wiki/Join_(SQL)#
CREATE TABLE
  department (
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(20)
  );

CREATE TABLE
  employee (
    LastName VARCHAR(20),
    DepartmentID INT REFERENCES department (DepartmentID)
  );

INSERT INTO
  department
VALUES
  (31, 'Sales'),
  (33, 'Engineering'),
  (34, 'Clerical'),
  (35, 'Marketing');

INSERT INTO
  employee
VALUES
  ('Rafferty', 31),
  ('Jones', 33),
  ('Heisenberg', 33),
  ('Robinson', 34),
  ('Smith', 34),
  ('Williams', NULL);

SELECT
  *
FROM
  employee;

SELECT
  *
FROM
  department;

SELECT
  *
FROM
  employee
  CROSS JOIN department;

-- Inner join
SELECT
  employee.LastName,
  employee.DepartmentID,
  department.DepartmentName
FROM
  employee
  INNER JOIN department ON employee.DepartmentID = department.DepartmentID;

SELECT
  *
FROM
  employee
  INNER JOIN department USING (DepartmentID);

SELECT
  *
FROM
  employee
  NATURAL JOIN department;

-- Left outer join
SELECT
  *
FROM
  employee
  LEFT OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;

SELECT
  *
FROM
  employee
  LEFT OUTER JOIN department USING (DepartmentID);

SELECT
  *
FROM
  employee
  NATURAL LEFT OUTER JOIN department;

-- Right outer join
SELECT
  *
FROM
  employee
  RIGHT OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;

SELECT
  *
FROM
  employee
  RIGHT OUTER JOIN department USING (DepartmentID);

SELECT
  *
FROM
  employee
  NATURAL RIGHT OUTER JOIN department;

-- Full outer join
SELECT
  *
FROM
  employee
  FULL OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;

SELECT
  *
FROM
  employee
  FULL OUTER JOIN department USING (DepartmentID);

SELECT
  *
FROM
  employee
  NATURAL FULL OUTER JOIN department;