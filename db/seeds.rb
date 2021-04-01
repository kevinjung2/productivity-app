# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = []
x = 1
10.times do
  user << "User#{x}"
  x += 1
end

user.each do |u|
  User.create(name: u, password: "password")
end

event = Event.create(name: "My Event")
event.host = User.first
event.users << User.last
event.save
