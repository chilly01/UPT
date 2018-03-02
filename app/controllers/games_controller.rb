class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :get_data

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.sort_by {|game| game.date_of_next_game }

  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  def clone
    @game = Game.find(params[:game_id]).dup
    @game.save!
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])

    end

    def get_data
      @venues = Venue.all
      @tours = Tour.all
      @start_times = Array.new
      ['8','9','10','11'].each { |i|
        @start_times << (i +':00AM')
        @start_times << (i +':30AM')
      }
      ['12','1','2','3','4','5','6','7','8','9','10'].each { |i|
        @start_times << (i +':00PM')
        @start_times << (i +':30PM')
      }
      @days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:id, :name, :notes, :tour_id, :venue_id, :start_time, :day)
    end
end
