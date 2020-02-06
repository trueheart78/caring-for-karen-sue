# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@caringforkarensue.com'
  layout 'mailer'
end
