# frozen_string_literal: true

class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all
  end
end
