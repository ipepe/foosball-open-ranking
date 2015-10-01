class Match < ActiveRecord::Base

  default_scope { order('date') }

  validates :date, presence: true
  validates :red_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :blue_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true

  has_many :player_match_participations
  has_many :players, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_players, through: :blue_player_match_participations, class_name: 'Player', source: 'player'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Player', source: 'player'


  # def red_players=(values)
  #   values.each do |v|
  #     self.player_match_participations.build(match: self, player: v, team_color: :red)
  #   end
  # end

end

