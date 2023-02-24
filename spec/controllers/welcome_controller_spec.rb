# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'returns a 404 not found' do
      post :create, params: { data: 'test' }
      expect(response).to be_not_found
    end
  end
end
