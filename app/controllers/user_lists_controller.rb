class UserListsController < ApplicationController
  def new
    @user_list = UserList.new
  end

  def create
    @user_list = current_user.user_lists.new(user_list_params)
    if @user_list.save
      # リストの保存に成功した場合の処理
      flash[:success] = 'リストが作成されました。'
      redirect_to mypage_path(current_user.id)
    else
      # リストの保存に失敗した場合の処理
      flash.now[:danger] = 'リストの作成に失敗しました。'
      render :new
    end
  end

  private

  def user_list_params
    params.require(:user_list).permit(:list_name, :description)
  end
end
