# frozen_string_literal: true

class Donations::RegistrationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'registration'

    if @donation.save
      redirect_to root_path, notice: "Your #{donation.selection} has been noted!"
    else
      render :edit
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:name, :email, :amount, :payment_type)
  end
end
