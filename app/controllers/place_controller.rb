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
    debugger
    @place = Place.new(place_params)
    if @place.save
      redirect_to new_place_path
    else
      render :new
    end
  end


  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
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

  def fetch_place_ids
    @places = Place.where(google_place_id: nil)
    @places.each do |place|
      place.fetch_place_id
    end

    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :eng_name, :eng_address, :google_place_id)
  end
end
