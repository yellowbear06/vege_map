# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

CSV.foreach('db/vege_restaurant.csv') do |row|
  Place.create(:name => row[1], :eng_name => row[0], :address => row[3], :eng_address => row[2], :phone => row[4], :category => row[7])
end