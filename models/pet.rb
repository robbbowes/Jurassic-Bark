require_relative("../db/sql_runner")
require_relative("./owner")

class Pet

  attr_reader(:id)
  attr_accessor(:name, :adoptable, :breed, :admission_date, :bairn_friendly, :owner_id)

  def initialize( details )
    @id = details["id"].to_i
    @name = details["name"]
    @adoptable = details["adoptable"]
    @breed = details["breed"]
    @admission_date = details["admission_date"]
    @bairn_friendly = details["bairn_friendly"]
    @owner_id = details["owner_id"].to_i
  end

  def save
    sql = 'INSERT INTO pets
    (name, adoptable, breed, admission_date, bairn_friendly, owner_id)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id;'
    values = [@name, @adoptable, @breed, @admission_date, @bairn_friendly, @owner_id]
    pet = SqlRunner.run(sql, values)
    pet_id = pet.first
    @id = pet_id["id"].to_i
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM pets WHERE id = $1;'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM pets;'
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM pets;'
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = 'DELETE FROM pets WHERE id = $1;'
    values = [id]
    SqlRunner.run(sql , values)
  end

  def update
    sql = 'UPDATE pets SET
      (name, adoptable, breed, admission_date, bairn_friendly, owner_id)
        =
      ($1, $2, $3, $4, $5, $6)
        WHERE id = $7'
    values = [@name, @adoptable, @breed, @admission_date,
              @bairn_friendly, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

end
