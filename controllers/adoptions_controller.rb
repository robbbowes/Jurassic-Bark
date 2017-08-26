require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/adoption.rb')

also_reload("..models/*")

# GET			/pizzas				      index
# GET			/pizzas/:id			    show
# GET			/pizzas/new			    new
# POST		/pizzas				      create
# GET			/pizzas/:id/edit		edit
# POST		/pizzas/:id			    update
# POST		/pizzas/:id/delete	destroy

get '/adoptions' do
  @adoptions = Adoption.all
  erb(:"adoptions/all")
end
