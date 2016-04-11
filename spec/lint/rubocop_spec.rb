require 'spec_helper'

describe 'Check that the files we have changed have correct syntax' do
  let(:current_sha) { `git rev-parse --verify HEAD`.strip! }
  let(:files)       { `git diff master #{current_sha} --name-only | grep .rb` }
  let(:report)      { `rubocop #{files.tr("\n", ' ')}` }

  it 'has no offenses' do
    expect(report).not_to match(/Offenses/)
  end
end
