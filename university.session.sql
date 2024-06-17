SELECT
  name
FROM
  instructor;

SELECT
  name
FROM
  instructor
ORDER BY
  name;

SELECT
  name
FROM
  instructor
ORDER BY
  name DESC;

SELECT
  *
FROM
  instructor
ORDER BY
  name DESC;

SELECT
  *
FROM
  instructor
WHERE
  dept_name in ('Accounting', 'Physics', 'English')
ORDER BY
  dept_name,
  salary;

SELECT
  *
FROM
  instructor
WHERE
  dept_name = 'Accounting'
  or dept_name = 'Physics'
ORDER BY
  salary;

SELECT
  *
FROM
  instructor
WHERE
  salary > 50000
ORDER BY
  name
LIMIT
  5;

SELECT
  dept_name
from
  instructor;

SELECT DISTINCT
  dept_name
from
  instructor
ORDER BY
  dept_name;

SELECT
  123 as bad_number,
  191 as lucky_number;

SELECT
  123 as bad_number
from
  instructor;

select
  'A' as fake_col
from
  instructor;

SELECT
  name as good_name,
  salary / 12 as salary_per_month
from
  instructor;

select
  *
from
  instructor
where
  dept_name = 'Comp. Sci.'
  AND salary > 100000;

SELECT
  *
FROM
  instructor;

SELECT
  *
FROM
  teaches;

SELECT
  *
FROM
  instructor as i,
  teaches as t
where
  i.id = t.id
  and i.dept_name = 'Accounting'
ORDER BY
  i.name;

select distinct
  T.name,
  t.dept_name,
  t.salary
from
  instructor AS T,
  instructor AS S
where
  T.salary > S.salary
  and S.dept_name = 'Pol. Sci.';

SELECT
  *
FROM
  instructor
ORDER BY
  salary;

select
  *
from
  instructor as i1,
  instructor as i2;

SELECT
  name
FROM
  instructor
ORDER BY
  name;

SELECT
  name
FROM
  instructor
WHERE
  name like '%Lu%'
  or name like '%Le%';

SELECT
  name
FROM
  instructor
WHERE
  name like '___';

SELECT
  name
FROM
  instructor
LIMIT
  10;

SELECT
  name
FROM
  instructor
fetch first
  10 rows only;

select
  name,
  salary
from
  instructor
WHERE
  salary > 50000
  and salary < 60000;

SELECT
  *
FROM
  instructor;

SELECT
  *
FROM
  instructor
WHERE
  dept_name in ('Accounting', 'English')
  and salary > 40000;

select
  name,
  salary
from
  instructor
WHERE
  salary BETWEEN 50000 and 60000;

(
  SELECT
    *
  FROM
    section
  WHERE
    semester = 'Fall'
    and year = 2009
)
union
(
  SELECT
    *
  FROM
    section
  WHERE
    semester = 'Spring'
    and year = 2010
)
ORDER BY
  course_id;

(
  select
    *
  from
    section
  where
    semester = 'Fall'
    and year = 2009
)
except
(
  select
    *
  from
    section
  where
    semester = 'Spring'
    and year = 2010
);

select distinct
  T.salary
from
  instructor as T,
  instructor as S
where
  T.salary < S.salary;

select distinct
  salary
from
  instructor;

(
  select
    salary
  from
    instructor
)
except
(
  select
    T.salary
  from
    instructor as T,
    instructor as S
  where
    T.salary < S.salary
);

SELECT
  salary
FROM
  instructor
ORDER BY
  salary DESC
LIMIT
  1;

SELECT
  count(*) as how_many
FROM
  instructor;

SELECT
  avg(salary)
FROM
  instructor;

SELECT
  max(salary)
FROM
  instructor;

SELECT
  name,
  max(salary)
FROM
  instructor
GROUP BY
  name;

SELECT
  min(salary),
  avg(salary),
  max(salary)
FROM
  instructor;

SELECT
  count(DISTINCT ID)
FROM
  teaches
WHERE
  semester = 'Spring'
  AND year = 2010;

SELECT
  count(*)
FROM
  course;

SELECT
  *
FROM
  course;

SELECT
  dept_name,
  avg(salary) as avg_salary
FROM
  instructor
GROUP BY
  dept_name
ORDER BY
  avg_salary DESC;

select
  dept_name,
  avg(salary) as avg_salary
from
  instructor
group by
  dept_name
HAVING
  avg(salary) > 72000
ORDER BY
  avg_salary;

SELECT
  name as good_name
FROM
  instructor
WHERE
  name like 'Le%'
ORDER BY
  good_name;

SELECT
  max(salary)
FROM
  instructor;

SELECT
  salary
FROM
  instructor
WHERE
  (
    salary > 50000
    and salary < 600000
  )