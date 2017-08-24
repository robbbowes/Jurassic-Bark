require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require('pry-byebug')

  # Owner.delete_all

  owner1 = Owner.new({ 'first_name' => "Simon", 'surname' => "Anger",
    'town' => 'Embra', 'bairns' => false })
  owner1.save




  pet1 = Pet.new({ 'name' => 'Douglas McKenzie', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-05-25', 'bairn_friendly' => true, 'owner_id' => owner1.id })
  pet1.save


  pry.binding
  nil
