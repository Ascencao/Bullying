class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	if current_user.id != 1
  		redirect_to new_profile_path
  	else
  		redirect_to profiles_path
  	end
  end
end
