-- 1
SELECT
  *
FROM
  book_authors
WHERE
  author_fname like '_';

-- 2
SELECT
  title,
  publisher
FROM
  book_catalogue
WHERE
  year not IN (2015, 2017);

-- 3
SELECT
  student_fname,
  student_lname
FROM
  students
WHERE
  dob BETWEEN '2002-05-01' and '2002-05-31'
  or dob BETWEEN '2003-05-01' and '2003-05-31';

-- 4
SELECT
  count(*) as total_member
FROM
  members
WHERE
  member_type = 'UG';

-- 5
SELECT
  department_code,
  count(*)
FROM
  students
WHERE
  gender = 'F'
GROUP BY
  department_code;

-- 11
SELECT
  *
FROM
  students
  natural JOIN departments;

-- 17
SELECT
  department_name
FROM
  students
  NATURAL JOIN departments
WHERE
  student_fname = 'Gita'
  and student_lname = 'Das';

-- 18
SELECT
  roll_no
FROM
  students
  NATURAL JOIN departments
WHERE
  gender = 'M'
  and department_building = 'Block_2';

-- 19
SELECT
  student_fname,
  student_lname,
  roll_no
FROM
  students
  NATURAL JOIN departments
WHERE
  department_building = 'Block_1';

-- 20
SELECT
  *
FROM
  members
WHERE
  member_no NOT IN (
    SELECT
      member_no
    FROM
      book_issue
  );

-- 23
SELECT
  doi
FROM
  book_issue
WHERE
  accession_no IN (
    SELECT
      accession_no
    FROM
      book_copies
    WHERE
      isbn_no IN (
        SELECT
          isbn_no
        FROM
          book_catalogue
        WHERE
          title = 'Learning with Python'
      )
  );

-- 23
SELECT
  doi
FROM
  book_catalogue
  NATURAL JOIN book_copies
  NATURAL JOIN book_issue
WHERE
  title = 'Learning with Python';

-- Meet
-- 01
SELECT
  author_fname,
  author_lname
FROM
  book_authors
WHERE
  author_fname like '_';

-- 02
SELECT
  title,
  year
FROM
  book_catalogue
WHERE
  year != 2015
  AND year != 2017;

-- 03
SELECT
  student_fname,
  student_lname
FROM
  students
WHERE
  dob BETWEEN '2002-05-01' AND '2002-05-30'
  OR dob BETWEEN '2003-05-01' AND '2003-05-30';

SELECT
  student_fname,
  student_lname
FROM
  students
WHERE
  dob BETWEEN '2002-05-01' AND '2002-05-30'
UNION
SELECT
  student_fname,
  student_lname
FROM
  students
WHERE
  dob BETWEEN '2003-05-01' AND '2003-05-30';

-- 04
SELECT
  count(*) as total_member
FROM
  members
WHERE
  member_type = 'UG';

-- 05
SELECT
  department_code,
  count(*)
FROM
  students
WHERE
  gender = 'F'
GROUP BY
  department_code;

SELECT
  *
FROM
  students
  INNER JOIN departments USING (department_code);

SELECT
  *
FROM
  students
  NATURAL JOIN departments;

SELECT
  department_name
FROM
  students
  INNER JOIN departments USING (department_code)
WHERE
  student_fname = 'Gita'
  and student_lname = 'Das';

SELECT
  roll_no
FROM
  students
  INNER JOIN departments USING (department_code)
WHERE
  gender = 'M'
  and department_building = 'Block_2';

SELECT
  student_fname,
  student_lname,
  roll_no
FROM
  students
  INNER JOIN departments USING (department_code)
WHERE
  department_building = 'Block_1';

SELECT
  *
FROM
  members
WHERE
  member_no NOT IN (
    SELECT
      member_no
    FROM
      book_issue
  );

SELECT
  *
FROM
  book_issue;

SELECT
  *
FROM
  book_copies;

SELECT
  *
FROM
  book_catalogue;

SELECT
  doi
FROM
  book_issue
  NATURAL JOIN book_copies
  NATURAL JOIN book_catalogue
WHERE
  title = 'Learning with Python';

SELECT
  *
FROM
  book_catalogue
WHERE
  year = 2015;