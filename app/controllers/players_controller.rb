class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all
  end

  def create
    @player = Player.find_by(name: player_params[:name])
    @team = Team.find(player_params[:team_id])
    player_team = PlayerTeam.new(player: @player, team: @team)
    if player_team.save
      render json: @player
    else
      render json: "#{player_team.errors.full_messages.join(", ")}"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :team_id)
  end
end
