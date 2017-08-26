class Adoption

  attr_reader(:id)
  attr_accessor(:owner_id, :pet_id)

  def initialize( details )
    @id = details["id"].to_i if details['id']
    @owner_id = details["owner_id"].to_i
    @pet_id = details["pet_id"].to_i
  end

  def save
    sql = 'INSERT INTO adoptions
      (owner_id, pet_id)
      VALUES
      ($1, $2)
      RETURNING id;'
    values = [@owner_id, @pet_id]
    results = SqlRunner.run(sql, values)
    @id = results.first["id"].to_i()
  end

  def self.all
    sql = 'SELECT * FROM adoptions;'
    values = []
    adoption_hash = SqlRunner.run(sql, values)
    adoption = adoption_hash.map {|adoption| Adoption.new(adoption)}
    return adoption
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM adoptions WHERE id = $1;'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM adoptions;'
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = 'DELETE FROM adoptions WHERE id = $1;'
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE adoptions SET
      (owner_id, pet_id)
        =
      ($1, $2)
      WHERE id = $3;'
    values = [@owner_id, @pet_id]
    SqlRunner.run(sql, values)
  end

  def owner
    sql = 'SELECT * FROM owners WHERE id = $1;'
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    result = Owner.new( results.first )
    return result.first_name + " " + result.surname
  end

  # def pet
  #   sql = 'SELECT * FROM pets WHERE id = $1;'
  #   values = [@id]
  #   results = SqlRunner.run(sql, values).map{|hash| Pet.new(hash)}
  #   return results.first
  # end

  def pet()
    sql = "SELECT name FROM pets WHERE id = $1"
    values = [@pet_id]
    results = SqlRunner.run( sql, values )
    result = Pet.new( results.first )
    return result.name
  end

end
