# frozen_string_literal: true

require "rails_helper"

RSpec.describe Donations::HoleSponsorsHelper do
  describe "#selected?" do
    subject(:selected) { helper.selected?(amount, donation_amount) }

    context "when the amount is the first HoleSponsor cost" do
      let(:amount) { HoleSponsor.first_amount }

      context "when the donation_amount is zero" do
        let(:donation_amount) { 0 }

        it { is_expected.to eq true }
      end

      context "when the donation_amount is not zero" do
        let(:donation_amount) { 1 }

        it { is_expected.to eq false }
      end
    end
  end
  describe "#label_content" do
  end
end
