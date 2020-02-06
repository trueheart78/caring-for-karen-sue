# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DonationMailer, type: :mailer do
  describe 'ADMIN_EMAIL' do
    it 'is set as expected' do
      expect(described_class::ADMIN_EMAIL).to eq 'caring-site@nym.hush.com'
    end
  end
end
