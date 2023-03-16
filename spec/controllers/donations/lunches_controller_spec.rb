# frozen_string_literal: true

require "rails_helper"

RSpec.describe Donations::LunchesController do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end
end
