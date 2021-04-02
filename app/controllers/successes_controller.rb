# frozen_string_literal: true

class SuccessesController < ApplicationController
  def index; end

  protect_from_forgery except: [:hook]

  # rubocop:disable Metrics/AbcSize
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == 'Completed'
      @donation = Donation.find params[:invoice]
      @donation.update_attributes notification_params: params,
                                  status:              status,
                                  transaction_id:      params[:txn_id],
                                  purchased_at:        Time.now

      DonationMailer.with(donation: @donation).thank_you.deliver_later
      DonationMailer.with(donation: @donation).inform_admin.deliver_later
    end
    render nothing: true
  end
  # rubocop:enable Metrics/AbcSize
end
