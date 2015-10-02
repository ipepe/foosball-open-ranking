class Player < ActiveRecord::Base

  has_many :player_match_participations
  has_many :matches, through: :player_match_participations

  has_many :blue_player_match_participations, -> { blue }, class_name: 'PlayerMatchParticipation'
  has_many :red_player_match_participations, -> { red }, class_name: 'PlayerMatchParticipation'

  has_many :blue_team_matches, through: :blue_player_match_participations, class_name: 'Match', source: 'match'
  has_many :red_team_players, through: :red_player_match_participations, class_name: 'Match', source: 'match'

  scope :top10, -> { Player.all }

  # slug
  # def to_param
  #   [id, nickname.parameterize].join("-")
  # end

  # http://www.tropiceuro.com/rankings.php
  def rank(match)
    matches_limit = 25 #after this count of matches, we can assume accurate rating of player
    matches_count_limited = if self.matches.count < matches_limit then self.matches.count else matches_limit end
    matches_count_limited_total = match.players.map{|p| p.matches.count}.map{|match_count| if match_count < matches_limit then match_count else matches_limit end}.inject(&:+)
    match_average_rating = match.players.map{|p| p.rating*(if p.matches.count < matches_limit then p.matches.count else matches_limit end)}.inject{|sum,x| sum + x }/matches_count_limited_total
    rating_old = self.rating
    k1 = 0.12 #Affects the maximum amount of RP that can be gained/lost in a single game.
    succes_rate = 500
    success_value = if match.winners.include?(self) then succes_rate else 0-succes_rate end # tu można wcisnąć przewagę puntkową jako większy lub mniejszy sukces
    rating_new = rating_old + k1 * (match_average_rating - rating_old + success_value * (1 - matches_count_limited / matches_count_limited_total ))
    puts "Calculated new rating for #{self.nickname} is #{rating_new}"
    rating_new
  end


end
