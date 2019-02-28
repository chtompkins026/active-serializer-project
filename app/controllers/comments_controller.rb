class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update]

  def index
    @comments = Comment.all
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @comment}
    end
  end

  def next_comment
    comments = Comment.all.pluck(:id)
    original_id = comments.index(params[:id].to_i)
    next_id = (original_id + 1) % comments.length
    @next_id = comments[next_id]

    render json: @next_id.to_json
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge!(user_id: current_user.id))
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { errors: @comment.errors.messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to comment_path(@comment)
  end

  def comment_data
    comment = Comment.find(params[:id])
    #render json: commentSerializer.serialize(comment)
    render json: comment.to_json(only: [:title, :description, :id],
                              include: [user: { only: [:name]}])
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:title, :description)
  end
end
