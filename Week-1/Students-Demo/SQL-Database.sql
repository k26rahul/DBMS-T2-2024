DROP TABLE IF EXISTS students;

-- Create the students table
CREATE TABLE
  students (
    RollNumber INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Aadhar VARCHAR(12)
  );

-- Insert 20 student records
INSERT INTO
  students (
    RollNumber,
    Name,
    Gender,
    DateOfBirth,
    Email,
    Aadhar
  )
VALUES
  (
    1,
    'John Doe',
    'M',
    '2000-01-15',
    'john.doe@example.com',
    '123456789012'
  ),
  (
    2,
    'Jane Smith',
    'F',
    '2001-02-18',
    'jane.smith@example.com',
    '234567890123'
  ),
  (
    3,
    'Jim Brown',
    'M',
    '1999-05-22',
    'jim.brown@example.com',
    '345678901234'
  ),
  (
    4,
    'Jessica Jones',
    'F',
    '2000-07-13',
    'jessica.jones@example.com',
    '456789012345'
  ),
  (
    5,
    'Jack White',
    'M',
    '1998-11-23',
    'jack.white@example.com',
    '567890123456'
  ),
  (
    6,
    'Jennifer Black',
    'F',
    '2001-03-30',
    'jennifer.black@example.com',
    '678901234567'
  ),
  (
    7,
    'Jacob Green',
    'M',
    '2002-06-01',
    'jacob.green@example.com',
    '789012345678'
  ),
  (
    8,
    'Julia Blue',
    'F',
    '2000-12-12',
    'julia.blue@example.com',
    '890123456789'
  ),
  (
    9,
    'James Yellow',
    'M',
    '1999-04-19',
    'james.yellow@example.com',
    '901234567890'
  ),
  (
    10,
    'Joan Purple',
    'F',
    '2001-05-25',
    'joan.purple@example.com',
    '112345678901'
  ),
  (
    11,
    'Jeremy Red',
    'M',
    '2002-07-14',
    'jeremy.red@example.com',
    '223456789012'
  ),
  (
    12,
    'Jill Orange',
    'F',
    '1998-10-30',
    'jill.orange@example.com',
    '334567890123'
  ),
  (
    13,
    'Jasper Pink',
    'M',
    '1999-08-09',
    'jasper.pink@example.com',
    '445678901234'
  ),
  (
    14,
    'Janet Gray',
    'F',
    '2000-09-03',
    'janet.gray@example.com',
    '556789012345'
  ),
  (
    15,
    'Jordan Brown',
    'M',
    '2001-11-18',
    'jordan.brown@example.com',
    '667890123456'
  ),
  (
    16,
    'Josie White',
    'F',
    '2002-02-20',
    'josie.white@example.com',
    '778901234567'
  ),
  (
    17,
    'Jason Black',
    'M',
    '2000-03-15',
    'jason.black@example.com',
    '889012345678'
  ),
  (
    18,
    'Julie Green',
    'F',
    '1999-06-24',
    'julie.green@example.com',
    '990123456789'
  ),
  (
    19,
    'Jeff Blue',
    'M',
    '1998-12-11',
    'jeff.blue@example.com',
    '101234567890'
  ),
  (
    20,
    'June Yellow',
    'F',
    '2001-04-22',
    'june.yellow@example.com',
    '202345678901'
  );

-- Print student data
SELECT
  *
FROM
  students;

-- Add a new student
INSERT INTO
  students (
    RollNumber,
    Name,
    Gender,
    DateOfBirth,
    Email,
    Aadhar
  )
VALUES
  (
    21,
    'New Student',
    'M',
    '2003-05-01',
    'new.student@example.com',
    '303456789012'
  );

-- Remove a student
DELETE FROM students
WHERE
  RollNumber = 15;

-- Update a student's information
UPDATE students
SET
  Aadhar = '909876543210'
WHERE
  RollNumber = 2;

-- Print updated student data
SELECT
  *
FROM
  students;