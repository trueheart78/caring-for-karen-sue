# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Donation, type: :model do
  describe 'name validation' do
    subject(:donation) { build :donation, name: name }

    context 'when just right' do
      let(:name) { 'test' }

      it 'is valid' do
        expect(donation).to be_valid
      end
    end

    context 'when too short' do
      let(:name) { 't' }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end

    context 'when too short' do
      let(:name) { 't' * 31 }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe 'selection validation' do
    subject(:donation) { build :donation, selection: selection }

    %w[donation lunch registration hole_sponsor].each do |selected|
      context "when set as #{selected}" do
        let(:selection) { selected }

        it 'is valid' do
          expect(donation).to be_valid
        end
      end
    end

    context 'when anything else' do
      let(:selection) { 'silent_auction' }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe 'payment_type validation' do
    subject(:donation) { build :donation, payment_type: payment_type }

    %w[check paypal].each do |payment|
      context "when set as #{payment}" do
        let(:payment_type) { payment }

        it 'is valid' do
          expect(donation).to be_valid
        end
      end
    end

    context 'when anything else' do
      let(:payment_type) { 'venmo' }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe 'amount validation' do
    subject(:donation) { build :donation, amount: amount }

    context 'when a positive number' do
      let(:amount) { 25 }

      it 'is valid' do
        expect(donation).to be_valid
      end
    end

    context 'when zero' do
      let(:amount) { 0 }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end

    context 'when a non-integer' do
      let(:amount) { 'one' }

      it 'is not valid' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe '#donation?' do
    subject(:donation) { create :donation, selection: selection }

    context 'when the selection is a donation' do
      let(:selection) { 'donation' }

      it 'returns true' do
        expect(donation).to be_a_donation
      end
    end

    context 'when the selection is not a donation' do
      let(:selection) { 'lunch' }

      it 'returns false' do
        expect(donation).not_to be_a_donation
      end
    end
  end

  describe '#signup?' do
    subject(:donation) { create :donation, selection: selection }

    context 'when the selection is not a donation' do
      let(:selection) { 'lunch' }

      it 'returns true' do
        expect(donation).to be_a_signup
      end
    end

    context 'when the selection is a donation' do
      let(:selection) { 'donation' }

      it 'returns false' do
        expect(donation).not_to be_a_signup
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
