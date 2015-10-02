class MainController < ApplicationController

  def index
    @matches = Match.order(date: :asc).paginate(per_page: 5, page: 1)
    @players = Player.order(rating: :desc).where.not(rating:1500).paginate(per_page: 5, page: 1)
  end
end
