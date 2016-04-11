require 'spec_helper'

describe 'Rubocop analysis' do
  let(:report) { `rubocop` }

  it 'has no offenses' do
    expect(report).not_to match(/Offenses/)
  end
end
