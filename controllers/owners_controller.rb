require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/adoption.rb')

also_reload("..models/*")

get '/owners' do
  @owners = Owner.all
  erb(:"owners/all")
end

get '/owners/new' do
  @owners = Owner.all
  erb(:"owners/new")
end

get '/owners/:id/edit' do
  @owner = Owner.find_by_id(params[:id])
  erb(:"owners/edit")
end

get '/owners/:id' do
  @owner = Owner.find_by_id(params[:id])
  erb(:"owners/show")
end

post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect to "/owners/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Owner.find_by_id(params['id'])
  owner.delete
  redirect to '/owners'
end
