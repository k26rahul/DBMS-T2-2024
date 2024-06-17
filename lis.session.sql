-- Write an SQL statement to find the first names and dob (student_fname, dob) of students who belong to the department with department code as 'ME' and who were born after '2003-06-15'.
SELECT
  students.student_fname,
  students.dob
FROM
  students
WHERE
  students.dob > '2003-06-15'
  and department_code = 'ME';

SELECT
  *
FROM
  departments;

-- Write an SQL statement to find the first names of faculty (faculty_fname) who belong to the department: 'Mechanical Engineering'.
SELECT
  faculty_fname
FROM
  faculty,
  departments
WHERE
  departments.department_name = 'Mechanical Engineering'
  and faculty.department_code = departments.department_code;

-- Write an SQL statement to find the roll number and mobile number (roll_no, mobile_no) of students who belong to the department with department code as 'CS' and who were born after '2001-06-15'.
SELECT
  *
FROM
  students
WHERE
  department_code = 'CS'
  and dob > '2001-06-15';

--  Write an SQL statement to find faculty ID of the faculty who belongs to the department:'Mechanical Engineering' and joined on '2016-04-08'.
SELECT
  faculty.id
FROM
  faculty,
  departments
WHERE
  department_name = 'Mechanical Engineering'
  AND faculty.department_code = departments.department_code
  and doj = '2016-04-08';