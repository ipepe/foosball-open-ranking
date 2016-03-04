json.array!(@matches) do |match|
  json.extract! match, :id, :red_team_score, :blue_team_score, :date, :already_ranked
  json.player_ids match.players.map(&:id)
end
