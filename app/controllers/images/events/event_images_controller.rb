# frozen_string_literal: true

class Images::Events::EventImagesController < ApplicationController # /index/events/2023
  rescue_from EventImage::NotFoundError, with: :image_not_found

  def index
    @images = EventImage.all
  end

  def show
    @image = EventImage.find! params[:id].to_i
  end

  private

  def image_not_found
    @error_message = "Sorry, we're unable to find that image. Please try again."
    @images = EventImage.all

    render :index
  end
end
