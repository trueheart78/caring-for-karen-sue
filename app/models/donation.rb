# frozen_string_literal: true

class Donation < ApplicationRecord
  # rubocop:disable Layout/LineLength
  validates :name, length: { minimum: 2, maximum: 50, message: 'Name is invalid' }
  # https://api.rubyonrails.org/v5.2/classes/ActiveModel/Validations/ClassMethods.html#method-i-validates
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create,
                              message: 'Email address is invalid' }
  validates :selection, inclusion: { in:      %w[donation registration lunch hole_sponsor],
                                     message: 'Selection invalid' }
  validates :amount, numericality: { only_integer:             true,
                                     greater_than_or_equal_to: 1,
                                     message:                  'Amount must be a positive number' }
  validates :payment_type, inclusion: { in:      %w[check paypal],
                                        message: 'Payment type must be selected' }
  validates :quantity, numericality: { only_integer:             true,
                                       greater_than_or_equal_to: 1,
                                       message:                  'Amount must be a positive number' }
  # rubocop:enable Layout/LineLength

  def donation?
    selection == 'donation'
  end

  def signup?
    !donation?
  end

  def paypal?
    payment_type == 'paypal'
  end

  def paying_by_check?
    payment_type == 'check'
  end

  # TODO: change this to reflect the quantity that they selected
  def selected_item
    selection.titleize
  end

  def paypal_url(return_path)
    URI.join(Rails.application.secrets.paypal_host,
             "cgi-bin/webscr?#{paypal_values(return_path).to_query}").to_s
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

  def item_num
    return 1 if selection == 'donation'
    return 2 if selection == 'registration'
    return 3 if selection == 'lunch'
    return 4 if selection == 'hole_sponsor'
  end

  def paypal_values(return_path)
    {
      business:    ENV['PAYPAL_MERCHANT_EMAIL'],
      cmd:         '_xclick',
      upload:      1,
      return:      "#{Rails.application.secrets.app_host}/#{return_path}",
      invoice:     id,
      amount:      amount,
      item_name:   selected_item,
      item_number: item_num,
      quantity:    quantity,
      notify_url:  "#{Rails.application.secrets.app_host}/hook"
    }
  end
end
