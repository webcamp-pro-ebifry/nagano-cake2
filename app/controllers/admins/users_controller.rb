class Admins::UsersController < ApplicationController


def index
	@users = User.with_deleted.page(params[:page])
end

def show
  	@user = User.with_deleted.find(params[:id])
end

def edit
	@user = User.with_deleted.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		if 
			flash[:notice] = "登録情報が更新されました。"
			redirect_to admins_users_path
		else
			redirect_to request.referrer
		end
	end
end

	private
	def user_params
		params.require(:user).permit(:firstname, :lastname, :firstname_ruby, :lastname_ruby, :email, :postal_code, :address, :phone_number, :deleted)
    end
end
