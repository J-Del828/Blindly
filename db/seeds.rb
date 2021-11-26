# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Relationship.destroy_all
Match.destroy_all
User.destroy_all

john = User.new(email: "john@blindly.se", password: "test123", name: "John", age: 25, gender: "Male", preferred_gender: "Female", preferred_age: 25, interests: User::INTERESTS.sample(rand(4..8)))
john.save!
lea = User.new(email: "lea@blindly.se", password: "test123", name: "Lea", age: 25, gender: "Female", preferred_gender: "Male", preferred_age: 25, interests: john.interests)
lea.save!

female_names = ["Gabriella", "Alva", "Terese", "Gudrun", "Anna", "Monika", "Susanna", "Lea", "Siri", "Laila", "Tilda",
                  "Judit"]
biography =   ["Subtly charming music aficionado. Lifelong alcohol fan. Avid entrepreneur. Devoted LotR nerd.
               Foodaholic.",
               "Twitter trailblazer. Maple syrup & bacon practitioner. Troublemaker. Coffee guru. Extreme zombie fanatic.",
               "Introvert. Irish beer aficionado. Subtly charming organizer. Enthusiastic and humble explorer.
               Freelance writer.",
               "Twitter scholar. Award-winning drinker. Friendly creator. Pancake lover. Zombieaholic. Whiskey expert.",
               "Wannabe pop culture ninja. Certified social media expert. Ultimate introvert. Web geek.",
               "Lover of all things tech. I love to travel and try different wine from cultures I've never explored!
               What's your favorite wine?",
               "Ranked in top 10 on Pokémon Go in Sweden, wanna compare collections? Looking for a handyman to help me
               renovate my newly bought house!",
               "Currently studying to become a nurse which is really intense, so I'm looking for a man who can work
               around the house while I'm studying.",
               "Self-proclaimed cat-mommy. I have cats of 8 differents races, if you love cats as much as I do perhaps
               I will introduce you to them",
               "Currently enrolled in a coding bootcamp so if you are a developer that's a huge plus. Otherwise you can
               cook for me while I'm practicing my coding.",
               "I live alone with 2 dogs, do you wanna be their dad?",
               "I've traveled to over 120 countries, guess one that I didn't visit!"]

 150.times do
  User.create(email: "#{rand(252...4350)}test@test.se", password: "test123", name: female_names.sample, interests: User::INTERESTS.sample(rand(2..12)), age: rand(20..30), gender: "Female",
  biography: biography.sample, preferred_age: rand(20..30), preferred_gender: "Male")
 end
