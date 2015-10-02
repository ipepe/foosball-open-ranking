# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Starting seed"

puts "Creating 10 players"

10.times do Player.create!(nickname: Faker::Name.first_name) end

puts "Creating 50 matches"

(1..50).each do |i|
  m1 = Match.create!(red_team_players: [Player.find(i%4+1), Player.find(i%4+2)], blue_team_players: [Player.find(i%4+3), Player.find(i%4+4)], red_team_score: i%3, blue_team_score: (i+1)%3, date: Date.today)
end

# Match.create!(red_team_players: [Player.find(4), Player.find(3)], blue_team_players: [Player.find(1), Player.find(2)], red_team_score: 3, blue_team_score: 0, date: Date.today)



