# frozen_string_literal: true

class DonationMailer < ApplicationMailer
  ADMIN_EMAIL = "caring-site@nym.hush.com"

  def thank_you
    @donation = params[:donation]
    mail to: @donation.email, subject: "Your #{@donation.selection.titleize} Details"
  end

  def inform_admin
    @donation = params[:donation]
    mail to: admin_email, subject: "New #{@donation.selection.titleize} Details"
  end

  private

  def admin_email
    return ENV["ADMIN_EMAIL"] if ENV["ADMIN_EMAIL"].present?

    ADMIN_EMAIL
  end
end
