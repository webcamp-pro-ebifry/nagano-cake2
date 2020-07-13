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
		@user = current_user
		if @user.update(user_params)
			if user_signed_in?
				flash[:notice] = "登録情報が更新されました。"
				redirect_to users_path(current_user)
			else
				redirect_to request.referrer
			end
		else
			flash[:notice] = "項目を正しく記入してください"
			redirect_to request.referrer
		end
	end
	def withdrawl
		@user = current_user
	end
	def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

	private
	def user_params

		params.require(:user).permit(:firstname, :lastname, :firstname_ruby, :lastname_ruby, :email, :postal_code, :address, :phone_number, :is_valid,:reset_password_token, :password, :encrypted_password)
	end
end


