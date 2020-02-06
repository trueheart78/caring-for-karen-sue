# frozen_string_literal: true

class Donations::HoleSponsorsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'hole_sponsor'

    if @donation.save
      DonationMailer.with(donation: @donation).thank_you.deliver_later
      redirect_to successes_path, notice: "Your #{@donation.selection.tr('_', ' ')} has been noted!"
    else
      render :edit
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_type)
  end
end
