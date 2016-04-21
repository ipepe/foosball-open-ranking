module Api::V2
  class MatchesController < ResourceController
    self.resource_class = Match

    def index
      super do
        @matches = @matches.order(:created_at)
        player_rating_changes = PlayerRatingChange.where(match: @matches)
        self.render_hash['player_rating_changes'] = player_rating_changes
        self.render_hash['players'] = Player.where(id: player_rating_changes.pluck(:player_id))
      end

    end
    private

    def match_params
      params[:match].permit(:red_team_score,
                            :blue_team_score,
                            :date,
                            :red_team_player_one_id,
                            :red_team_player_two_id,
                            :blue_team_player_one_id,
                            :blue_team_player_two_id,
                            :confirmed_by_id
      )
    end
  end
end

