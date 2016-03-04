class Api::MatchesController < Api::OpenController
  def index
    @matches = Match.order(date: :asc).paginate(per_page: 10, page: 1)
    render 'api/matches/index.json.jbuilder'
  end
end