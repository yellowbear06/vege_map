class UserListsController < ApplicationController

  def create
    @user_list = current_user.user_lists.build(user_list_params)
    if @user_list.save
      flash[:success] = 'リストが作成されました。'
      redirect_to mypage_path(current_user.id)
    else
      flash.now[:danger] = 'リストの作成に失敗しました。'
      respond_to do |format|
        format.turbo_stream {render :user_list_errors, locals: { user_list: @user_list}, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @user_lists = current_user.user_lists.all
  end

  def update
    @user_list = current_user.user_lists.find(params[:id])
    if @user_list.update(user_list_params)
      flash[:success] = 'リストが更新されました。'
      redirect_to edit_user_list_path(current_user.id)
    else
      flash.now[:danger] = 'リストの作成に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_list = current_user.user_lists.find(params[:id])
    @user_list.destroy
    redirect_to edit_user_list_path, status: :see_other
  end

  private

  def user_list_params
    params.require(:user_list).permit(:list_name, :description)
  end
end
