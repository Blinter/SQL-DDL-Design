-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  date TEXT NOT NULL
);

INSERT INTO albums
  (name, date)
VALUES
  ('Middle of Nowhere','04-15-1997'),
  ('A Night at the Opera','10-31-1975'),
  ('Daydream','11-14-1995'),
  ('A Star Is Born','09-27-2018'),
  ('Silver Side Up','08-21-2001'),
  ('The Blueprint 3','10-20-2009'),
  ('Prism','12-17-2013'),
  ('Hands All Over','06-21-2011'),
  ('Let Go','05-14-2002'),
  ('The Writing''s on the Wall','11-07-1999');

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER REFERENCES albums(id)
);

INSERT INTO songs
  (title, duration_in_seconds, album_id)
VALUES
  ('MMMBop', 238, (SELECT id FROM albums WHERE name='Middle of Nowhere')),
  ('Bohemian Rhapsody', 355, (SELECT id FROM albums WHERE name='A Night at the Opera')),
  ('One Sweet Day', 282, (SELECT id FROM albums WHERE name='Daydream')),
  ('Shallow', 216, (SELECT id FROM albums WHERE name='A Star Is Born')),
  ('How You Remind Me', 223, (SELECT id FROM albums WHERE name='Silver Side Up')),
  ('New York State of Mind', 276, (SELECT id FROM albums WHERE name='The Blueprint 3')),
  ('Dark Horse', 215, (SELECT id FROM albums WHERE name='Prism')),
  ('Moves Like Jagger', 201, (SELECT id FROM albums WHERE name='Hands All Over')),
  ('Complicated', 244, (SELECT id FROM albums WHERE name='Let Go')),
  ('Say My Name', 240, (SELECT id FROM albums WHERE name='The Writing''s on the Wall'));


CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  ord INTEGER NOT NULL,
  song INTEGER REFERENCES songs(id)
);
INSERT INTO artists
  (name, ord, song)
VALUES
  ('Hanson', 0, (SELECT id FROM albums WHERE name='Middle of Nowhere')),
  ('A Night at the Opera', 0, (SELECT id FROM albums WHERE name='Queen')),
  ('Mariah Cary', 0, (SELECT id FROM albums WHERE name='One Sweet Day')),
  ('Boyz II Men', 1, (SELECT id FROM albums WHERE name='One Sweet Day')),
  ('Lady Gaga', 0, (SELECT id FROM albums WHERE name='Shallow')),
  ('Bradley Cooper', 1, (SELECT id FROM albums WHERE name='Shallow')),
  ('Nickelback', 0, (SELECT id FROM albums WHERE name='How You Remind Me')),
  ('Jay Z', 0, (SELECT id FROM albums WHERE name='New York State of Mind')),
  ('Alicia Keys', 1, (SELECT id FROM albums WHERE name='New York State of Mind')),
  ('Katy Perry', 0, (SELECT id FROM albums WHERE name='Dark Horse')),
  ('Juicy J"', 1, (SELECT id FROM albums WHERE name='Dark Horse')),
  ('Maroon 5', 0, (SELECT id FROM albums WHERE name='Moves Like Jagger')),
  ('Christina Aguilera', 1, (SELECT id FROM albums WHERE name='Moves Like Jagger')),
  ('Avril Lavigne', 0, (SELECT id FROM albums WHERE name='Complicated')),
  ('Destiny''s Child', 0, (SELECT id FROM albums WHERE name='Say My Name'));

CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  ord INTEGER NOT NULL,
  song_id INTEGER REFERENCES songs(id)
);
INSERT INTO producers
  (name, ord, song_id)
VALUES
  ('Dust Brothers', 0, (SELECT id FROM songs WHERE title='MMMBop')),
  ('Stephen Lironi', 1, (SELECT id FROM songs WHERE title='MMMBop')),
  ('Roy Thomas Baker', 0, (SELECT id FROM songs WHERE title='Bohemian Rhapsody')),
  ('Walter Afanasieff', 0, (SELECT id FROM songs WHERE title='One Sweet Day')),
  ('Benjamin Rice', 0, (SELECT id FROM songs WHERE title='Shallow')),
  ('Rick Parashar', 0, (SELECT id FROM songs WHERE title='How You Remind Me')),
  ('Al Shux', 0, (SELECT id FROM songs WHERE title='New York State of Mind')),
  ('Max Martin', 0, (SELECT id FROM songs WHERE title='Dark Horse')),
  ('Cirkut', 1, (SELECT id FROM songs WHERE title='Dark Horse')),
  ('Shellback', 0, (SELECT id FROM songs WHERE title='Moves Like Jagger')),
  ('Benny Blanco', 1, (SELECT id FROM songs WHERE title='Moves Like Jagger')),
  ('The Matrix', 0, (SELECT id FROM songs WHERE title='Complicated')),
  ('Darkchild', 0, (SELECT id FROM songs WHERE title='Say My Name'));