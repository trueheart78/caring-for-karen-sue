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
end
