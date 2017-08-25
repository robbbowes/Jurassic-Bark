require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/owner.rb')
require_relative('./models/pet.rb')

also_reload(".models/*")

# INDEX ROUTE
get '/jurassic-bark' do
  erb(:index)
end

# READ ROUTE
get '/jurassic-bark/all' do
  @pets = Pet.all
  erb(:all)
end

get '/jurassic-bark/:id' do
  @pet = Pet.find_by_id(params[:id])
  erb(:show)
end

# CREATE ROUTE
get '/jurassic-bark/new' do
  @pets = Pet.all
  erb(:new)
end

post '/jurassic-bark/all' do
  Pet.new(params).save
  redirect '/jurassic-bark/all'
end

get 'jurassic-bark/:id/edit' do
  @pet = Pet.find_by_id(params['id'])
  erb(:edit)
end

post 'jurassic-bark/:id' do
  pet = Pet.new(params)
  pet.update()
  redirect to "/jurassic-bark/#{params['id']}"
end

post '/jurassic-bark/:id/delete' do
  pet = Pet.find_by_id(params['id'])
  pet.delete
  redirect to '/jurassic-bark/all'
end
