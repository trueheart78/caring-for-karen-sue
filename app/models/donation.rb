# frozen_string_literal: true

class Donation < ApplicationRecord
  validates :name, length: {minimum: 2, maximum: 50, message: "Name is invalid"}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create,
                             message: "Email address is invalid"}
  validates :selection, inclusion: {in: %w[donation registration lunch hole_sponsor],
                                    message: "Selection invalid"}
  validates :amount, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    message: "Amount must be a positive number"}
  validates :payment_type, inclusion: {in: %w[check paypal venmo],
                                       message: "Payment type must be selected"}
  validates :quantity, numericality: {only_integer: true,
                                      greater_than_or_equal_to: 1,
                                      message: "Amount must be a positive number"}

  def donation?
    selection == "donation"
  end

  def signup?
    !donation?
  end

  def paypal?
    payment_type == "paypal"
  end

  def paying_by_check?
    payment_type == "check"
  end

  def venmo?
    payment_type == "venmo"
  end

  def selected_item
    if selection == "registration" || selection == "lunch"
      "#{selection.titleize} (quantity: #{quantity})"
    elsif selection == "hole_sponsor"
      HoleSponsor.find(value: amount)&.fetch(:name)&.+ " (Hole Sponsor)"
    else
      selection.titleize
    end
  end

  def total_amount
    return amount unless %w[registration lunch].include?(selection)

    amount * quantity
  end

  def paypal_url(return_path)
    URI.join(Rails.application.secrets.paypal_host,
      "cgi-bin/webscr?#{paypal_values(return_path).to_query}").to_s
  end

  def venmo_url
    URI.join("https://account.venmo.com", "pay?#{venmo_values.to_query}").to_s
  end

  def self.payment_types
    [
      ["-- Please Select --", "none"],
      ["Check/Money Order", "check"],
      ["Paypal/Credit Card", "paypal"]
      # ["Venmo", "venmo"]
    ]
  end

  private

  def type
    return "donation" if selection == "donation"

    "signup"
  end

  def item_num
    return 1 if selection == "donation"
    return 2 if selection == "registration"
    return 3 if selection == "lunch"
    return 4 if selection == "hole_sponsor"

    nil
  end

  def paypal_values(return_path)
    {
      business: ENV.fetch("PAYPAL_MERCHANT_EMAIL", nil),
      cmd: "_xclick",
      upload: 1,
      return: "#{Rails.application.secrets.app_host}/#{return_path}",
      invoice: id,
      amount: amount,
      item_name: selected_item,
      item_number: item_num,
      quantity: quantity,
      notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
  end

  # audience=private&amount=125&note=Donation%20for%20event&recipients=%2CCaringforkarensue&txn=charge
  def venmo_values
    {
      audience: :private,
      amount: total_amount,
      note: selected_item,
      recipients: ENV.fetch("VENMO_USERNAME", nil),
      txn: :charge
    }
  end
end
