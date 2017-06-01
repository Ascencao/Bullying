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
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Bullying Creado Exitosamente' # Direccionar a salida de session
    else
      render :new
    end
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Información Actualizada.' # Direccionar a salida de session
      render @profile 
    else
      render :edit, notice: 'No se pudo Actualizar el Bullying'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :last_name, :user_id, 
                                    comment_attributes: [:comment, :profile_id])
  end

end
