class TopController < ApplicationController
  require 'net/http'
  require 'json'
  skip_before_action :require_login

  def index
    @places = Sample.all
  end

  def fetch_place_ids
    @places = Sample.all
    @places.each do |place|
      place.fetch_place_id
    end

    redirect_to fetch_place_ids_top_index
  end

  def edit
    @place = Sample.find(params[:id])
  end

  def update
    @place = Sample.find(params[:id])
    place_name = params[:place][:name]
    api_key = ENV['GOOGLE_MAPS_API_KEY']

    url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{google_place_id}&key=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    if result['status'] == 'OK' && !result['candidates'].empty?
      place_data = result['candidates'].first
      @place.google_place_id = place_data['place_id']
      @place.name = place_name
      @place.save
      redirect_to :new, status: :created
    else
      render json: { error: 'Place not found' }, status: :unprocessable_entity
    end
  end

  def show
    @place = Sample.find(params[:id])
    place_id = @place.google_place_id
    api_key = ENV['GOOGLE_MAPS_API_KEY']

    url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&key=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    if result['status'] == 'OK'
      place_data = result['result']
      @name = place_data['name']
      @address = place_data['formatted_address']
      @phone = place_data['formatted_phone_number']
      @website = place_data['website']
      @opening_hours = place_data['opening_hours']['weekday_text']
      @photos = place_data['photos']
      @categories = place_data['types']
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :map_url, :address, :latitude, :longitude)
  end
end
