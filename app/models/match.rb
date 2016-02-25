class Match < ActiveRecord::Base

  default_scope { order('date') }

  belongs_to :red_team_player_one,  class_name: 'Player'
  belongs_to :red_team_player_two,  class_name: 'Player'
  belongs_to :blue_team_player_one, class_name: 'Player'
  belongs_to :blue_team_player_two, class_name: 'Player'

  belongs_to :created_by,   class_name: 'User'
  belongs_to :confirmed_by, class_name: 'User'

  validates :date, :created_by_id, presence: true
  validates :confirmed_at, presence: true, if: 'confirmed_by_id.present?'

  before_validation do
    if confirmed_by_id_changed?
      self.confirmed_at = DateTime.now
    end
  end

  validate do
    errors.add :confirmed_by if self.confirmed_by.present? && !self.can_be_confirmed?(self.confirmed_by)
  end

  validate do
    if red_team_score > blue_team_score
      errors.add :red_team_score if (red_team_score - blue_team_score) < 3
    else
      errors.add :blue_team_score if (blue_team_score - red_team_score) < 3
    end
  end

  validate do
    if self.can_be_ranked? && red_team_score.to_i == blue_team_score.to_i
      errors.add :red_team_score, "Score can't be even"
      errors.add :blue_team_score, "Score can't be even"
    end
  end

  validate do
    if self.confirmed_by_id.present? && !confirmed_by_id_changed?
      errors.add :base, "Match can't be changed when confirmed by at least one player"
    end
  end

  validate do
    if self.can_be_ranked? && (arr = players.flatten.map(&:id).uniq).size < 4
      errors.add :players, "Match should have some players instead it has #{arr.size}"
    end
  end

  validate do
    unless players.present?
      errors.add :players, "Match should have at least some players instead it has #{players.size}"
    end
  end

  validates :blue_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true
  validates :red_team_score, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}, presence: true

  after_commit :rerank_players

  def players
    [red_team_players, blue_team_players].flatten
  end

  def red_team_players
    [red_team_player_one, red_team_player_two]
  end

  def blue_team_players
    [blue_team_player_one, blue_team_player_two]
  end

  def can_be_ranked?
    is_confirmed?
  end

  def is_confirmed?
    self.confirmed_by_id.present? && self.created_by_id.present?
  end

  def created_by_team
    if (self.created_by.players.to_a & self.blue_team_players).size > 0
      :blue
    elsif (self.created_by.players.to_a & self.red_team_players).size > 0
      :red
    else
      :none
    end
  end

  def can_confirm_players
    if created_by_team == :red
      self.blue_team_players
    elsif created_by_team == :blue
      self.red_team_players
    else
      self.players
    end
  end

  def can_be_confirmed?(user)
    return false if self.can_be_ranked?
    user.present? && user.players.where(id: can_confirm_players.map(&:id)).exists?
  end

  def winners
    if red_team_score > blue_team_score
      red_team_players
    else
      blue_team_players
    end
  end

  def red_team_players_nicknames
    red_team_players.map &:nickname
  end

  def blue_team_players_nicknames
    blue_team_players.map &:nickname
  end

  private

  def rerank_players
    if self.can_be_ranked?
      self.reload
      # puts "Im reranking players: #{players.map(&:id)}"
      #nie można zmieniać rating_pointsu podczas pracy algorytmu rankujacego wiec zapisujemy nowe rating_pointsi a potem przypisujemy je playerom
      new_rating_points = self.players.flatten.map{|p| {id: p.id, rating_points: p.rank(self)} }
      new_rating_points.each do |hash|
        player = Player.find(hash[:id].to_i)
        player.rating_points = hash[:rating_points]
        player.save!
      end
    end
    true
  end

end

