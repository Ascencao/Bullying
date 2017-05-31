class ProfilesController < ApplicationController
  before_action :authenticate_user!
	def index
    @profiles = Profile.all
    respond_to do |format|
      format.html 
      format.json { render json: (@profiles)}
    end
  end

  def show
    @profile = Profile.find_by(id: params[:id])
    response_format @profile
  end

  def new 
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      respond_to do |format|
        format.html { redirect_to profiles_path, notice: 'person was successfully registered.' }
        format.json { head :no_content }
      end
    end
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    if @profile.update(profile_params)
      respond_to do |format|
        format.html { redirect_to profiles_path, notice: 'person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy 
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_path, notice: 'person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :last_name, :user_id)
  end
end
