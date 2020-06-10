# frozen_string_literal: true

class Donations::DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'donation'

    if @donation.save
      if @donation.paypal?
        redirect_to @donation.paypal_url(new_donations_donation_path)
      elsif @donation.paying_by_check?
        DonationMailer.with(donation: @donation).thank_you.deliver_later
        DonationMailer.with(donation: @donation).inform_admin.deliver_later
        redirect_to successes_path, notice: "Your #{@donation.selection} has been noted!"
      end
    else
      render :new
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_type)
  end
end
