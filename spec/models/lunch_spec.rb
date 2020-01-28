# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lunch, type: :model do
  subject(:lunch) { described_class }

  describe '.find' do
    context 'when passed a non-integer' do
      it 'returns nil' do
        expect(lunch.find(value: 'a')).to be_nil
      end
    end

    context 'when passed a zero' do
      it 'returns nil' do
        expect(lunch.find(value: 0)).to be_nil
      end
    end

    context 'when passed a missing value' do
      it 'returns nil' do
        expect(lunch.find(value: 30)).to be_nil
      end
    end

    context 'when passed an existing value' do
      it 'returns the expected value' do
        expect(lunch.find(value: 250)).to eq '10 lunches'
      end
    end
  end

  describe '.all' do
    it 'returns 10 items' do
      expect(lunch.all.count).to eq 10
    end
  end

  describe '.cost' do
    it 'returns 25' do
      expect(lunch.cost).to eq 25
    end
  end
end
