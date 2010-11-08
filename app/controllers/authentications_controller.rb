class AuthenticationsController < ApplicationController
  def index
	@authentications = current_user.authentications if current_user
  end
  
  def create
	omniauth=request.env["omniauth.auth"]
	current_user.authentications.find_or_create_by_provider_and_uid(omniauth["provider"], omniauth["uid"])
	flash[:notice] = "Account Linked"
	redirect_to userhome_path
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
