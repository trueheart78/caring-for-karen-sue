# frozen_string_literal: true

class Donation < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 50, message: 'Name is invalid' }
  # https://api.rubyonrails.org/v5.2/classes/ActiveModel/Validations/ClassMethods.html#method-i-validates
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create,
                              message: 'Email address is invalid' }
  validates :selection, inclusion: { in: %w[donation registration lunch hole_sponsor],
                                     message: 'Selection invalid' }
  validates :amount, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     message: 'Amount must be a positive number' }
  validates :payment_type, inclusion: { in: %w[check paypal],
                                        message: 'Payment type must be selected' }

  def donation?
    selection == 'donation'
  end

  def signup?
    !donation?
  end

  def paying_by_check?
    payment_type == 'check'
  end

  # TODO: change this to reflect the quantity that they selected
  def selected_item
    selection.titleize
  end

  def self.payment_types
    [
      ['-- Please Select --', 'none'],
      ['Check/Money Order', 'check'],
      ['Paypal/Credit Card', 'paypal']
    ]
  end

  private

  def type
    return 'donation' if selection == 'donation'

    'signup'
  end
end
