# frozen_string_literal: true

class Donation < ApplicationRecord
  def amount
    amount_in_cents / 100.0
  end
end
