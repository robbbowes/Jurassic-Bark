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
    pet_name VARCHAR(255),
    pet_type VARCHAR(255),
    breed VARCHAR(255),
    adm_date DATE,
    bairn_friendly BOOLEAN,
    adopted BOOLEAN,
    owner_id INT REFERENCES owners(id)
  );
