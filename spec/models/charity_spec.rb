# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Charity, type: :model do
  subject(:charity) { described_class }

  describe '.name' do
    it 'is "Shiloh House"' do
      expect(charity.name).to eq 'Shiloh House'
    end
  end

  describe '.url' do
    it 'is the expected value' do
      expect(charity.url).to eq 'https://www.shilohhouse.org'
    end
  end

  describe '.logo' do
    it 'is the expected logo' do
      expect(charity.logo).to eq 'shiloh-house.png'
    end
  end

  describe '.copy' do
    it 'has expected content' do
      expect(charity.copy).to match charity.name
      expect(charity.copy).to match '501 \(C\) \(3\)'
      expect(charity.copy).to match 'Visit them online'
    end
  end
end
