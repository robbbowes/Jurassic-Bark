DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS adoptions;

  CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    surname VARCHAR(255),
    address1 VARCHAR(255),
    address2 VARCHAR(255),
    town VARCHAR(255),
    bairns BOOLEAN,
    owner_picture VARCHAR(255)
);

  CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    adoptable BOOLEAN,
    breed VARCHAR(255),
    admission_date DATE,
    bairn_friendly BOOLEAN,
    picture VARCHAR(255)
  );

  CREATE TABLE adoptions (
    id SERIAL PRIMARY KEY,
    owner_id INT REFERENCES owners(id),
    pet_id INT REFERENCES pets(id)
  )
