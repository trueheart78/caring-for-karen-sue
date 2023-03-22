# frozen_string_literal: true

require "rails_helper"

RSpec.describe "StandardRB Linter" do
  let(:clean_report) { system "standardrb --no-fix >/dev/null 2>&1" }

  it "has a clean report" do
    expect(clean_report).to be true
  end
end
