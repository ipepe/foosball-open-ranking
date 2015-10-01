class Match < ActiveRecord::Base

  default_scope { order('date') }

  #validacja że score jedno nie może być równe drugiemu
  #validacja że score musi być większe o 2 jeżeli uznać win?
  #validacja że score nie mogą być obydwa 0

  validates :date, presence: true
  validates :red_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :blue_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true

  has_many :player_match_participations
  has_many :players, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_players, through: :blue_player_match_participations, class_name: 'Player', source: 'player'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Player', source: 'player'

  # slug
  # def to_param
  #   [id, red_team_players_nicks.map(&:parameterize).join("-"), blue_team_players_nicks.map(&:parameterize).join("-") ].join("-")
  # end

  def red_team_players_nicks
    red_team_players.map &:nickname
  end

  def blue_team_players_nicks
    blue_team_players.map &:nickname
  end
end

