class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render_page(@teams)
  end

  def show
    @team = Team.find(params[:id])
    render_page(@team)
  end

  def next_team
    @id = params[:id]
    teams = Team.all.pluck(:id)
    original_id = teams.index(@id.to_i)
    next_id = (original_id + 1) % teams.length
    @next_id = teams[next_id]

    render json: @next_id.to_json
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
