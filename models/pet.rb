require_relative("../db/sql_runner")
require_relative("./owner")

class Pet

  def initialize( details )
    @id = details["id"].to_i
    @name = details["name"]
    @adoptable = details["adoptable"]
    @breed = details["breed"]
    @admission_date = details["admission_date"]
    @child_friendly = details["child_friendly"]
    @owner_id  details["owner_id"].to_i
  end

end
