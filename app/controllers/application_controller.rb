class ApplicationController < ActionController::Base
  include Pundit
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters , if: :devise_controller?
  private
	def user_not_authorized
		flash[:notice] = "El usuario no esta autorizado para esta acción"
		redirect_to(request.referrer || root_path)
	end
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :nombre, :apellido, :telefono, :dependencia,  :cargo, :rol])
  end

end
