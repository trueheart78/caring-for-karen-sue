# frozen_string_literal: true

module Donations::HoleSponsorsHelper
  def selected?(amount, donation_amount)
    return true if amount == HoleSponsor.first_amount && donation_amount.zero?

    donation_amount == amount
  end

  def label_content(amount, details)
    price = display_price(amount, details.fetch(:display_cost, nil))

    "#{details[:name]} for $#{price} &mdash; #{details[:description]}"
  end

  private

  def display_price(amount, display_cost)
    return display_cost unless display_cost.nil?

    number_with_delimiter amount, delimiter: ","
  end
end
