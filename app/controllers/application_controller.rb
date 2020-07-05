class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_ruby, :lastname_ruby, :postal_code, :address, :phone_number, :email, :password])
	end

end
