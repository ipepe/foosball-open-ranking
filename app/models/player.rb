class Player < ActiveRecord::Base

  MAXIMUM_POINTS_DIFFRENCE = 0.06

  has_many :player_rating_changes

  scope :ordered_by_nicks, -> { order(:nickname) }
  scope :ordered_by_ranking, -> { order(rating_points: :desc) }

  belongs_to :user

  scope :top10, -> { Player.all }

  belongs_to :created_by, class_name: 'User'

  after_create do
    unless created_by.players.exists?
      created_by.players << self
      created_by.save!
    end
  end

  def self.select_collection
    all.map{|p| [p.nickname, p.id] }
  end

  def matches
    Match.where('red_team_player_one_id = :myid OR red_team_player_two_id = :myid OR blue_team_player_one_id = :myid OR blue_team_player_two_id = :myid', myid: self.id)
  end

  def days_old
    (Date.today - self.created_at.to_date).to_i
  end

  def can_attach?
    self.user_id.blank?
  end

  def can_dettach?(user)
    self.user_id == user.id
  end

  # slug
  # def to_param
  #   [id, nickname.parameterize].join("-")
  # end

  # http://www.tropiceuro.com/rankings.php
  def rank(match)
    matches_limit = 10 #after this count of matches, we can assume accurate rating_points of player
    matches_count_limited = if self.matches.count < matches_limit then self.matches.count else matches_limit end
    matches_count_limited_total = match.players.map do |p|
      p.matches.count
    end
    matches_count_limited_total = matches_count_limited_total.map{|match_count| if match_count < matches_limit then match_count else matches_limit end}.inject(&:+)
    match_average_rating_points = match.players.map{|p| p.rating_points*(if p.matches.count < matches_limit then p.matches.count else matches_limit end)}.inject{|sum,x| sum + x }/matches_count_limited_total
    rating_points_old = self.rating_points
    rating_points_old + MAXIMUM_POINTS_DIFFRENCE *
        (match_average_rating_points - rating_points_old + match.success_value(self) *
            (1 - matches_count_limited / matches_count_limited_total )
        )
  end


end
