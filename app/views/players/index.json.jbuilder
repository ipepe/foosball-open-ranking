json.players @players do |player|
  json.extract! player, :id, :nickname, :rating_points
  json.is_current_player(player.user_id == current_user.id)
end
