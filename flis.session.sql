-- 6
SELECT
  name,
  dob
FROM
  managers
WHERE
  since BETWEEN '2019-01-01' and '2020-12-31';

-- 7
SELECT
  *
FROM
  teams
WHERE
  name like '_% S%';

-- 9
SELECT
  name
FROM
  players
WHERE
  name like 'S%'
  and name not like '%n';

-- 10
SELECT
  count(*)
FROM
  players
WHERE
  team_id = 'T0001';

-- 13
SELECT
  (
    SELECT
      dob
    FROM
      managers
    WHERE
      managers.team_id = players.team_id
  )
FROM
  players
WHERE
  name = 'Shlok';

-- 13
SELECT
  dob
FROM
  managers
WHERE
  team_id IN (
    SELECT
      team_id
    FROM
      players
    WHERE
      name = 'Shlok'
  );

-- 14
SELECT
  match_num
FROM
  matches
WHERE
  host_team_id IN (
    SELECT
      team_id
    FROM
      teams
    WHERE
      playground = 'Emirates Stadium'
  );

-- 15
SELECT
  name,
  player_id,
  dob
FROM
  players
WHERE
  team_id IN (
    SELECT
      team_id
    FROM
      teams
    WHERE
      name = 'Rainbow'
  );

-- 16
SELECT
  name
FROM
  teams
WHERE
  city IN (
    SELECT
      city
    FROM
      teams
    WHERE
      name = 'Amigos'
  );

-- 06
SELECT
  name,
  dob
FROM
  managers
WHERE
  since BETWEEN '2019-01-01' AND '2020-12-31';

SELECT
  *
FROM
  managers
  INNER JOIN players USING (team_id)
  INNER JOIN teams USING (team_id);

SELECT
  *
FROM
  teams
WHERE
  name LIKE '_% S%';

SELECT
  *
FROM
  players
WHERE
  name like 'S%'
  and name not LIKE '%n';

SELECT
  count(*)
FROM
  players
WHERE
  team_id = 'T0001';

SELECT
  *
FROM
  players
  INNER JOIN managers USING (team_id);

SELECT
  *
FROM
  players
  natural JOIN managers;

SELECT
  managers.dob
FROM
  players
  INNER JOIN managers USING (team_id)
WHERE
  players.name = 'Shlok';

SELECT
  match_num
FROM
  teams,
  matches
WHERE
  teams.team_id = matches.host_team_id
  AND playground = 'Emirates Stadium';

SELECT
  *
FROM
  players,
  teams
WHERE
  players.team_id = teams.team_id
  AND teams.name = 'Rainbow';

SELECT
  players.name,
  player_id,
  dob,
  city
FROM
  players
  INNER JOIN teams USING (team_id)
WHERE
  teams.name = 'Rainbow';

SELECT
  *
FROM
  teams
WHERE
  city != 'Amigos'
  AND city IN (
    SELECT
      city
    FROM
      teams
    WHERE
      name = 'Amigos'
  );

-- 2020-05-06
SELECT
  name
FROM
  matches
  INNER JOIN match_referees USING (match_num)
  INNER JOIN referees ON match_referees.referee = referees.referee_id;

-- Week 3: Practice Question 1
SELECT
  name
FROM
  teams
WHERE
  team_id IN (
    SELECT
      team_id
    FROM
      (
        SELECT
          host_team_id as team_id,
          count(host_team_id) as freq
        FROM
          matches
        GROUP BY
          host_team_id
        UNION ALL
        SELECT
          guest_team_id as team_id,
          count(guest_team_id) as freq
        FROM
          matches
        GROUP BY
          guest_team_id
      ) AS temp
    GROUP BY
      team_id
    HAVING
      sum(freq) > 3
  );