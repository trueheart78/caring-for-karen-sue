# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, with: :route_not_found

  after_action :custom_response_headers

  class SuckyError < StandardError; end

  def custom_response_headers
    response.set_header "Permissions-Policy", "geolocation=(self \"#{Site.url}\"), microphone=()"
  end

  def route_not_found
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end
end
