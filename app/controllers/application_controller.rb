
class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			root_path
		when User
			products_path
		end
	end
	def after_sign_out_path_for(resource)
		case resource
		when Admin
			new_admin_session_path
		when User
			homes_top_path
		end
  	end
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_ruby, :lastname_ruby, :postal_code, :address, :phone_number, :email, :password])
	end
end




