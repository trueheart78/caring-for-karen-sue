require 'spec_helper'

describe 'Rubocop analyzes files for correct syntax' do
  let(:report)      { `rubocop` }

  it 'has no offenses' do
    expect(report).not_to match(/Offenses/)
  end
end
