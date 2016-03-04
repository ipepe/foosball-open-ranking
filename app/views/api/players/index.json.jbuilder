json.array!(@players) do |player|
  json.extract! player, :id, :nickname, :rating_points
  json.email player.user.try(:email)
end
