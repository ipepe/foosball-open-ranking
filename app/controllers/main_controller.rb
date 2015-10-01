class MainController < ApplicationController

  def index
    @matches = Match.order(date: :asc).paginate(per_page: 5, page: 1)
    @players = Player.paginate(per_page: 5, page: 1)
  end
end
