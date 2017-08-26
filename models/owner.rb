require_relative("../db/sql_runner")

class Owner

  attr_reader(:id)
  attr_accessor(:first_name, :surname, :town, :children)

  def initialize( details )
    @id = details['id'].to_i() if details['id']
    @first_name = details["first_name"]
    @surname = details["surname"]
    @town = details["town"]
    @bairns = details["bairns"]
  end

  def save
    sql = 'INSERT INTO owners
    (first_name, surname, town, bairns)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id;'
    values = [@first_name, @surname, @town, @bairns]
    owner = SqlRunner.run(sql, values)
    owner_id = owner.first
    @id = owner_id["id"].to_i
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM owners WHERE id = $1;'
    values = [id]
    owner = SqlRunner.run(sql, values)
    return Owner.new(owner[0])
  end

  def self.all
    sql = 'SELECT * FROM owners;'
    values =[]
    owner_hash = SqlRunner.run(sql, values)
    owner = owner_hash.map {|owner| Owner.new(owner) }
    return owner
  end

  def self.delete_all()
    sql = 'DELETE FROM owners;'
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = 'DELETE FROM owners WHERE id = $1;'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE owners SET
      (first_name, surname, town, bairns)
        =
      ($1, $2, $3, $4)
      where id = $5;'
    values = [@first_name, @surname, @town, @bairns, @id]
    SqlRunner.run(sql, values)
  end
  #
  # def pets
  #   sql = 'SELECT pets.* FROM pets INNER JOIN adoption
  #     ON adoption.pet_id = pets.id WHERE owner_id = $1'
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |pet| Pet.new(pet) }
  # end

  def pets()
    sql = "SELECT pets.*
    FROM pets
    INNER JOIN adoptions
    ON adoptions.pet_id = pets.id
    WHERE owner_id = $1"
    values = [@id]
    pet_data = SqlRunner.run(sql, values)
    return pet_data.map { |pet| Pet.new(pet)}
  end

end
