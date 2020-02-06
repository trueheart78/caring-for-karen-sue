# frozen_string_literal: true

require 'rails_helper'

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
RSpec.describe Donations::RegistrationsHelper, type: :helper do
  describe '#registration_options' do
    let(:expected_array) do
      [
        ['1 player for $100', 100],
        ['2 players for $200', 200],
        ['3 players for $300', 300],
        ['4 players for $400', 400],
        ['5 players for $500', 500],
        ['6 players for $600', 600],
        ['7 players for $700', 700],
        ['8 players for $800', 800],
        ['9 players for $900', 900],
        ['10 players for $1,000', 1_000]
      ]
    end

    it 'returns the expected array' do
      expect(helper.registration_options).to eq expected_array
    end
  end
end
