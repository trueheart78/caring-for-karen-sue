# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Images" do
  describe "GET /images/events/2023" do
    let(:endpoint) { "/images/events/2023" }

    it "renders the index view" do
      get endpoint

      expect(response).to be_ok
      expect(response).to render_template(:index)
    end
  end

  describe "GET /images/events/2023/:id" do
    let(:endpoint) { "/images/events/2023/#{image_id}" }

    context "with a valid image id" do
      let(:image_id) { 1 }

      it "renders the show view" do
        get endpoint

        expect(response).to be_ok
        expect(response).to render_template(:show)
      end
    end

    context "with an invalid image id" do
      let(:image_id) { 174 }

      it "renders the index view with an error" do
        get endpoint

        expect(response).to be_ok
        expect(response).to render_template(:index)
        expect(response).to render_template("_error")
      end
    end
  end
end
