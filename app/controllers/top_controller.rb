class TopController < ApplicationController
  skip_before_action :require_login

  def index
    @places = Place.all.order(created_at: :desc).limit(30)
    gon.places = @places
  end
end
