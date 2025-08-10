# frozen_string_literal: true

require "rails_helper"

RSpec.describe Charity::HopeAndHome do
  subject(:charity) { described_class }

  describe ".name" do
    it 'is "Hope & Home"' do
      expect(charity.name).to eq "Hope & Home"
    end
  end

  describe ".local?" do
    it "is false" do
      expect(charity).not_to be_local
    end
  end

  describe ".url" do
    it "is the expected value" do
      expect(charity.url).to eq "https://www.hopeandhome.org"
    end
  end

  describe ".logo" do
    it "is the expected logo" do
      expect(charity.logo).to eq "hope-and-home.png"
    end
  end

  describe ".copy" do
    it "has expected content" do
      expect(charity.copy).to match charity.name.titleize
      # expect(charity.copy).to match '501 \(C\) \(3\)'
      # expect(charity.copy).to match "Visit them online"
    end
  end
end
