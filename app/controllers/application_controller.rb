# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::RoutingError, with: :error_render_method
  after_action :custom_response_headers

  def custom_response_headers
    response.set_header 'Permissions-Policy', "geolocation=(self \"#{Site.url}\"), microphone=()"
  end

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
