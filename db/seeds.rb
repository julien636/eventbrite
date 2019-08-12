# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all
  # Creation de 20 utilisateurs
  20.times do
    User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, description:Faker::Lorem.sentence, encrypted_password:Faker::Name.last_name)
  end

  #Création de 10 event
  10.times do
    Event.create(start_date:Faker::Date.between(from: 2.days.ago, to: Date.today), duration:15, description:Faker::Lorem.paragraph, price:15, location:Faker::Address.city, title:Faker::Lorem.sentence, administrator:User.find(rand(1..9)))
  end
    
  #Création de 100 participations
  100.times do
    Attendance.create(event:Event.find(rand(1..9)),user:User.find(rand(1..9)),stripe_customer_id:rand(1..100))
  end