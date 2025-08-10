# frozen_string_literal: true

class Donations::DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.selection = "donation"

    if @donation.save
      if @donation.paypal?
        redirect_to @donation.paypal_url(successes_path), allow_other_host: true
      elsif @donation.venmo?
        redirect_to @donation.venmo_url, allow_other_host: true
      elsif @donation.paying_by_check?
        DonationMailer.with(donation: @donation).thank_you.deliver_later
        DonationMailer.with(donation: @donation).inform_admin.deliver_later
        redirect_to successes_path, notice: "Your #{@donation.selection} has been noted!"
      end
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_type)
  end
end
