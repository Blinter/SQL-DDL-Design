-- from the terminal run:
-- psql < soccer_league.sql
DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE seasons(
  id SERIAL PRIMARY KEY,
  start_date TEXT NOT NULL,
  end_date TEXT NOT NULL
);
CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  teamid INTEGER REFERENCES teams (id)
);
CREATE TABLE matches(
  id SERIAL PRIMARY KEY,
  team1 INTEGER REFERENCES teams(id),
  team2 INTEGER REFERENCES teams(id),
  season INTEGER REFERENCES seasons(id),
  date TEXT NOT NULL
);
CREATE TABLE referees(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gameid INTEGER REFERENCES matches (id)
);
CREATE TABLE goals(
  id SERIAL PRIMARY KEY,
  playerid INTEGER REFERENCES players(id),
  gameid INTEGER REFERENCES matches(id)
);