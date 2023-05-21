class TopController < ApplicationController
  skip_before_action :require_login

  def index
    @places = Place.where(id: 111..121)
    gon.places = @places
  end

end
