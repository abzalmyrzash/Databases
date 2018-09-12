CREATE TABLE countries(
	country_id SERIAL PRIMARY KEY,
	country_name VARCHAR(50),
	region_id INTEGER,
	population INTEGER);
	
INSERT INTO countries VALUES (DEFAULT, 'Kazakhstan', 2, 18000000);
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Russia');
INSERT INTO countries (region_id) VALUES (NULL);

SELECT * FROM countries;

INSERT INTO countries VALUES (DEFAULT, 'USA', NULL, 300000000), (DEFAULT, 'UK', 11, 65000000), (DEFAULT, 'Australia', 42, 22000000);

ALTER TABLE countries 
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name) VALUES (DEFAULT);

INSERT INTO countries DEFAULT VALUES;



CREATE TABLE countries_new
(LIKE countries);

SELECT * FROM countries_new;

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new
SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries_new
SET population = population * 1.1 WHERE population IS NOT NULL
RETURNING country_name, population AS "New Population";


DELETE FROM countries_new
WHERE population < 100000 OR population IS NULL;

DELETE FROM countries_new
WHERE country_id IS NOT NULL
RETURNING *;

DELETE FROM countries
RETURNING *;