class PlayerMatchParticipation < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  enum team_color: [:red, :blue]

  scope :confirmed, -> { where(confirmed: true) }

  validates_inclusion_of :confirmed, in: [true, false]

end