-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers(
  id SERIAL PRIMARY KEY,
  first TEXT NOT NULL,
  last TEXT NOT NULL
);
CREATE TABLE country(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);
CREATE TABLE airline(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);
INSERT INTO passengers (first, last) VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

INSERT INTO country (name) VALUES 
('United States'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('China'),
('Chile');

INSERT INTO airline (name) VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

CREATE TABLE city(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  country INTEGER REFERENCES country(id)
);
INSERT INTO city (name, country) VALUES 
('Chicago', (SELECT id FROM country WHERE name='United States')),
('Seattle', (SELECT id FROM country WHERE name='United States')),
('New York', (SELECT id FROM country WHERE name='United States')),
('Las Vegas', (SELECT id FROM country WHERE name='United States')),
('Charlotte', (SELECT id FROM country WHERE name='United States')),
('New Orleans', (SELECT id FROM country WHERE name='United States')),
('Cedar Rapids', (SELECT id FROM country WHERE name='United States')),
('Los Angeles', (SELECT id FROM country WHERE name='United States')),
('Washington DC', (SELECT id FROM country WHERE name='United States')),
('London', (SELECT id FROM country WHERE name='United Kingdom')),
('Mexico City', (SELECT id FROM country WHERE name='Mexico')),
('Casablanca', (SELECT id FROM country WHERE name='Morocco')),
('Beijing', (SELECT id FROM country WHERE name='China')),
('Santiago', (SELECT id FROM country WHERE name='Chile')),
('Tokyo', (SELECT id FROM country WHERE name='Japan')),
('France', (SELECT id FROM country WHERE name='Paris')),
('Dubai', (SELECT id FROM country WHERE name='UAE')),
('Sao Paolo', (SELECT id FROM country WHERE name='Brazil'));

CREATE TABLE departures(
  id SERIAL PRIMARY KEY,
  time TEXT UNIQUE
);
CREATE TABLE arrivals(
  id SERIAL PRIMARY KEY,
  time TEXT UNIQUE
);
INSERT INTO departures (time) VALUES 
('2018-01-02 07:00:00'),
('2018-04-08 09:00:00'),
('2018-04-15 16:50:00'),
('2018-08-01 18:30:00'),
('2018-10-31 01:15:00'),
('2018-12-19 12:45:00'),
('2018-12-22 14:42:00'),
('2019-02-06 06:00:00'),
('2019-02-06 16:28:00'),
('2019-01-20 19:30:00');

INSERT INTO arrivals (time) VALUES 
('2018-01-02 08:03:00'),
('2018-04-08 12:00:00'),
('2018-04-15 21:00:00'),
('2018-08-01 21:50:00'),
('2018-10-31 12:55:00'),
('2018-12-19 16:15:00'),
('2018-12-22 15:56:00'),
('2019-01-20 22:45:00'),
('2019-02-06 07:47:00'),
('2019-02-06 19:18:00');

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  passenger_id INTEGER REFERENCES passengers(id),
  departure_id INTEGER REFERENCES departures(id),
  arrivals INTEGER REFERENCES arrivals(id),
  airline INTEGER REFERENCES airline(id),
  city_depart INTEGER REFERENCES city(id),
  city_arrive INTEGER REFERENCES city(id)
);

INSERT INTO tickets
  (seat, passenger_id, departure_id, arrivals, airline, city_depart, city_arrive)
