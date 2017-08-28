require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')

also_reload("..models/*")

get '/pets' do
  @pets = Pet.all
  erb(:"pets/all")
end

get '/pets/new' do
  @pets = Pet.all
  erb(:"pets/new")
end

get '/pets/birds' do
  @pets = Pet.all
  erb(:"pets/animal_types/birds")
end

get '/pets/cats' do
  @pets = Pet.all
  erb(:"pets/animal_types/cats")
end

get '/pets/dogs' do
  @pets = Pet.all
  erb(:"pets/animal_types/dogs")
end

get '/pets/exotic_animals' do
  @pets = Pet.all
  erb(:"pets/animal_types/exotic_animals")
end

get '/pets/horses' do
  @pets = Pet.all
  erb(:"pets/animal_types/horses")
end

get '/pets/small_animals' do
  @pets = Pet.all
  erb(:"pets/animal_types/small_animals")
end

get '/pets/:id/edit' do
  @pet = Pet.find_by_id(params['id'])
  erb(:"pets/edit")
end

get '/pets/:id' do
  @pet = Pet.find_by_id(params[:id])
  erb(:"pets/show")
end

post '/pets' do
  Pet.new(params).save
  redirect '/pets'
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update()
  redirect to "/pets/#{params['id']}"
end

post '/pets/:id/delete' do
  pet = Pet.find_by_id(params['id'])
  pet.delete
  redirect to '/pets'
end
