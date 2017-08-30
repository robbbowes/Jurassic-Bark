require_relative("../models/owner.rb")
require_relative("../models/pet.rb")
require_relative("../models/adoption.rb")
require('pry-byebug')

  Adoption.delete_all
  Owner.delete_all
  Pet.delete_all

  owner1 = Owner.new({ 'first_name' => "Simon", 'surname' => "Anger", 'address1' => '1 Streety Road',
    'address2' => 'Leith', 'town' => 'Embra', 'owner_picture' => 'simon_anger.jpg'})
  owner1.save

  pet1 = Pet.new({ 'name' => 'Douglas McKenzie', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-07-15', 'picture' => '/douglas_mckenzie.jpg' })
  pet1.save

  pet2 = Pet.new({ 'name' => 'Gertrude', 'adoptable' => false, 'breed' => 'cat',
    'admission_date' => '2017-06-22', 'picture' => '/gertrude.png' })
  pet2.save

  pet3 = Pet.new({ 'name' => 'Prudence', 'adoptable' => true, 'breed' => 'cat',
    'admission_date' => '2017-07-25', 'picture' => '/prudence.jpg' })
  pet3.save

  pet4 = Pet.new({ 'name' => 'Dean Anderson', 'adoptable' => true, 'breed' => 'other',
    'admission_date' => '2017-08-22', 'picture' => '/dean_anderson.jpg' })
  pet4.save

  pet5 = Pet.new({ 'name' => 'Birdy McBirdface', 'adoptable' => true, 'breed' => 'bird',
    'admission_date' => '2017-08-12', 'picture' => '/birdy_mcbirdface.jpg' })
  pet5.save

  pet6 = Pet.new({ 'name' => 'Keith Lemondrops', 'adoptable' => false, 'breed' => 'other',
    'admission_date' => '2017-05-22', 'picture' => '/keith_lemondrops.jpg' })
  pet6.save

  pet7 = Pet.new({ 'name' => 'Jimmy the Brawler', 'adoptable' => true, 'breed' => 'rodent',
    'admission_date' => '2017-05-25', 'picture' => '/jimmy_the_brawler.jpg' })
  pet7.save

  pet8 = Pet.new({ 'name' => 'Hest Hesten', 'adoptable' => true, 'breed' => 'horse',
    'admission_date' => '2017-05-22', 'picture' => '/hest_hesten.png' })
  pet8.save

  pet9 = Pet.new({ 'name' => 'Longface Jones', 'adoptable' => true, 'breed' => 'horse',
    'admission_date' => '2017-08-22', 'picture' => '/longface_jones.jpg' })
  pet9.save

  pet10 = Pet.new({ 'name' => 'Terry', 'adoptable' => true, 'breed' => 'bird',
    'admission_date' => '2017-05-25', 'picture' => '/terry.jpg' })
  pet10.save

  pet11 = Pet.new({ 'name' => 'Marek', 'adoptable' => false, 'breed' => 'cat',
    'admission_date' => '2017-05-22', 'picture' => '/marek.jpg' })
  pet11.save

  pet12 = Pet.new({ 'name' => 'Andrew McDonald', 'adoptable' => true, 'breed' => 'dog',
    'admission_date' => '2017-05-25', 'picture' => '/andrew_mcdonald.jpg' })
  pet12.save

  pet13 = Pet.new({ 'name' => 'Hank Marvin', 'adoptable' => false, 'breed' => 'rodent',
    'admission_date' => '2017-05-22', 'picture' => '/hank_marvin.jpg' })
  pet13.save

  adoption1 = Adoption.new( { 'owner_id' => owner1.id, 'pet_id' => pet1.id })
  adoption1.save


  # pry.binding
  # nil
