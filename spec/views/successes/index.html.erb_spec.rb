# frozen_string_literal: true

require "rails_helper"

RSpec.describe "successes/index.html.erb" do
  describe "with a notification" do
    let(:notification) { SecureRandom.hex 20 }

    it "displays the notification" do
      flash[:notice] = notification
      render
      expect(rendered).to match notification
    end

    it "informs of an outbound email" do
      render
      expect(rendered).to match "You should receive an email from us shortly."
    end
  end

  describe "without a notification" do
    it "informs of an outbound email" do
      render
      expect(rendered).to match "You should receive an email from us shortly."
    end
  end
end
