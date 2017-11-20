require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/cars_controller.rb'

run CarsController
