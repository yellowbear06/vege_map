class TopController < ApplicationController
  skip_before_action :require_login

  def index; end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to "/top/#{@place.id}", notice: '場所が正常に登録されました。'
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:name, :map_url, :address, :latitude, :longitude)
  end
end
