class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :info, :danger
  before_action :require_login
end
