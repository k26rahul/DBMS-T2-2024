-- 8
SELECT
  name,
  dept_name,
  salary
FROM
  instructor
ORDER BY
  dept_name DESC,
  salary;

-- 12
SELECT
  *
FROM
  instructor
WHERE
  dept_name = 'Accounting'
  AND salary > ANY (
    SELECT
      salary
    FROM
      instructor
    WHERE
      dept_name = 'Psychology'
  );

-- 21
SELECT
  title
FROM
  course
WHERE
  course_id IN (
    (
      SELECT
        course_id
      FROM
        section
      WHERE
        semester = 'Fall'
    )
    INTERSECT
    (
      SELECT
        course_id
      FROM
        section
      WHERE
        semester = 'Spring'
    )
  );

-- 22
SELECT
  building,
  count(DISTINCT ID)
FROM
  takes
  NATURAL JOIN section
WHERE
  year BETWEEN 2005 AND 2008
GROUP BY
  building;

-- 25
SELECT
  count(*)
FROM
  (
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Fall'
    EXCEPT
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Spring'
  );

SELECT
  *
FROM
  instructor
ORDER BY
  dept_name DESC,
  name;

SELECT
  *
FROM
  instructor
WHERE
  dept_name = 'Accounting'
  AND salary > ANY (
    SELECT
      salary
    FROM
      instructor
    WHERE
      dept_name = 'Psychology'
  );

SELECT
  title
FROM
  course
WHERE
  course_id IN (
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Fall'
    INTERSECT
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Spring'
  );

SELECT
  *
FROM
  classroom;

SELECT
  *
FROM
  section;

SELECT
  *
FROM
  takes;

SELECT
  building,
  count(DISTINCT ID)
FROM
  takes
  NATURAL JOIN section
  NATURAL JOIN classroom
GROUP BY
  building;

SELECT
  *
FROM
  takes,
  section,
  classroom;

SELECT
  max(salary)
FROM
  instructor
WHERE
  dept_name = 'Psychology';

SELECT
  name,
  salary
FROM
  instructor
WHERE
  dept_name IN (
    SELECT
      dept_name
    FROM
      instructor
    GROUP BY
      dept_name
    HAVING
      avg(salary) > (
        SELECT
          max(salary)
        FROM
          instructor
        WHERE
          dept_name = 'Psychology'
      )
  );