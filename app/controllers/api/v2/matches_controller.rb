module Api::V2
  class MatchesController < ResourceController
    self.resource_class = Match

    def index
      super do
        @matches = @matches
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

