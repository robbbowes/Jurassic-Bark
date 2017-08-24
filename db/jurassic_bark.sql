DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

  CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    surname VARCHAR(255),
    age INT,
    town VARCHAR(255),
    bairns BOOLEAN
);

  CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    adoptable BOOLEAN,
    breed VARCHAR(255),
    admission_date DATE,
    bairn_friendly BOOLEAN,
    owner_id INT REFERENCES owners(id)
  );
