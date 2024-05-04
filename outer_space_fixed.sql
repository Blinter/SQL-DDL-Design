-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);
CREATE TABLE orbits(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);
CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits(id),
  galaxy_id INTEGER REFERENCES galaxies(id)
);
CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id)
);
INSERT INTO orbits (name) VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (name) VALUES 
('Milky Way');

INSERT INTO planets 
(name, orbital_period_in_years, orbits_around_id, galaxy_id)
VALUES
  ('Earth', 1.00, 
    (SELECT id FROM orbits WHERE name='The Sun'), 
    (SELECT id FROM galaxies WHERE name='Milky Way')),
  ('Mars', 1.88, 
    (SELECT id FROM orbits WHERE name='The Sun'), 
    (SELECT id FROM galaxies WHERE name='Milky Way')),
  ('Venus', 0.62, 
    (SELECT id FROM orbits WHERE name='The Sun'), 
    (SELECT id FROM galaxies WHERE name='Milky Way')),
  ('Neptune', 164.8, 
    (SELECT id FROM orbits WHERE name='The Sun'), 
    (SELECT id FROM galaxies WHERE name='Milky Way')),
  ('Proxima Centauri b', 0.03, 
    (SELECT id FROM orbits WHERE name='Proxima Centauri'), 
    (SELECT id FROM galaxies WHERE name='Milky Way')),
  ('Gliese 876 b', 0.23, 
    (SELECT id FROM orbits WHERE name='Gliese 876'), 
    (SELECT id FROM galaxies WHERE name='Milky Way'));

INSERT INTO moons 
(name, planet_id)
VALUES
  ('The Moon', (SELECT id FROM planets WHERE name='Earth')),
  ('Phobos',  (SELECT id FROM planets WHERE name='Mars')),
  ('Deimos',  (SELECT id FROM planets WHERE name='Mars')),
  ('Naiad',  (SELECT id FROM planets WHERE name='Neptune')),
  ('Thalassa', (SELECT id FROM planets WHERE name='Neptune')),
  ('Despina',  (SELECT id FROM planets WHERE name='Neptune')),
  ('Galatea', (SELECT id FROM planets WHERE name='Neptune')),
  ('Larissa', (SELECT id FROM planets WHERE name='Neptune')),
  ('S/2004 N 1',  (SELECT id FROM planets WHERE name='Neptune')),
  ('Proteus', (SELECT id FROM planets WHERE name='Neptune')),
  ('Triton', (SELECT id FROM planets WHERE name='Neptune')),
  ('Nereid', (SELECT id FROM planets WHERE name='Neptune')),
  ('Halimede', (SELECT id FROM planets WHERE name='Neptune')),
  ('Sao',  (SELECT id FROM planets WHERE name='Neptune')),
  ('Laomedeia', (SELECT id FROM planets WHERE name='Neptune')),
  ('Psamthe', (SELECT id FROM planets WHERE name='Neptune')),
  ('Neso', (SELECT id FROM planets WHERE name='Neptune'));