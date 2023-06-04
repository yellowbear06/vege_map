class TopController < ApplicationController
  skip_before_action :require_login

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).order(created_at: :desc).limit(30)
    gon.places = @places
  end
end
