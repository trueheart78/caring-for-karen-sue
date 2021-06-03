# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site, type: :model do
  subject(:site) { described_class }

  it 'has the expected title' do
    expect(site.title).to eq 'Caring for Karen Sue'
  end

  it 'has the expected website' do
    expect(site.website).to eq 'CaringForKarenSue.com'
  end

  it 'has the expected url' do
    expect(site.url).to eq 'https://www.caringforkarensue.com'
  end

  it 'has the expected facebook_url' do
    expect(site.facebook_url).to eq 'http://facebook.com/caringforkarensue'
  end

  describe '.description' do
    context 'when an iteration is provided' do
      let(:iteration) { '42nd' }
      # rubocop:disable Layout/LineLength
      let(:expected_string) do
        'Come register for the 42nd Annual Golf Classic, a four man best ball-scramble type tournament.'
      end
      # rubocop:enable Layout/LineLength

      it 'has the expected string' do
        expect(site.description(iteration: iteration)).to eq expected_string
      end
    end

    context 'when an iteration is not provided' do
      it 'raises an exception' do
        expect { site.description }.to raise_error(ArgumentError)
      end
    end
  end

  it 'has the expected image_url' do
    expect(site.image_url).to eq 'https://www.caringforkarensue.com/images/gloves.png'
  end

  describe '.image' do
    it 'has the expected value' do
      expect(site.image).to eq 'images/gloves.png'
    end

    it 'exists on the file system' do
      path = Rails.root.join 'public', site.image
      expect(File.exist?(path)).to eq true
    end
  end
end
