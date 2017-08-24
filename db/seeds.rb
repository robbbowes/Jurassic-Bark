require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require('pry-byebug')

  # Owner.delete_all

  owner1 = Owner.new({ 'first_name' => "Simon", 'surname' => "Anger",
    'address' => '1 Ham Street', 'town' => 'Embra', 'bairns' => false })
  owner1.save

  pry.binding
  nil
