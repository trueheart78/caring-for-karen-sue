require 'spec_helper'

describe 'Branch changes have correct syntax' do
  let(:current_sha) { `git rev-parse --verify HEAD`.strip! }
  let(:files)       { `git diff master #{current_sha} --name-only | grep .rb` }
  let(:report)      { `bundle exec rubocop #{files.tr("\n", ' ')}` }

  it 'makes Rubocop happy' do
    expect(report).not_to match(/Offenses/)
  end
end
