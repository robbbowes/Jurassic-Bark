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

post '/owners' do
  Owner.new(params).save
  redirect '/owners'
end

get '/owners/:id' do
  @owner = Owner.find_by_id(params[:id])
  erb(:"owners/show")
end

get 'owners/:id/edit' do
  @owner = Owner.find_by_id(params['id'])
  erb(:"owners/edit")
end

post 'owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect to "/owner/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Ower.find_by_id(params['id'])
  owner.delete
  redirect to '/owers/all'
end
