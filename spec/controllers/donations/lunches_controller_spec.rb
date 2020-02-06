# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Donations::LunchesController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to be_successful
    end
  end
end
