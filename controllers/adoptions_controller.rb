require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/adoption.rb')

also_reload("..models/*")

# GET			/pizzas				      index      done
# GET			/pizzas/:id			    show       done
# GET			/pizzas/new			    new        done
# POST		/pizzas				      create     done
# GET			/pizzas/:id/edit		edit       done
# POST		/pizzas/:id			    update     done
# POST		/pizzas/:id/delete	destroy

get '/adoptions' do
  @adoptions = Adoption.all
  erb(:"adoptions/all")
end


get '/adoptions/new' do
  @adoptions = Adoption.all
  erb(:"adoptions/new")
end

post '/adoptions' do
  Adoption.new(params).save
  redirect to '/adoptions'
end

get '/adoptions/:id/edit' do
  @adoption = Adoption.find_by_id(params[:id])
  erb(:edit)
end

get '/adoptions/:id' do
  @adoption = Adoption.find_by_id(params[:id])
  erb(:"adoptions/show")
end

post '/adoptions/:id' do
  adoption = Adoption.new(params)
  adoption.update
  redirect to "/adoptions/#{params['id']}"
end

post '/adoptions/:id/delete' do
  adoption = Adoption.find_by_id(params[:id])
  adoption.delete
  redirect to '/adoptions/all'
end
