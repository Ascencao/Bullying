class CommentsController < ApplicationController
	before_action :authenticate_user!

  def new
    @profile = Profile.find_by(id: params[:profile_id])
  end

  def create
    @profile = Profile.find_by(id: params[:profile_id])
    if @profile
      @comment = @profile.comment.build(comment_params)
      if @comment.save
        respond_to do |format|
        format.html { redirect_to comments_path, notice: 'person was successfully registered.' }
        format.json { head :no_content }
      else
        render :new
      end
    else
      redirect_to comments_path, notice: 'comment not found'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to comments_path, notice: 'person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :profile_id)
  end
end
