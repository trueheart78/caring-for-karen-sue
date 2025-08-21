# frozen_string_literal: true

class ResendDeliveryMethod
  def initialize(settings)
    @settings = settings
  end

  def deliver!(mail)
    resend = Resend::Client.new(api_key: ENV.fetch("RESEND_API_KEY", nil))

    resend.emails.send({
      from: mail.from.first,
      to: mail.to,
      subject: mail.subject,
      html: mail.html_part&.body&.to_s || mail.body.to_s,
      text: mail.text_part&.body&.to_s
    })
  end
end

# Register the delivery method
ActionMailer::Base.add_delivery_method :resend, ResendDeliveryMethod
