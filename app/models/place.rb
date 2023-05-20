class Place < ApplicationRecord
  require 'http'

  def fetch_place_id
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    query = self.name

    url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{URI.encode_www_form_component(query)}&inputtype=textquery&key=#{api_key}"
    response = HTTP.get(url)
    result = JSON.parse(response.to_s)

    if result['status'] == 'OK' && !result['candidates'].empty?
      place_id = result['candidates'].first['place_id']
      self.update(google_place_id: place_id)
    end
  end
end
