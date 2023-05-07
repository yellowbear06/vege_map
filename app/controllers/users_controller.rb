class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back_or_to new_user_path, success: 'success'
    else
      flash.now[:danger] = 'fail'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
  end
end
