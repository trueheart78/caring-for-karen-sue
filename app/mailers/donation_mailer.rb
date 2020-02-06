# frozen_string_literal: true

class DonationMailer < ApplicationMailer
  def thank_you
    @donation = params[:donation]
    mail to: @donation.email, subject: "Your #{@donation.selection.titleize} Details"
  end

  def inform_admin
    @donation = params[:donation]
    mail to: @donation.email, subject: "New #{@donation.selection.titleize} Details"
  end
end
