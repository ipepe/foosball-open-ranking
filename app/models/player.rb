class Player < ActiveRecord::Base

  has_many :player_match_participations
  has_many :matches, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_matches, through: :blue_player_match_participations, class_name: 'Match', source: 'match'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Match', source: 'match'

  scope :top10, -> { Player.all }

end
