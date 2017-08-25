require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/owner.rb')
require_relative('./models/pet.rb')

also_reload(".models/*")

get '/' do
  erb(:index)
end

# # INDEX ROUTE
# get '/pets' do
#
# end

# READ ROUTE
get '/pets' do
  @pets = Pet.all
  erb(:all)
end

get '/pets/new' do
  @pets = Pet.all
  erb(:new)
end

get '/pets/:id' do
  @pet = Pet.find_by_id(params[:id])
  erb(:show)
end

# CREATE ROUTE

post '/pets' do
  Pet.new(params).save
  redirect '/pets'
end

get 'pets/:id/edit' do
  @pet = Pet.find_by_id(params['id'])
  erb(:edit)
end

post 'pets/:id' do
  pet = Pet.new(params)
  pet.update()
  redirect to "/pets/#{params['id']}"
end

post '/pets/:id/delete' do
  pet = Pet.find_by_id(params['id'])
  pet.delete
  redirect to '/pets/all'
end
