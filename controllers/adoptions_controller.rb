require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/pet.rb')
require_relative('../models/adoption.rb')
