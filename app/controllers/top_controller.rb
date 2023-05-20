class TopController < ApplicationController
  skip_before_action :require_login

  def index
    @places = Place.all
  end

end