VALUES
  ('33B',
  (SELECT id FROM passengers WHERE first='Jennifer' AND last='Finch'), 
  (SELECT id FROM departures WHERE time='2018-04-08 09:00:00'),
  (SELECT id FROM arrivals WHERE time='2018-04-08 12:00:00'),  
  (SELECT id FROM airline WHERE name='United'),
  (SELECT id FROM city WHERE name='Washington DC'),
  (SELECT id FROM city WHERE name='Seattle')
  ),('8A',
  (SELECT id FROM passengers WHERE first='Thadeus' AND last='Gathercoal'), 
  (SELECT id FROM departures WHERE time='2018-12-19 12:45:00'),
  (SELECT id FROM arrivals WHERE time='2018-12-19 16:15:00'),  
  (SELECT id FROM airline WHERE name='British Airways'),
  (SELECT id FROM city WHERE name='Tokyo'),
  (SELECT id FROM city WHERE name='London')
  ),('12F',
  (SELECT id FROM passengers WHERE first='Sonja' AND last='Pauley'), 
  (SELECT id FROM departures WHERE time='2018-01-02 07:00:00'),
  (SELECT id FROM arrivals WHERE time='2018-01-02 08:03:00'),  
  (SELECT id FROM airline WHERE name='Delta'),
  (SELECT id FROM city WHERE name='Los Angeles'),
  (SELECT id FROM city WHERE name='Las Vegas')
  ),('20A',
  (SELECT id FROM passengers WHERE first='Jennifer' AND last='Finch'), 
  (SELECT id FROM departures WHERE time='2018-04-15 16:50:00'),
  (SELECT id FROM arrivals WHERE time='2018-04-15 21:00:00'),  
  (SELECT id FROM airline WHERE name='Delta'),
  (SELECT id FROM city WHERE name='Seattle'),
  (SELECT id FROM city WHERE name='Mexico City')
  ),('23D',
  (SELECT id FROM passengers WHERE first='Waneta' AND last='Skeleton'), 
  (SELECT id FROM departures WHERE time='2018-08-01 18:30:00'),
  (SELECT id FROM arrivals WHERE time='2018-08-01 21:50:00'),  
  (SELECT id FROM airline WHERE name='TUI Fly Belgium'),
  (SELECT id FROM city WHERE name='Paris'),
  (SELECT id FROM city WHERE name='Casablanca')
  ),('18C',
  (SELECT id FROM passengers WHERE first='Thadeus' AND last='Gathercoal'), 
  (SELECT id FROM departures WHERE time='2018-10-31 01:15:00'),
  (SELECT id FROM arrivals WHERE time='2018-10-31 12:55:00'),  
  (SELECT id FROM airline WHERE name='Air China'),
  (SELECT id FROM city WHERE name='Dubai'),
  (SELECT id FROM city WHERE name='Beijing')
  ),('9E',
  (SELECT id FROM passengers WHERE first='Berkie' AND last='Wycliff'), 
  (SELECT id FROM departures WHERE time='2019-02-06 06:00:00'),
  (SELECT id FROM arrivals WHERE time='2019-02-06 07:47:00'),  
  (SELECT id FROM airline WHERE name='United'),
  (SELECT id FROM city WHERE name='New York'),
  (SELECT id FROM city WHERE name='Charlotte')
  ),('1A',
  (SELECT id FROM passengers WHERE first='Alvin' AND last='Leathes'), 
  (SELECT id FROM departures WHERE time='2018-12-22 14:42:00'),
  (SELECT id FROM arrivals WHERE time='2018-12-22 15:56:00'),  
  (SELECT id FROM airline WHERE name='American Airlines'),
  (SELECT id FROM city WHERE name='Cedar Rapids'),
  (SELECT id FROM city WHERE name='Chicago')
  ),('32B',
  (SELECT id FROM passengers WHERE first='Berkie' AND last='Wycliff'), 
  (SELECT id FROM departures WHERE time='2019-02-06 16:28:00'),
  (SELECT id FROM arrivals WHERE time='2019-02-06 19:18:00'),  
  (SELECT id FROM airline WHERE name='American Airlines'),
  (SELECT id FROM city WHERE name='Charlotte'),
  (SELECT id FROM city WHERE name='New Orleans')
  ),('10D',
  (SELECT id FROM passengers WHERE first='Cory' AND last='Squibbes'), 
  (SELECT id FROM departures WHERE time='2019-01-20 19:30:00'),
  (SELECT id FROM arrivals WHERE time='2019-01-20 22:45:00'),  
  (SELECT id FROM airline WHERE name='Avianca Brasil'),
  (SELECT id FROM city WHERE name='Sao Paolo'),
  (SELECT id FROM city WHERE name='Santiago'));
