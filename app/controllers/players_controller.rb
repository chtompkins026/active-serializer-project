class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all
    # @team = Team.find(params[:team_id])
    # @league_id = League.find(params[:league_id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      respond_to do |f|
        f.json{
          render json: @player
        }
      end
    else
      flash[:error] = "#{@player.errors.full_messages.join(", ")}"
    end
  end

private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points, :team_id)
  end


end
