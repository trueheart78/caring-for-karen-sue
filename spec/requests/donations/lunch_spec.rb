# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lunch Registrations', type: :request do
  describe 'creating a new lunch registration' do
    let(:endpoint) { '/donations/lunches' }

    context 'when the data is valid' do
      let(:donation) do
        {
          name: SecureRandom.hex(5),
          email: 'valid@email.com',
          amount: 100,
          payment_type: 'check'
        }
      end

      it 'redirects to the successes page' do
        post endpoint, params: { donation: donation }

        expect(response).to redirect_to(successes_path)
      end

      it 'sends emails' do
        expect do
          post endpoint, params: { donation: donation }
        end.to have_enqueued_job.twice.on_queue('mailers')
      end
    end

    context 'when the data is invalid' do
      let(:donation) do
        {
          name: SecureRandom.hex(5),
          email: 'valid@email.com',
          amount: 0,
          payment_type: 'check'
        }
      end

      it 'renders the expected page' do
        post endpoint, params: { donation: donation }

        expect(response).to render_template(:new)
      end

      it 'does not send emails' do
        expect do
          post endpoint, params: { donation: donation }
        end.not_to have_enqueued_job.on_queue('mailers')
      end
    end
  end

  describe 'visiting the new lunch registration page' do
    it 'renders the expected template' do
      get '/donations/lunches/new'
      expect(response).to render_template(:new)
    end
  end
end
