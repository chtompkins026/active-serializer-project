class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render_page(@teams)
  end

  def show
    @team = Team.find(params[:id])
    render_page(@team)
  end

  def create
    @team = Team.create(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      flash[:error] = "#{@team.errors.full_messages.join(", ")}"
      redirect_to team_path(@team)
    end
  end


  private

  def team_params
    params.require(:team).permit(:id, :name, :total_points)
  end

  def render_page(teams)
    respond_to do |f|
      f.html
      f.json{
        render json: teams
      }
    end
  end

end #end of class
