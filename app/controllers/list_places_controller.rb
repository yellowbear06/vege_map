class ListPlacesController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @user_list = current_user.user_lists.find(params[:user_list_id])
    if @user_list.add_list(@place)
      respond_to do |format|
        format.turbo_stream {render :create, locals: { list: @user_list, place: @place, icon_name: params[:icon_name]}}
      end
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @user_list = current_user.user_lists.find(params[:user_list_id])
    if @user_list.unlist(@place)
      respond_to do |format|
        format.turbo_stream {render :destroy, locals: { list: @user_list, place: @place, icon_name: params[:icon_name]}}
      end
    end
  end
end
