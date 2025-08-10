# frozen_string_literal: true

require "rails_helper"

# Specs in this file have access to a helper object that includes
# the Donations::RegistrationsHelper. For example:
#
# describe Donations::RegistrationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Donations::RegistrationsHelper do
  describe "#registration_options" do
    let(:cost) { Registration.cost }
    let(:expected_array) do
      [
        ["1 player for $#{cost}", cost],
        ["2 players for $#{number_with_delimiter(cost * 2, delimiter: ",")}", cost * 2],
        ["3 players for $#{number_with_delimiter(cost * 3, delimiter: ",")}", cost * 3],
        ["4 players for $#{number_with_delimiter(cost * 4, delimiter: ",")}", cost * 4],
        ["5 players for $#{number_with_delimiter(cost * 5, delimiter: ",")}", cost * 5],
        ["6 players for $#{number_with_delimiter(cost * 6, delimiter: ",")}", cost * 6],
        ["7 players for $#{number_with_delimiter(cost * 7, delimiter: ",")}", cost * 7],
        ["8 players for $#{number_with_delimiter(cost * 8, delimiter: ",")}", cost * 8],
        ["9 players for $#{number_with_delimiter(cost * 9, delimiter: ",")}", cost * 9],
        ["10 players for $#{number_with_delimiter(cost * 10, delimiter: ",")}", cost * 10]
      ]
    end

    it "returns the expected array" do
      expect(helper.registration_options).to eq expected_array
    end
  end
end
