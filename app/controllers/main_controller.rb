class MainController < ApplicationController

  def index
    @matches = Match.order(date: :asc).paginate(per_page: 5, page: 1)
    @players = Player.order(rating_points: :desc).where.not(rating_points:1500).paginate(per_page: 5, page: 1)
    @table_without_actions = true
  end
end
