# puts "Starting seed"
#
# puts "Creating 10 players"
#
# 10.times do Player.create!(nickname: Faker::Name.first_name) end
#
# puts "Creating 50 matches"
#
# (1..50).each do |i|
#   m1 = Match.create!(red_team_players: [Player.find(i%4+1), Player.find(i%4+2)], blue_team_players: [Player.find(i%4+3), Player.find(i%4+4)], red_team_score: i%3, blue_team_score: (i+1)%3, date: Date.today)
# end