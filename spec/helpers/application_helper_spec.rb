# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DonationsHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe 'current_charity' do
    it 'is set to the expected class' do
      expect(helper.current_charity).to be Charity::RightStep
    end
  end
end
