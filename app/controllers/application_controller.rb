class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :info, :danger
  before_action :require_login
  before_action :set_search

  def set_search
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).order(created_at: :desc).limit(10)
  end

  private

  def not_authenticated
    redirect_to login_path, warning: t('defaults.message.require_login')
  end
end
