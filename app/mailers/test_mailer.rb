# frozen_string_literal: true

class TestMailer < ApplicationMailer
  default from: ENV.fetch("ADMIN_EMAIL", nil)

  def test_email
    to_email = params[:to_email]
    mail(to: [to_email], subject: "CaringForKarenSue Test Email")
  end
end
