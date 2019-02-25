class CommentsController < ApplicationController

  def show
    @comment = Team.find(params[:id]).comments
  end

  def index
    @comment = Comment.all
    # @team = Team.find(params[:team_id])
    # @league_id = League.find(params[:league_id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create
    @comment = Comment.create(player_params)
    if @comment.save
      respond_to do |f|
        f.json{
          render json: @comment
        }
      end
    else
      render json: "#{@comment.errors.full_messages.join(", ")}"
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :team_id)
  end


end
