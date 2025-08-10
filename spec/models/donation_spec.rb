# frozen_string_literal: true

require "rails_helper"

RSpec.describe Donation do
  describe "name validation" do
    subject(:donation) { build :donation, name: name }

    context "when just right" do
      let(:name) { "test" }

      it "is valid" do
        expect(donation).to be_valid
      end
    end

    context "when too short" do
      let(:name) { "t" }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end

    context "when too long" do
      let(:name) { "t" * 51 }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end
  end

  describe "email validation" do
    subject(:donation) { build :donation, email: email }

    context "when a valid email" do
      let(:email) { "user@domain.com" }

      it "is valid" do
        expect(donation).to be_valid
      end
    end

    context "when an invalid email" do
      let(:email) { "userdomain.com" }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end
  end

  describe "selection validation" do
    subject(:donation) { build :donation, selection: selection }

    %w[donation lunch registration hole_sponsor].each do |selected|
      context "when set as #{selected}" do
        let(:selection) { selected }

        it "is valid" do
          expect(donation).to be_valid
        end
      end
    end

    context "when anything else" do
      let(:selection) { "silent_auction" }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end
  end

  describe "#selected_item" do
    subject(:selected_item) { build(:donation, selection: selection, quantity: quantity).selected_item }

    context "when lunch" do
      let(:selection) { "lunch" }
      let(:quantity) { 3 }
      let(:expected_value) { "Lunch (quantity: 3)" }

      it "includes the quantity" do
        expect(selected_item).to eq expected_value
      end
    end

    context "when registration" do
      let(:selection) { "registration" }
      let(:quantity) { 3 }
      let(:expected_value) { "Registration (quantity: 3)" }

      it "includes the quantity" do
        expect(selected_item).to eq expected_value
      end
    end

    # donation, hole_sponsor
  end

  describe "amount validation" do
    subject(:donation) { build :donation, amount: amount }

    context "when a positive number" do
      let(:amount) { 25 }

      it "is valid" do
        expect(donation).to be_valid
      end
    end

    context "when zero" do
      let(:amount) { 0 }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end

    context "when a non-integer" do
      let(:amount) { "one" }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end
  end

  describe "payment_type validation" do
    subject(:donation) { build :donation, payment_type: payment_type }

    %w[check paypal venmo].each do |payment|
      context "when set as #{payment}" do
        let(:payment_type) { payment }

        it "is valid" do
          expect(donation).to be_valid
        end
      end
    end

    context "when anything else" do
      let(:payment_type) { "bank_account" }

      it "is not valid" do
        expect(donation).not_to be_valid
      end
    end
  end

  describe "#donation?" do
    subject(:donation) { create :donation, selection: selection }

    context "when the selection is a donation" do
      let(:selection) { "donation" }

      it "returns true" do
        expect(donation).to be_a_donation
      end
    end

    context "when the selection is not a donation" do
      let(:selection) { "lunch" }

      it "returns false" do
        expect(donation).not_to be_a_donation
      end
    end
  end

  describe ".payment_types" do
    let(:expected_array) do
      [
        ["-- Please Select --", "none"],
        ["Check/Money Order", "check"],
        ["Paypal/Credit Card", "paypal"],
        ["Venmo", "venmo"]
      ]
    end

    it "has the expected elements" do
      expect(described_class.payment_types).to eq expected_array
    end
  end

  describe "#signup?" do
    subject(:donation) { create :donation, selection: selection }

    context "when the selection is not a donation" do
      let(:selection) { "lunch" }

      it "returns true" do
        expect(donation).to be_a_signup
      end
    end

    context "when the selection is a donation" do
      let(:selection) { "donation" }

      it "returns false" do
        expect(donation).not_to be_a_signup
      end
    end
  end

  describe "#paypal?" do
    subject(:donation) { create :donation, payment_type: payment_type }

    context "when the payment type is paypal" do
      let(:payment_type) { "paypal" }

      it "returns true" do
        expect(donation).to be_paypal
      end
    end

    context "when the payment type is not paypal" do
      let(:payment_type) { "check" }

      it "returns false" do
        expect(donation).not_to be_paypal
      end
    end
  end

  describe "#paying_by_check?" do
    subject(:donation) { create :donation, payment_type: payment_type }

    context "when the payment type is a check" do
      let(:payment_type) { "check" }

      it "returns true" do
        expect(donation).to be_paying_by_check
      end
    end

    context "when the payment type is not a check" do
      let(:payment_type) { "paypal" }

      it "returns false" do
        expect(donation).not_to be_paying_by_check
      end
    end
  end

  describe "#venmo?" do
    subject(:donation) { create :donation, payment_type: payment_type }

    context "when the payment type is venmo" do
      let(:payment_type) { "venmo" }

      it "returns true" do
        expect(donation).to be_venmo
      end
    end

    context "when the payment type is not venmo" do
      let(:payment_type) { "check" }

      it "returns false" do
        expect(donation).not_to be_venmo
      end
    end
  end

  describe "#paypal_url" do
    subject(:url) { create(:donation, quantity: qty).paypal_url return_path }

    let(:qty) { 5 }
    let(:return_path) { "xyz" }
    let(:expected_url) do
      "https://www.sandbox.paypal.com/cgi-bin/webscr?amount=100&business=Test%40test.com&cmd=_xclick&invoice=1&item_name=Donation&item_number=1&notify_url=http%3A%2F%2Flocalhost%2Fhook&quantity=5&return=http%3A%2F%2Flocalhost%2Fxyz&upload=1"
    end

    it "returns the expected path" do
      expect(url).to eq expected_url
    end
  end

  describe "#venmo_url" do
    subject(:url) { create(:donation, selection: selection, quantity: qty, amount: amount).venmo_url }

    let(:qty) { 5 }
    let(:amount) { 125 }
    let(:selection) { "registration" }
    let(:expected_url) do
      "https://account.venmo.com/pay?amount=#{amount * qty}&audience=private&note=Registration+%28quantity%3A+#{qty}%29&recipients=#{ENV.fetch("VENMO_USERNAME", nil)}&txn=charge"
    end

    it "returns the expected path" do
      expect(url).to eq expected_url
    end
  end
end
