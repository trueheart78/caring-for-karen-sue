# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Donation, type: :model do
  describe 'name validation' do
    subject(:donation) { build :donation, name: name }

    context 'when just right' do
      let(:name) { 'test' }

      it 'does not generate an error' do
        expect(donation).to be_valid
      end
    end

    context 'when too short' do
      let(:name) { 't' }

      it 'generates an error' do
        expect(donation).not_to be_valid
      end
    end

    context 'when too short' do
      let(:name) { 't' * 31 }

      it 'generates an error' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe 'payment_type validation' do
    subject(:donation) { build :donation, payment_type: payment_type }

    context 'when a check' do
      let(:payment_type) { 'check' }

      it 'does not generate an error' do
        expect(donation).to be_valid
      end
    end

    context 'when paypal' do
      let(:payment_type) { 'paypal' }

      it 'does not generate an error' do
        expect(donation).to be_valid
      end
    end

    context 'when anything else' do
      let(:payment_type) { 'venmo' }

      it 'generates an error' do
        expect(donation).not_to be_valid
      end
    end
  end

  describe 'amount validation' do
    subject(:donation) { build :donation, amount: amount }

    context 'when a positive number' do
      let(:amount) { 25 }

      it 'does not generate an error' do
        expect(donation).to be_valid
      end
    end

    context 'when zero' do
      let(:amount) { 0 }

      it 'generates an error' do
        expect(donation).not_to be_valid
      end
    end

    context 'when a non-integer' do
      let(:amount) { 'one' }

      it 'generates an error' do
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
