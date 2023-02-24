# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rubocop Analysis' do
  let(:report) { `rubocop` }

  it 'Has no offenses' do
    expect(report).not_to match(/Offenses/)
  end
end
