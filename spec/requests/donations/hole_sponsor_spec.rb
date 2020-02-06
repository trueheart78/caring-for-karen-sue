# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Hole Sponsors', type: :request do
  describe 'creating a new hole sponsor' do
    let(:endpoint) { '/donations/hole_sponsors' }

    context 'when the data is valid' do
      let(:donation) do
        {
          name: SecureRandom.hex(5),
          email: 'valid@email.com',
          amount: 200,
          payment_type: 'check'
        }
      end

      it 'redirects to the successes page' do
        post endpoint, params: { donation: donation }

        expect(response).to redirect_to(successes_path)
      end

      xit 'sends emails' do
        # expect(DonationMailer).to receive(:with)
        post endpoint, params: { donation: donation }
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

      xit 'does not send emails' do
        post endpoint, params: { donation: donation }
        # expect(DonationMailer).not_to have_received(:with)
      end
    end
  end

  describe 'visiting the new hole sponsor page' do
    it 'renders the expected template' do
      get '/donations/hole_sponsors/new'
      expect(response).to render_template(:new)
    end
  end
end
