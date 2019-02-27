class TeamsController < ApplicationController

  def new
   @team = Team.new
  end

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
    @team.save
    redirect_to team_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    flash[:success] = "Successfully deleted team!"
    redirect_to user_path(team.user_id)
  end

  private

  def team_params
    params.require(:team).permit(:id, :name, :total_points, :user_id)
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
