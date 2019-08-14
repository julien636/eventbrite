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


User.reset_pk_sequence
Event.reset_pk_sequence
Attendance.reset_pk_sequence
  # Creation de 20 utilisateurs
  10.times do 
    user = User.create!(email: Faker::Internet.free_email, description: Faker::Movies::HarryPotter.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: Faker::Internet.password)
  end

  #Création de 10 event
  10.times do 
    event = Event.create!(start_date: Faker::Date.forward, duration: 50, title: Faker::Book.title, description: Faker::Hacker.say_something_smart , price: Faker::Number.between(from: 1, to: 1000), location: Faker::TvShows::GameOfThrones.city, administrator_id: rand(User.all.first.id..User.all.last.id))
  end
  
  #Création de 100 participations
  100.times do 
    attendance = Attendance.create!(stripe_customer_id: Faker::Number.number(digits: 10), event_id: rand(Event.all.first.id..Event.all.last.id), user_id: rand(User.all.first.id..User.all.last.id))
  end