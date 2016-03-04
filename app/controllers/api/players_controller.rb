class Api::PlayersController < Api::OpenController
  def index
    @players = Player.all
    render 'api/players/index.json.jbuilder'
  end

  def show
    @player = Player.find(params['id'])
    @matches = @player.matches.order(date: :asc).paginate(per_page: 10, page: 1)
    render 'api/players/show.json.jbuilder'
  end
end