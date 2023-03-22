# frozen_string_literal: true

require "rails_helper"

# Specs in this file have access to a helper object that includes
# the Donations::LunchesHelper. For example:
#
# describe Donations::LunchesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Donations::LunchesHelper do
  describe "#lunch_options" do
    let(:expected_array) do
      [
        ["1 lunch for $25", 25],
        ["2 lunches for $50", 50],
        ["3 lunches for $75", 75],
        ["4 lunches for $100", 100],
        ["5 lunches for $125", 125],
        ["6 lunches for $150", 150],
        ["7 lunches for $175", 175],
        ["8 lunches for $200", 200],
        ["9 lunches for $225", 225],
        ["10 lunches for $250", 250]
      ]
    end

    it "returns the expected array" do
      expect(helper.lunch_options).to eq expected_array
    end
  end
end
