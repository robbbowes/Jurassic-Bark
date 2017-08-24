require_relative("../db/sql_runner")

class Owner

  attr_reader(:id)
  attr_accessor(:first_name, :surname, :address, :town, :children)

  def initialize( details )
    @id = details["id"].to_i() if details["id"]
    @first_name = details["first_name"]
    @surname = details["surname"]
    @address = details["address"]
    @town = details["town"]
    @children = details["children"]
  end

  def save
    sql = 'INSERT INTO owners WHERE
    (first_name, surname, address, town, children)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id;'
    values = [@first_name, @surname, @address, @town, @children]
    owner = SqlRunner.run(sql, values).first
    @id = owner["id"].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM students;'
    values = []
    SqlRunner.run(sql, values)
  end





end
