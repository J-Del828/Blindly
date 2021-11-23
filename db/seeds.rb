# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

 12.times do
  User.create(email: "#{rand(252...4350)}test@test.se", password: "test123", name: User::FEMALE_NAMES.sample, interests: User::INTERESTS.sample(rand(4..8)), age: rand(20..30), gender: "Female",
  biography: User::BIOGRAPHY.sample, preferred_age: rand(20..30), preferred_gender: "Male")
 end
