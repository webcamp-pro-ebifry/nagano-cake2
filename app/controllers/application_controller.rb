
class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_homes_top_path
		when User
			root_path
		end
	end
	def after_sign_out_path_for(resource)
		root_path
  	end

    # protect_from_forgery with: :exception
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_ruby, :lastname_ruby, :postal_code, :address, :phone_number, :email, :password])
	end
end




