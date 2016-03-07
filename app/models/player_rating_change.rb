class PlayerRatingChange < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  validates_presence_of :rating_points_difference
end