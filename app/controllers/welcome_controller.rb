# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end
end
