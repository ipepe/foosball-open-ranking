# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

red1 = Player.create!(nick: Faker::Name.first_name)
red2 = Player.create!(nick: Faker::Name.first_name)

blue1 = Player.create!(nick: Faker::Name.first_name)
blue2 = Player.create!(nick: Faker::Name.first_name)

m1 = Match.create!(reds: [red1, red2], blues: [blue1, blue2], red_score: 2, blue_score: 3)




