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