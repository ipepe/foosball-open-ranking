class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.ordered_by_ranking
    if params['with_inactive'] != 'true'
      @players = @players.only_active
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    gon.player = {id: @player.id}
    rating_changes = @player.player_rating_changes.sort {|a,b| a.match.confirmed_at <=> b.match.confirmed_at}
    gon.player[:dates] = rating_changes.map{ |rc| rc.match.confirmed_at }
    gon.player[:dates].unshift(@player.created_at)
    gon.player[:dates].map! { |d|  d.strftime('%Y-%m-%d %H:%M') }
    score = 1500
    gon.player[:scores] = rating_changes.map(&:rating_points_difference).map do |rpd|
      score += rpd
    end
    gon.player[:scores].unshift(1500)

    gon.player[:plot_data] = []

    gon.player[:dates].each_with_index do |d, i|
      gon.player[:plot_data].push({date: d, score: gon.player[:scores][i]})
    end
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params.merge(created_by: current_user))

    respond_to do |format|
      if @player.save
        format.html { redirect_to players_path, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:nickname, :user_id)
    end
end
