# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Registration do
  subject(:registration) { described_class }

  describe '.find' do
    context 'when passed a non-integer' do
      it 'returns nil' do
        expect(registration.find(value: 'a')).to be_nil
      end
    end

    context 'when passed a zero' do
      it 'returns nil' do
        expect(registration.find(value: 0)).to be_nil
      end
    end

    context 'when passed a missing value' do
      it 'returns nil' do
        expect(registration.find(value: 250)).to be_nil
      end
    end

    context 'when passed an existing value' do
      it 'returns the expected value' do
        expect(registration.find(value: 1_000)).to eq '10 players'
      end
    end
  end

  describe '.all' do
    it 'returns 10 items' do
      expect(registration.all.count).to eq 10
    end
  end

  describe '.cost' do
    it 'returns 100' do
      expect(registration.cost).to eq 100
    end
  end

  describe '.qty_from_total' do
    it 'returns the expected amount' do
      qty = 9
      expect(registration.qty_from_total(9 * registration.cost)).to eq qty
    end
  end
end
