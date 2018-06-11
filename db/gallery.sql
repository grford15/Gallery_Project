DROP TABLE IF EXISTS exhibits;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  nationality VARCHAR(255),
  craft VARCHAR(255)
);

CREATE TABLE exhibits (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year_created INT,
  medium VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE
);
