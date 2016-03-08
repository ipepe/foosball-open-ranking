class PlayerRatingChange < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  validates_presence_of :rating_points_difference

  def formatted_rating_points_difference
    if self.rating_points_difference > 0
      " (+#{self.rating_points_difference})"
    else
      " (#{self.rating_points_difference.to_s})"
    end
  end
end