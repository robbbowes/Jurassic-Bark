require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require_relative("../models/adoption.rb")
require('pry-byebug')

  Adoption.delete_all
  Owner.delete_all
  Pet.delete_all

  owner1 = Owner.new({ 'first_name' => "Simon", 'surname' => "Anger",
    'town' => 'Embra', 'bairns' => true })
  owner1.save

  pet1 = Pet.new({ 'name' => 'Douglas McKenzie', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-07-15', 'bairn_friendly' => true })
  pet1.save

  pet2 = Pet.new({ 'name' => 'Gertrude', 'adoptable' => false, 'breed' => 'cat',
    'admission_date' => '2017-06-22', 'bairn_friendly' => true })
  pet2.save

  pet3 = Pet.new({ 'name' => 'Prudence', 'adoptable' => true, 'breed' => 'cat',
    'admission_date' => '2017-07-25', 'bairn_friendly' => true })
  pet3.save

  pet4 = Pet.new({ 'name' => 'Dean Anderson', 'adoptable' => true, 'breed' => 'true',
    'admission_date' => '2017-08-22', 'bairn_friendly' => true })
  pet4.save

  pet5 = Pet.new({ 'name' => 'Birdy McBirdface', 'adoptable' => true, 'breed' => 'bird',
    'admission_date' => '2017-08-12', 'bairn_friendly' => true })
  pet5.save

  pet6 = Pet.new({ 'name' => 'Keith Lemondrops', 'adoptable' => false, 'breed' => 'exotic animal',
    'admission_date' => '2017-05-22', 'bairn_friendly' => true })
  pet6.save

  pet7 = Pet.new({ 'name' => 'Jimmy Jim Jim', 'adoptable' => true, 'breed' => 'small animal',
    'admission_date' => '2017-05-25', 'bairn_friendly' => true })
  pet7.save

  pet8 = Pet.new({ 'name' => 'Hest Hesten', 'adoptable' => true, 'breed' => 'horse',
    'admission_date' => '2017-05-22', 'bairn_friendly' => true })
  pet8.save

  pet9 = Pet.new({ 'name' => 'Longface Jones', 'adoptable' => true, 'breed' => 'horse',
    'admission_date' => '2017-08-22', 'bairn_friendly' => true })
  pet9.save

  pet10 = Pet.new({ 'name' => 'Terry', 'adoptable' => true, 'breed' => 'exotic animal',
    'admission_date' => '2017-05-25', 'bairn_friendly' => true })
  pet10.save

  pet11 = Pet.new({ 'name' => 'Marek', 'adoptable' => false, 'breed' => 'cat',
    'admission_date' => '2017-05-22', 'bairn_friendly' => true })
  pet11.save

  pet12 = Pet.new({ 'name' => 'Andrew McDonald', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-05-25', 'bairn_friendly' => true })
  pet12.save

  pet13 = Pet.new({ 'name' => 'Hank Marvin', 'adoptable' => false, 'breed' => 'small animal',
    'admission_date' => '2017-05-22', 'bairn_friendly' => true })
  pet13.save

  adoption1 = Adoption.new( { 'owner_id' => owner1.id, 'pet_id' => pet1.id })
  adoption1.save

  #
  # pry.binding
  # nil
