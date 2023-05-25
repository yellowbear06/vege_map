class ListPlacesController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @user_list = current_user.user_lists.find(params[:user_list_id])
    @user_list.add_list(@place)
  end

  def destroy
    @place = Place.find(params[:place_id])
    @user_list = current_user.user_lists.find(params[:user_list_id])
    @user_list.unlist(@place)
  end
end
