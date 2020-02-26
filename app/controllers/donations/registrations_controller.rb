# frozen_string_literal: true

class Donations::RegistrationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'registration'

    if @donation.save
      DonationMailer.with(donation: @donation).thank_you.deliver_later
      DonationMailer.with(donation: @donation).inform_admin.deliver_later
      redirect_to successes_path, notice: "Your #{@donation.selection} has been noted!"
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_type)
  end
end
