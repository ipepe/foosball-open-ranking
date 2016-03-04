class Api::PlayersController < Api::OpenController
  def index
    @players = Player.all
    render 'api/players/index.json.jbuilder'
  end
end