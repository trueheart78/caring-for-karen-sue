# frozen_string_literal: true

class Donations::RegistrationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'registration'
    @donation.quantity = Registration.qty_from_total params[:donation][:amount]

    if @donation.save
      if @donation.paypal?
        # TODO: verify this, maybe in console?
        redirect_to @donation.paypal_url(donation_registration_path(@donation))
      else
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
