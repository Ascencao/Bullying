class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
      @profiles = Profile.all
  end

  def show
    @profile = Profile.find_by(id: params[:id])
  end

  def new
    @profile = Profile.new
    @profile.build_comment
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'profile was successfully created.' }
        format.json { render @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
        format.json { render @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_path, notice: 'profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_person
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :last_name, :user_id, 
                                    comment_attributes: [:comment, :profile_id])
  end



	# def index
 #    @profiles = Profile.all
 #    respond_to do |format|
 #      format.html 
 #      format.json { render json: (@profiles)}
 #    end
 #  end

 #  def show
 #    @profile = Profile.find_by(id: params[:id])
 #    response_format @profile
 #  end

 #  def new 
 #    @profile = Profile.new
 #  end

 #  def create
 #    @profile = Profile.new(profile_params)
 #    if @profile.save
 #      respond_to do |format|
 #        format.html { redirect_to profiles_path, notice: 'profile was successfully registered.' }
 #        format.json { head :no_content }
 #      end
 #      else
 #      render :new
 #    end
 #  end

 #  def edit
 #    @profile = Profile.find_by(id: params[:id])
 #  end

 #  def update
 #    @profile = Profile.find_by(id: params[:id])
 #    if @profile.update(profile_params)
 #      respond_to do |format|
 #        format.html { redirect_to profiles_path, notice: 'profile was successfully updated.' }
 #        format.json { head :no_content }
 #      end
 #    end
 #  end

 #  def destroy 
 #    @profile = Profile.find_by(id: params[:id])
 #    @profile.destroy
 #    respond_to do |format|
 #      format.html { redirect_to profiles_path, notice: 'profile was successfully destroyed.' }
 #      format.json { head :no_content }
 #    end
 #  end


 #  private

 #  def profile_params
 #    params.require(:profile).permit(:name, :last_name, :user_id, 
 #                                    comment_attributes: [:comment, :profile_id])
 #  end
end
