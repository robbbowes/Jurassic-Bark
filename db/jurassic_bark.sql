DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

  CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  address TEXT
);

  CREATE TABLE pets (
    id SERIAL PRIMARY KEY,
    pet_name VARCHAR(255),
    pet_type VARCHAR(255),
    breed VARCHAR(255),
    addm_date DATE,
    owner_id INT REFERENCES owners(id)
  );