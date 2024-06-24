SELECT
  course_id
FROM
  section
WHERE
  semester = 'Fall'
  AND year = 2009
INTERSECT
SELECT
  course_id
FROM
  section
WHERE
  semester = 'Spring'
  AND year = 2010;

-- INTERSECT SQ (IN)
SELECT
  course_id
FROM
  section
WHERE
  semester = 'Fall'
  AND year = 2009
  AND course_id IN (
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Spring'
      AND year = 2010
  );

SELECT
  course_id
FROM
  section
WHERE
  semester = 'Fall'
  AND year = 2009
EXCEPT
SELECT
  course_id
FROM
  section
WHERE
  semester = 'Spring'
  AND year = 2010;

-- EXCEPT SQ (NOT IN)
SELECT
  course_id
FROM
  section
WHERE
  semester = 'Fall'
  AND year = 2009
  AND course_id NOT IN (
    SELECT
      course_id
    FROM
      section
    WHERE
      semester = 'Spring'
      AND year = 2010
  );

SELECT
  course_id,
  sec_id,
  semester,
  year
FROM
  teaches
WHERE
  teaches.id = '10101';

SELECT
  COUNT(DISTINCT id)
FROM
  takes
WHERE
  (course_id, sec_id, semester, year) IN (
    SELECT
      course_id,
      sec_id,
      semester,
      year
    FROM
      teaches
    WHERE
      teaches.id = '10101'
  );

SELECT
  name,
  dept_name,
  salary
FROM
  instructor
WHERE
  dept_name = 'Biology';

SELECT DISTINCT
  T.name,
  T.dept_name
FROM
  instructor AS T,
  instructor AS S
WHERE
  T.salary > S.salary
  AND S.dept_name = 'Biology';

SELECT
  salary
FROM
  instructor
WHERE
  dept_name = 'Biology';

SELECT
  name,
  dept_name,
  salary
FROM
  instructor
WHERE
  salary > ALL (
    SELECT
      salary
    FROM
      instructor
    WHERE
      dept_name = 'Biology'
  )
ORDER BY
  name;

-- Find all the courses taught in both the Fall 2009 semester and in the Spring 2010 semester (EXISTS)
SELECT
  course_id
FROM
  section AS S
WHERE
  semester = 'Fall'
  AND year = 2009
  AND NOT EXISTS (
    SELECT
      course_id
    FROM
      section AS T
    WHERE
      semester = 'Spring'
      AND year = 2010
      AND S.course_id = T.course_id
  );

SELECT
  title,
  course_id
FROM
  course
WHERE
  dept_name = 'Biology';

-- all students who have taken all courses offered by the Biology department
SELECT DISTINCT
  S.id,
  S.name
FROM
  student AS S
WHERE
  NOT EXISTS (
    SELECT
      course_id
    FROM
      course
    WHERE
      dept_name = 'Biology'
    EXCEPT
    SELECT
      T.course_id
    FROM
      takes AS T
    WHERE
      S.id = T.id
  );

SELECT
  *
FROM
  course;

SELECT
  T.course_id
FROM
  course AS T
WHERE
  EXISTS (
    SELECT
      R.course_id
    FROM
      course AS R
    WHERE
      T.course_id = R.course_id
      AND R.year = 2009
  );

SELECT
  dept_name,
  AVG(salary) AS avg_salary
FROM
  instructor
GROUP BY
  dept_name
HAVING
  AVG(salary) > 42000;

SELECT
  dept_name,
  avg_salary
FROM
  (
    SELECT
      dept_name,
      AVG(salary) AS avg_salary
    FROM
      instructor
    GROUP BY
      dept_name
  )
WHERE
  avg_salary > 42000;

SELECT
  dept_name,
  avg_salary
FROM
  (
    SELECT
      dept_name,
      AVG(salary)
    FROM
      instructor
    GROUP BY
      dept_name
  ) AS dept_avg (dept_name, avg_salary)
WHERE
  avg_salary > 42000;

SELECT
  *
FROM
  department;

SELECT
  MAX(budget) AS max_budget
FROM
  department;

-- Find all the departments with the maximum budget
WITH
  max_budget (value) AS (
    SELECT
      MAX(budget)
    FROM
      department
  )
SELECT
  department.dept_name,
  max_budget.value AS max_budget
FROM
  department,
  max_budget
WHERE
  department.budget = max_budget.value;

with
  dept_total (dept_name, value) as (
    select
      dept_name,
      sum(salary)
  )
from
  instructor
group by
  dept_name,
  dept_total_avg (value) as (
    select
      avg(value)
    from
      dept_total
  )
select
  dept_name
from
  dept_total,
  dept_total_avg
where
  dept_total.value > dept_total_avg.value;

-- List all departments along with the number of instructors in each department
SELECT
  dept_name,
  (
    SELECT
      COUNT(*)
    FROM
      instructor
    WHERE
      department.dept_name = instructor.dept_name
  ) AS num_instructors
FROM
  department;

select
  dept_name
from
  instructor;

select
  dept_name
from
  department;

UPDATE instructor
SET
  salary = CASE
    WHEN salary <= 100000 THEN salary * 1.05
    ELSE salary * 1.03
  END;