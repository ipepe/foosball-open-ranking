class Match < ActiveRecord::Base

  default_scope { order('date') }

  has_many :player_match_participations
  has_many :players, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_players, through: :blue_player_match_participations, class_name: 'Player', source: 'player'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Player', source: 'player'

  validates :date, presence: true

  validate do
    if red_team_score == blue_team_score
      errors.add :red_team_score, "Score can't be even"
      errors.add :blue_team_score, "Score can't be even"
    end
  end

  validate do
    unless players.present? || blue_team_players.present? || red_team_players.present?
      errors.add :players, "Match should have some players instead it has #{players.count}"
    end
  end

  validates :blue_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :red_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true

  after_commit :rerank_players

  def can_be_ranked?
    true#jakaś bardziej skomplikowana logika, np potwierdzenia graczy lub odpowiedni wynik
  end

  # slug
  # def to_param
  #   [id, red_team_players_nicks.map(&:parameterize).join("-"), blue_team_players_nicks.map(&:parameterize).join("-") ].join("-")
  # end

  def winners
    if red_team_score > blue_team_score
      red_team_players
    else
      blue_team_players
    end
  end

  def red_team_players_nicks
    red_team_players.map &:nickname
  end

  def blue_team_players_nicks
    blue_team_players.map &:nickname
  end

  private

  def rerank_players
    self.reload
    if !self.is_ranked && self.can_be_ranked?
      # puts "Im reranking players: #{players.map(&:id)}"
      #nie można zmieniać rating_pointsu podczas pracy algorytmu rankujacego wiec zapisujemy nowe rating_pointsi a potem przypisujemy je playerom
      new_rating_pointss = self.players.map{|p| {id: p.id, rating_points: p.rank(self)} }
      new_rating_pointss.each do |hash|
        player = Player.find(hash[:id].to_i)
        player.rating_points = hash[:rating_points]
        player.save!
      end
      self.is_ranked
    end
    true
  end

end

