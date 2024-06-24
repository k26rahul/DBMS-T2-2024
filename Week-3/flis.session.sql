SELECT
  *
FROM
  managers
WHERE
  since > "2020-01-01";

-- Week 3: Graded Question 1
SELECT
  *
FROM
  matches
WHERE
  match_date = '2020-05-15';

SELECT
  *
FROM
  match_referees
WHERE
  match_num = 'M0006';

SELECT
  'M0006' as match_num,
  name
FROM
  referees
WHERE
  referee_id = 'R0001';

SELECT
  name
FROM
  referees
WHERE
  referee_id = 'R0001';

SELECT
  match_num,
  (
    SELECT
      name
    FROM
      referees
    WHERE
      referee_id = assistant_referee_1
  )
FROM
  matches
  NATURAL INNER JOIN match_referees
WHERE
  match_date = '2020-05-15';

-- Week 3: Graded Question 2
-- Write an SQL statement to find the name of the eldest player in the team named 'Arawali'.
SELECT
  *
FROM
  teams
WHERE
  name = 'Arawali';

SELECT
  name
FROM
  players
WHERE
  team_id = 'T0006'
ORDER BY
  dob
LIMIT
  1;

SELECT
  players.name
FROM
  players
  INNER JOIN teams USING (team_id)
WHERE
  teams.name = 'Arawali'
ORDER BY
  dob
LIMIT
  1;

SELECT
  *
FROM
  players;

SELECT
  *
FROM
  teams;

-- Week 3: Graded Question 3
-- Write an SQL statement to find the name and dob of the players who belongs from the team names 'Amigos' or 'Black Eagles'.
SELECT
  players.name,
  dob
FROM
  players
  INNER JOIN teams USING (team_id)
WHERE
  teams.name IN ('Amigos', 'Black Eagles');