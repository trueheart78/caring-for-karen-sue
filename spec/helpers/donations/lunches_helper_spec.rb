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
    let(:cost) { Lunch.cost }
    let(:expected_array) do
      [
        ["1 lunch for $#{cost}", cost],
        ["2 lunches for $#{cost * 2}", cost * 2],
        ["3 lunches for $#{cost * 3}", cost * 3],
        ["4 lunches for $#{cost * 4}", cost * 4],
        ["5 lunches for $#{cost * 5}", cost * 5],
        ["6 lunches for $#{cost * 6}", cost * 6],
        ["7 lunches for $#{cost * 7}", cost * 7],
        ["8 lunches for $#{cost * 8}", cost * 8],
        ["9 lunches for $#{cost * 9}", cost * 9],
        ["10 lunches for $#{cost * 10}", cost * 10]
      ]
    end

    it "returns the expected array" do
      expect(helper.lunch_options).to eq expected_array
    end
  end
end
