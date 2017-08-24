require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/owner.rb')
require_relative('./models/pet.rb')

# INDEX ROUTE
get '/jurassic-bark' do
  erb(:index)
end
