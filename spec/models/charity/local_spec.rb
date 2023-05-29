# frozen_string_literal: true

require "rails_helper"

RSpec.describe Charity::Local do
  subject(:charity) { described_class }

  describe ".name" do
    it 'is "local"' do
      expect(charity.name).to eq "local"
    end
  end

  describe ".url" do
    it "is nil" do
      expect(charity.url).to be_nil
    end
  end

  describe ".logo" do
    it "is nil" do
      expect(charity.logo).to be_nil
    end
  end

  describe ".copy" do
    it "is nil" do
      expect(charity.copy).to be_nil
    end
  end
end
