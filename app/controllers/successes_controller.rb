# frozen_string_literal: true

class SuccessesController < ApplicationController
  def index
  end

  protect_from_forgery except: [:hook]

  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @donation = Donation.find params[:invoice]
      @donation.update notification_params: params,
        status:              status,
        transaction_id:      params[:txn_id],
        purchased_at:        Time.zone.now

      DonationMailer.with(donation: @donation).thank_you.deliver_later
      DonationMailer.with(donation: @donation).inform_admin.deliver_later
    end
    render nothing: true
  end
end
