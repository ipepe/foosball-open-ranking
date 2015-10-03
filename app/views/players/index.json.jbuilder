json.array!(@players) do |player|
  json.extract! player, :id, :nickname, :rating_points
  json.url player_url(player, format: :json)
end
