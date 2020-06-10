# frozen_string_literal: true

class Donations::LunchesController < ApplicationController
  def new
    @donation = Donation.new
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def create
    @donation = Donation.new(donation_params)
    @donation.selection = 'lunch'
    @donation.quantity = Lunch.qty_from_total(params[:donation][:amount].to_i)
    @donation.amount   = Lunch.cost

    if @donation.save
      if @donation.paypal?
        redirect_to @donation.paypal_url(new_donations_lunch_path)
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
