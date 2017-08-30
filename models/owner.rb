require_relative("../db/sql_runner")

class Owner

  attr_reader(:id)
  attr_accessor(:first_name, :surname, :address1, :address2, :town, :owner_picture)

  def initialize( details )
    @id = details['id'].to_i() if details['id']
    @first_name = details["first_name"]
    @surname = details["surname"]
    @address1 = details["address1"]
    @address2 = details["address2"]
    @town = details["town"]
    @owner_picture = details["owner_picture"]
  end

  def save
    sql = 'INSERT INTO owners
    (first_name, surname, address1, address2, town, owner_picture)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id;'
    values = [@first_name, @surname, @address1, @address2, @town, @owner_picture]
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
      (first_name, surname, address1, address2, town, bairns, owner_picture)
        =
      ($1, $2, $3, $4, $5, $6, $7)
      where id = $8;'
    values = [@first_name, @surname, @address1, @address2, @town, @owner_picture, @id]
    SqlRunner.run(sql, values)
  end

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

  def name
    return "#{@first_name} #{@surname}"
  end

end
