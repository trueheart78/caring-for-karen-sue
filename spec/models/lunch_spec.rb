# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lunch do
  subject(:lunch) { described_class }

  describe ".find" do
    context "when passed a non-integer" do
      it "returns nil" do
        expect(lunch.find(value: "a")).to be_nil
      end
    end

    context "when passed a zero" do
      it "returns nil" do
        expect(lunch.find(value: 0)).to be_nil
      end
    end

    context "when passed a missing value" do
      it "returns nil" do
        expect(lunch.find(value: 31)).to be_nil
      end
    end

    context "when passed an existing value" do
      it "returns the expected value" do
        expect(lunch.find(value: 300)).to eq "10 lunches"
      end
    end
  end

  describe ".all" do
    it "returns 10 items" do
      expect(lunch.all.count).to eq 10
    end
  end

  describe ".cost" do
    it "returns 30" do
      expect(lunch.cost).to eq 30
    end
  end

  describe ".qty_from_total" do
    it "returns the expected amount" do
      qty = 9
      expect(lunch.qty_from_total(9 * lunch.cost)).to eq qty
    end
  end
end
