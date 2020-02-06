# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/donation_mailer
class DonationMailerPreview < ActionMailer::Preview
  def thank_you_check
    DonationMailer.with(donation: donation).thank_you
  end

  def thank_you_paypal
    DonationMailer.with(donation: donation).thank_you
  end

  def thank_you_lunch
    DonationMailer.with(donation: lunch).thank_you
  end

  def thank_you_registration
    DonationMailer.with(donation: registration).thank_you
  end

  def thank_you_hole_sponsor
    DonationMailer.with(donation: hole_sponsor).thank_you
  end

  def inform_admin_donation
    DonationMailer.with(donation: donation).inform_admin
  end

  def inform_admin_lunch
    DonationMailer.with(donation: lunch).inform_admin
  end

  def inform_admin_registration
    DonationMailer.with(donation: registration).inform_admin
  end

  def inform_admin_hole_sponsor
    DonationMailer.with(donation: hole_sponsor).inform_admin
  end

  private

  def donation
    FactoryBot.build(:donation)
  end

  def lunch
    FactoryBot.build(:lunch)
  end

  def registration
    FactoryBot.build(:registration)
  end

  def hole_sponsor
    FactoryBot.build(:hole_sponsor)
  end
end
