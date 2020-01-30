# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Donation, type: :model do
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
