class MypageController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @new_user_list = current_user.user_lists.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :vegetarian_type_id, :address, :profile, :avatar, :avatar_cache)
  end
end
