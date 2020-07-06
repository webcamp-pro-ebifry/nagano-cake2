class UsersController < ApplicationController
before_action :authenticate_user!
 def show
		@user = current_user
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to root_path
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			if user_signed_in?
				flash[:notice] = "登録情報が更新されました。"
				redirect_to user_path(current_user)
			else
				redirect_to request.referrer
			end
		else
			flash[:notice] = "項目を正しく記入してください"
			redirect_to request.referrer
		end
	end

	def withdrawl
		@user = User.find(params[:id])
		if @user.id = current_user.id
			redirect_to root_path
		end
	end

	def invalid
		@user = User.find(params[:id])
		@user.update(user_params)
		reset_session
		flash[:notice] = "ありがとうございました。"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postcode, :address, :phone_number, :is_valid,:reset_password_token, :password, :password_confirmation)
	end
end


