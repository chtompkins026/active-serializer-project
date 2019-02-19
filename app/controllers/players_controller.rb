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

private

  def player_params
    params.require(:player).permit(:name, :position, :nba_team, :points, :team_id)
  end


end
