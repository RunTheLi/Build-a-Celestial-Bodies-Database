CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    size NUMERIC NOT NULL,
    distance_from_earth INT NOT NULL,
    has_black_hole BOOLEAN NOT NULL,
    description TEXT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    temperature INT NOT NULL,
    mass NUMERIC NOT NULL,
    is_visible BOOLEAN NOT NULL,
    color VARCHAR(50)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    radius NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL,
    distance_from_star INT NOT NULL,
    atmosphere_composition TEXT
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    radius NUMERIC NOT NULL,
    distance_from_planet BIGINT NOT NULL,
    is_habitable BOOLEAN NOT NULL
);


CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    size NUMERIC NOT NULL,
    orbit_type VARCHAR(50),
    discovered_on DATE NOT NULL
);

INSERT INTO galaxy (name, size, distance_from_earth, has_black_hole, description) VALUES
('Milky Way', 100000, 0, TRUE, 'Our home galaxy.'),
('Andromeda', 220000, 2537000, TRUE, 'The nearest spiral galaxy.'),
('Triangulum', 60000, 3000000, FALSE, 'A member of the local group.'),
('Whirlpool', 76000, 23000000, TRUE, 'A classic spiral galaxy.'),
('Sombrero', 49000, 29000000, TRUE, 'A spiral galaxy with a large bulge.'),
('Cartwheel', 150000, 500000000, FALSE, 'A ring galaxy caused by a collision.');

INSERT INTO star (name, galaxy_id, temperature, mass, is_visible, color) VALUES
('Sun', 1, 5778, 1.0, TRUE, 'Yellow'),
('Sirius', 1, 9940, 2.1, TRUE, 'White'),
('Alpha Centauri', 1, 5790, 1.1, TRUE, 'Yellow'),
('Betelgeuse', 2, 3500, 20.0, TRUE, 'Red'),
('Vega', 3, 9602, 2.1, TRUE, 'White'),
('Rigel', 4, 12100, 21.0, TRUE, 'Blue');

INSERT INTO planet (name, star_id, radius, has_life, distance_from_star, atmosphere_composition) VALUES
('Mercury', 1, 2439.7, FALSE, 57900000, 'Oxygen, Sodium, Hydrogen, Helium'),
('Venus', 1, 6051.8, FALSE, 108200000, 'Carbon Dioxide, Nitrogen'),
('Earth', 1, 6371, TRUE, 149600000, 'Nitrogen, Oxygen, Argon'),
('Mars', 1, 3389.5, FALSE, 227900000, 'Carbon Dioxide, Nitrogen, Argon'),
('Jupiter', 1, 69911, FALSE, 778500000, 'Hydrogen, Helium'),
('Saturn', 1, 58232, FALSE, 1429000000, 'Hydrogen, Helium'),
('Uranus', 1, 25362, FALSE, 2871000000, 'Hydrogen, Helium, Methane'),
('Neptune', 1, 24622, FALSE, 4495000000, 'Hydrogen, Helium, Methane'),
('Proxima Centauri b', 3, 6371, TRUE, 40000000, 'Unknown'),
('Gliese 581g', 3, 6371, TRUE, 20000000, 'Carbon Dioxide, Nitrogen'),
('Kepler-186f', 5, 7000, TRUE, 500000000, 'Unknown'),
('HD 209458 b', 6, 143500, FALSE, 72000000, 'Hydrogen, Helium');

INSERT INTO moon (name, planet_id, radius, distance_from_planet, is_habitable) VALUES
('Luna', 3, 1737.1, 384400, FALSE),
('Phobos', 4, 11.2, 9376, FALSE),
('Deimos', 4, 6.2, 23463, FALSE),
('Io', 5, 1821.6, 421700, FALSE),
('Europa', 5, 1560.8, 671034, POSSIBLY_TRUE),
('Ganymede', 5, 2634.1, 1070400, FALSE),
('Callisto', 5, 2410.3, 1882700, FALSE),
('Titan', 6, 2574.7, 1221870, POSSIBLY_TRUE),
('Rhea', 6, 763.8, 527040, FALSE),
('Iapetus', 6, 734.5, 3561000, FALSE),
('Dione', 6, 561.4, 377400, FALSE),
('Tethys', 6, 531.1, 294670, FALSE),
('Mimas', 6, 198.2, 185520, FALSE),
('Enceladus', 6, 252.1, 237950, POSSIBLY_TRUE),
('Oberon', 7, 761.4, 583520, FALSE),
('Titania', 7, 788.9, 436300, FALSE),
('Ariel', 7, 578.9, 191020, FALSE),
('Umbriel', 7, 584.7, 266300, FALSE),
('Triton', 8, 1353.4, 354800, FALSE),
('Charon', 9, 606.0, 19591, FALSE);

INSERT INTO asteroid (name, star_id, size, orbit_type, discovered_on) VALUES
('Ceres', 1, 939.4, 'Main Belt', '1801-01-01'),
('Vesta', 1, 525.4, 'Main Belt', '1807-03-29'),
('Pallas', 1, 512, 'Main Belt', '1802-03-28');


