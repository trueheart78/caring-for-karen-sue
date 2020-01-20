# frozen_string_literal: true

class Donation < ApplicationRecord
  def donation?
    selection == 'donation'
  end

  def signup?
    !donation?
  end

  def type
    return 'donation' if selection == 'donation'

    'signup'
  end

  def amount
    amount_in_cents / 100.0
  end
end
