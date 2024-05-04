-- from the terminal run:
-- psql < craigslist.sql
DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist
CREATE TABLE regions(
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL
);
CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  preferred_region INTEGER REFERENCES regions(id)
);
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post_text TEXT NOT NULL,
  location TEXT NOT NULL,
  user_id INTEGER REFERENCES users (id),
  region INTEGER REFERENCES regions (id),
  categoryid INTEGER REFERENCES categories(id)
);