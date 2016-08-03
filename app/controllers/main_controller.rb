class MainController < ApplicationController

  def index
    @matches = Match.order(date: :asc).paginate(per_page: 5, page: 1)
    @players = Player.only_active.order(rating_points: :desc).paginate(per_page: 5, page: 1)
    @table_without_actions = true
  end
end
