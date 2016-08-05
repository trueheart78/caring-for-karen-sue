class RobotsController < ApplicationController
  def index
    respond_to :text
    expires_in 6.hours, public: true
  end
end
