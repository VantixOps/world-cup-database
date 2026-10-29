#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games, teams")"

TEAMS=$(tail -n +2 games.csv | awk -F, '{print $3"\n"$4}' | sort -u | awk '{printf "(%c%s%c),", 39, $0, 39}' | sed 's/,$//')
$PSQL "INSERT INTO teams(name) VALUES $TEAMS ON CONFLICT (name) DO NOTHING" > /dev/null

GAMES=$(tail -n +2 games.csv | awk -F, '{printf "(%s,%c%s%c,(SELECT team_id FROM teams WHERE name=%c%s%c),(SELECT team_id FROM teams WHERE name=%c%s%c),%s,%s),", $1, 39, $2, 39, 39, $3, 39, 39, $4, 39, $5, $6}')
GAMES=${GAMES%,}
$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES $GAMES" > /dev/null
