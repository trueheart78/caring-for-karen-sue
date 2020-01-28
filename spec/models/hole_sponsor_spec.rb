# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HoleSponsor, type: :model do
  subject(:hole_sponsor) { described_class }

  describe '.find' do
    context 'when passed a non-integer' do
      it 'returns nil' do
        expect(hole_sponsor.find(value: 'a')).to be_nil
      end
    end

    context 'when passed a zero' do
      it 'returns nil' do
        expect(hole_sponsor.find(value: 0)).to be_nil
      end
    end

    context 'when passed a missing value' do
      it 'returns nil' do
        expect(hole_sponsor.find(value: 250)).to be_nil
      end
    end

    context 'when passed an existing value' do
      it 'returns the expected value' do
        expected = { name: 'Birdie', description: '1 Foursome and 1 Hole Sponsor' }
        expect(hole_sponsor.find(value: 500)).to match expected
      end
    end
  end

  describe '.all' do
    it 'returns 5 items' do
      expect(hole_sponsor.all.count).to eq 5
    end
  end
end
