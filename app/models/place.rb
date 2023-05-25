class Place < ApplicationRecord
  require 'http'

  has_many :list_places
  has_many :listing, through: :list_places, source: :user_list

  def fetch_place_id
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    query = self.eng_name

    url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{URI.encode_www_form_component(query)}&inputtype=textquery&key=#{api_key}"
    response = HTTP.get(url)
    result = JSON.parse(response.to_s)

    if result['status'] == 'OK' && !result['candidates'].empty?
      place_id = result['candidates'].first['place_id']
      self.transaction do
        self.lock!
        self.update_columns(google_place_id: place_id)
      end
    end
  end

  def listed_by?(user_list)
    listing.include?(user_list)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "eng_name", "address", "eng_address"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
