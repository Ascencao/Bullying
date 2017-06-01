class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update]
	before_action :authenticate_user!

  def index
    @profile = Profile.find_by(id: params[:profile_id])
    if @profile
      @comments = @profile.comment
      render json: @comments
    else
      redirect_to new_profile_path
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to comments_path, notice: 'Bullying Actualizado' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:profile_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :profile_id)
  end
end
