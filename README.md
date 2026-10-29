# freeCodeCamp Relational Databases (V9) — World Cup Database

Solution for the freeCodeCamp lab "Build a World Cup Database".

Files required by the project:

- `worldcup.sql` — dump that rebuilds the `worldcup` database (`pg_dump -cC --inserts`)
- `insert_data.sh` — inserts the unique teams and all 32 games from `games.csv`
- `queries.sh` — runs the twelve required queries and prints the expected report
- `games.csv` — source data used by the insert script

Local verification: the course test suite in `.freeCodeCamp/test/1.1.test.js` passes 11 of 11 tests.
