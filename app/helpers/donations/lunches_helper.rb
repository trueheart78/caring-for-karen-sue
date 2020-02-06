# frozen_string_literal: true

module Donations::LunchesHelper
  def lunch_options
    Lunch.all.map { |k, v| ["#{v} for $#{k}", k] }
  end
end
