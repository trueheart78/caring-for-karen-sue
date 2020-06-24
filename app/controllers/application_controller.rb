# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: true
  end
end
