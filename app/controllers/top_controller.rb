class TopController < ApplicationController
  require 'net/http'
  require 'json'
  skip_before_action :require_login

  def index; end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    place_name = params[:place][:name]
    api_key = ENV['GOOGLE_MAPS_API_KEY']

    url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{URI.encode_www_form_component(place_name)}&inputtype=textquery&key=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    if result['status'] == 'OK' && !result['candidates'].empty?
      place_data = result['candidates'].first
      @place.map_url = place_data['place_id']
      @place.name = place_name
      @place.save
      redirect_to :new, status: :created
    else
      render json: { error: 'Place not found' }, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    place_id = @place.map_url
    api_key = ENV['GOOGLE_MAPS_API_KEY']

    url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&key=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    if result['status'] == 'OK'
      place_data = result['result']
      render json: place_data, status: :ok
    else
      render json: { error: 'Failed to retrieve place details' }, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :map_url, :address, :latitude, :longitude)
  end
end
