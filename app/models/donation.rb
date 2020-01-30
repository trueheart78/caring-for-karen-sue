# frozen_string_literal: true

class Donation < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 30 }
  # https://api.rubyonrails.org/v5.2/classes/ActiveModel/Validations/ClassMethods.html#method-i-validates
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :selection, inclusion: { in: %w[donation registration lunch hole_sponsor],
                                     message: 'Invalid selection' }
  validates :payment_type, inclusion: { in: %w[check paypal] }
  validates :amount, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     message: 'Amount must be a positive number' }

  def donation?
    selection == 'donation'
  end

  def signup?
    !donation?
  end

  private

  def type
    return 'donation' if selection == 'donation'

    'signup'
  end
end
