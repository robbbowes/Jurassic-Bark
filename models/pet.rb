require_relative("../db/sql_runner")
require_relative("./owner")

class Pet

  attr_reader(:id)
  attr_accessor(:name, :adoptable, :breed, :admission_date, :bairn_friendly)

  def initialize( details )
    @id = details["id"].to_i
    @name = details["name"]
    @adoptable = details["adoptable"]
    @breed = details["breed"]
    @admission_date = details["admission_date"]
    @bairn_friendly = details["bairn_friendly"]
  end

  def save
    sql = 'INSERT INTO pets
    (name, adoptable, breed, admission_date, bairn_friendly)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id;'
    values = [@name, @adoptable, @breed, @admission_date, @bairn_friendly]
    pet = SqlRunner.run(sql, values)
    pet_id = pet.first
    @id = pet_id["id"].to_i
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM pets WHERE id = $1;'
    values = [id]
    result = SqlRunner.run(sql, values)
    return Pet.new(result[0])
  end

  def self.all
    sql = 'SELECT * FROM pets;'
    values = []
    pets_hash = SqlRunner.run(sql, values)
    pets = pets_hash.map { |pet| Pet.new(pet) }
    return pets
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
      (name, adoptable, breed, admission_date, bairn_friendly)
        =
      ($1, $2, $3, $4, $5)
        WHERE id = $6'
    values = [@name, @adoptable, @breed, @admission_date,
              @bairn_friendly, @id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = "SELECT owners.*
    FROM owners
    INNER JOIN adoptions
    ON adoptions.owner_id = owners.id
    WHERE pet_id = $1"
    values = [@id]
    owner_data = SqlRunner.run(sql, values)
    return owner_data.map { |owner| Owner.new(owner)}
  end

end
