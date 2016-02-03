# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Restaurant.create([
  { name: "Brooklyn Standard", 
    address1: "188 Nassau Ave",
    city: "Brooklyn",
    state: "NY",
    zip: "11222"},

  { name: "Blue Dog Kitchen Bar", 
    address1: "101 West 25th St",
    city: "New York",
    state: "NY",
    zip: "10001"},

  { name: "Lyric Diner", 
    address1: "283 3rd Ave",
    city: "New York",
    state: "NY",
    zip: "10010"},

  { name: "Supper", 
    address1: "156 East 2nd St",
    city: "New York",
    state: "NY",
    zip: "10009"},

  { name: "Tartina", 
    address1: "653 Ninth Ave",
    city: "New York",
    state: "NY",
    zip: "10036"},
  ])
  
