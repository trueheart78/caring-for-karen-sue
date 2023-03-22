# frozen_string_literal: true

require "rails_helper"

RSpec.describe DonationsController do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end
end
