class Match < ActiveRecord::Base

  default_scope { order('date') }

  #validacja że score jedno nie może być równe drugiemu
  #validacja że score musi być większe o 2 jeżeli uznać win?
  #validacja że score nie mogą być obydwa 0

  validates :date, presence: true

  validate do
    if players.count != 4
      errors.add :players, "Match should have 4 players instead it has #{players.count}"
    end
  end

  validates :red_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :blue_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true

  has_many :player_match_participations
  has_many :players, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_players, through: :blue_player_match_participations, class_name: 'Player', source: 'player'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Player', source: 'player'

  # after_commit :rerank_players

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
    if !self.is_ranked && self.can_be_ranked?
      puts "Im reranking players: #{players.map(&:id)}"
      #nie można zmieniać ratingu podczas pracy algorytmu rankujacego wiec zapisujemy nowe ratingi a potem przypisujemy je playerom
      new_ratings = self.players.map{|p| {id: p.id, rating: p.rank(self)} }
      new_ratings.each do |hash|
        player = Player.find(hash[:id].to_i)
        player.rating = hash[:rating]
        player.save!
      end
      self.is_ranked
    end
    true
  end
end

