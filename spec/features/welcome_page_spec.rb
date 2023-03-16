# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Welcome Page" do
  before do
    visit root_path
  end

  context "with navigation links" do
    it "Provides a link to the Home page" do
      expect(page.find_link("Home")).to be_visible
    end

    it "Provides a link to the Sponsor page" do
      expect(page.find_link("Sponsor")).to be_visible
    end

    it "Provides a link to the About page" do
      expect(page.find_link("About")).to be_visible
    end

    it "Provides three buttons to Sign Up" do
      expect(page.all("li a", text: "Sign Up").count).to eq(3)
    end

    it "Provides a link to the venue" do
      expect(page.find_link(Event.venue)).to be_visible
    end

    it "Provides a link to the Google Maps site" do
      expect(page.find_link("Google Maps")).to be_visible
    end
  end

  context "with event details" do
    it "Provides the event date" do
      expect(page.all("h3", text: Event.date).count).to eq 1
    end

    it "Provides the event time" do
      expect(page.all("p", text: Event.time).count).to eq 1
    end
  end
end
