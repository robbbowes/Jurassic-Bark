require_relative("../db/sql_runner")
require_relative("./owner")

class Pet

  attr_reader(:id)
  attr_accessor(:name, :adoptable, :breed, :admission_date, :bairn_friendly, :picture)

  def initialize( details )
    @id = details["id"].to_i if details['id']
    @name = details["name"]
    @adoptable = details["adoptable"] == 't' || details["adoptable"] == true
    @breed = details["breed"]
    @admission_date = details["admission_date"]
    @bairn_friendly = details["bairn_friendly"]
    @picture = details["picture"]
  end

  def adopted?()
    adoptions.length > 0
  end

  def adoptions()
    sql = 'SELECT * FROM adoptions WHERE pet_id = $1;'
    values = [@id]
    adoptions_hash = SqlRunner.run(sql, values)
    adoptions = adoptions_hash.map { |adoption| Adoption.new(adoption) }
    return adoptions
  end

  def save
    sql = 'INSERT INTO pets
    (name, adoptable, breed, admission_date, bairn_friendly, picture)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id;'
    values = [@name, @adoptable, @breed, @admission_date, @bairn_friendly, @picture]
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
      (name, adoptable, breed, admission_date, bairn_friendly, picture)
        =
      ($1, $2, $3, $4, $5, $6)
        WHERE id = $7'
    values = [@name, @adoptable, @breed, @admission_date,
              @bairn_friendly, @picture, @id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = 'SELECT owners.*
    FROM owners
    INNER JOIN adoptions
    ON adoptions.owner_id = owners.id
    WHERE pet_id = $1;'
    values = [@id]
    owner_data = SqlRunner.run(sql, values)
    return owner_data.map { |owner| Owner.new(owner)}
  end

  def self.breed_sort
    return Pet.all.sort_by{ |pet| pet.breed }
  end

end
