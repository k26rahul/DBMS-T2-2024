-- Write an SQL statement to find the team_id of the players who were born before the year '2003'
SELECT
  team_id
FROM
  players
WHERE
  dob < '2003-01-01';

-- Write an SQL statement to find the city and playground of the teams whose away-jersey color(jersey_away_color) is 'Pink'.
SELECT
  city,
  playground
FROM
  teams
WHERE
  jersey_away_color = 'Pink';

-- Write an SQL statement to find the names of players of the team: 'All Stars'.
SELECT
  team_id
FROM
  teams
WHERE
  name = 'All Stars';

SELECT
  name
FROM
  players
WHERE
  team_id = 'T0005';

SELECT
  players.name
FROM
  teams,
  players
WHERE
  teams.name = 'All Stars'
  and players.team_id = teams.team_id;