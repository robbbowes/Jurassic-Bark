require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require_relative("../models/adoption.rb")
require('pry-byebug')

  # Owner.delete_all

  owner1 = Owner.new({ 'first_name' => "Simon", 'surname' => "Anger",
    'town' => 'Embra', 'bairns' => false })
  owner1.save

  pet1 = Pet.new({ 'name' => 'Douglas McKenzie', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-05-25', 'bairn_friendly' => true,})
  pet1.save
  pet2 = Pet.new({ 'name' => 'Gertrude', 'adoptable' => false, 'breed' => 'cat',
    'admission_date' => '2017-05-22', 'bairn_friendly' => true })
  pet2.save

  adoption1 = Adoption.new( { 'owner_id' => owner1.id, 'pet_id' => pet1.id })
  adoption1.save


  pry.binding
  nil


 # 'owner_id' => owner1.id
