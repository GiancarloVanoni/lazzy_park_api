class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :request_access_token

  private

  def request_access_token
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
