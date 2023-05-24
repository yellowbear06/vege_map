class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.create_default_lists
      auto_login(@user)
      redirect_back_or_to top_path, success: 'success'
    else
      flash.now[:danger] = 'fail'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
  end
end
