class PlaceController < ApplicationController
  include PlaceHelper
  require 'net/http'
  require 'json'
  require 'uri'
  skip_before_action :require_login

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).order(created_at: :desc).limit(5)
    gon.places = @places
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    @photos = []
    @places.each do |place|
      url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place.google_place_id}&key=#{api_key}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      result = JSON.parse(response)
      if result['status'] == 'OK'
        @photos << result['result']['photos'][1]['photo_reference']
      end
    end
  end

  def new
    gon.places = Place.pluck(:google_place_id, :id).map { |google_place_id, id| { google_place_id: google_place_id, id: id } }
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    gon.place = @place
    place_id = @place.google_place_id
    api_key = ENV['GOOGLE_MAPS_API_KEY']

    url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&key=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    if result['status'] == 'OK'
      place_data = result['result']
      @phone = place_data['formatted_phone_number']
      @website = place_data['website']
      @photos = place_data['photos']
      @categories = place_data['types']
      @status = place_data['business_status']
      if @status == 'OPERATIONAL'
        @open_now = place_data&.dig('current_opening_hours', 'open_now')
        if @open_now
          "営業中"
        end
        @opening_hours = format_opening_hours(place_data['opening_hours'])
      end
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :eng_name, :eng_address, :google_place_id)
  end
end
