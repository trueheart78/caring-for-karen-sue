# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DonationsHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe '#current_charity' do
    it 'is set to the expected class' do
      expect(helper.current_charity).to be Charity::ShilohHouse
    end
  end

  describe '#google_analytics?' do
    subject(:analytics) { helper.google_analytics? }

    context 'when both env vars are set' do
      it 'returns true' do
        ENV['GOOGLE_ANALYTICS_KEY'] = 'x'
        ENV['GOOGLE_ANALYTICS_SITE'] = 'y'
        expect(analytics).to eq true
      end
    end

    context 'when the key env var is not set' do
      it 'returns false' do
        ENV['GOOGLE_ANALYTICS_KEY'] = ''
        ENV['GOOGLE_ANALYTICS_SITE'] = 'y'
        expect(analytics).to eq false
      end
    end

    context 'when the site env var is not set' do
      it 'returns false' do
        ENV['GOOGLE_ANALYTICS_KEY'] = 'x'
        ENV['GOOGLE_ANALYTICS_SITE'] = ''
        expect(analytics).to eq false
      end
    end

    context 'when the both env vars are not set' do
      it 'returns false' do
        ENV['GOOGLE_ANALYTICS_KEY'] = ''
        ENV['GOOGLE_ANALYTICS_SITE'] = ''
        expect(analytics).to eq false
      end
    end
  end

  describe '#google_analytics_key' do
    it 'returns the ENV["GOOGLE_ANALYTICS_KEY"] value' do
      ENV['GOOGLE_ANALYTICS_KEY'] = SecureRandom.hex 10
      expect(helper.google_analytics_key).to eq ENV['GOOGLE_ANALYTICS_KEY']
    end
  end

  describe '#google_analytics_site' do
    it 'returns the ENV["GOOGLE_ANALYTICS_SITE"] value' do
      ENV['GOOGLE_ANALYTICS_SITE'] = SecureRandom.hex 10
      expect(helper.google_analytics_site).to eq ENV['GOOGLE_ANALYTICS_SITE']
    end
  end
end
