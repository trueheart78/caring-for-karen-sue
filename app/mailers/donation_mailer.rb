class DonationMailer < ApplicationMailer
  def thank_you
    @donation = params[:donation]
    mail to: @donation.email, subject: "Your #{@donation.selection.titleize} Details"
  end
end
