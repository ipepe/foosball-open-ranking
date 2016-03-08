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


u_dev = User.create!(email: 'developer@example.com', first_name: 'Dev', last_name: 'Eloper')

u1 = User.create!(email: 'user1@example.com', first_name: 'User', last_name: 'Pierwszy')
u2 = User.create!(email: 'user2@example.com', first_name: 'User', last_name: 'Drugi')


p1 = Player.create!(nickname: 'Player of user1', user: u1, created_by: u1)
p2 = Player.create!(nickname: 'Player of user2', user: u2, created_by: u2)
p3 = Player.create!(nickname: 'Player of nonexistant user3', created_by: u_dev)
p4 = Player.create!(nickname: 'Player of nonexistant user4', created_by: u_dev)


Match.create!(
    red_team_score: 3,
    blue_team_score: 2,
    red_team_player_one: p1,
    red_team_player_two: p3,
    blue_team_player_one: p2,
    blue_team_player_two: p4,
    created_by: u1,
    date: Date.today,
    confirmed_by: u2,
    confirmed_at: Time.now
)
Match.create!(
    red_team_score: 3,
    blue_team_score: 1,
    red_team_player_one: p1,
    red_team_player_two: p4,
    blue_team_player_one: p2,
    blue_team_player_two: p3,
    created_by: u2,
    date: Date.today
)
Match.create!(
    red_team_score: 3,
    blue_team_score: 0,
    red_team_player_one: p2,
    red_team_player_two: p4,
    blue_team_player_one: p1,
    blue_team_player_two: p3,
    created_by: u_dev,
    date: Date.today
)

Match.rerank_players