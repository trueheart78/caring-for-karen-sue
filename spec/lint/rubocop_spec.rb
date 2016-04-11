require 'spec_helper'

describe 'Rubocop Analysis' do
  let(:report) { `rubocop` }

  it 'Has no offenses' do
    expect(report).not_to match(/Offenses/)
  end
end
