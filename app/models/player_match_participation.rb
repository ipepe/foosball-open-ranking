class PlayerMatchParticipation < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  enum team_color: [:red, :blue]

end