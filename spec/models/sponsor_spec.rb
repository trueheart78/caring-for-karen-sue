# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sponsor do
  subject(:sponsor) { described_class.new }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :tagline }
  it { is_expected.to respond_to :url }
  it { is_expected.to respond_to :image }
  it { is_expected.to respond_to :active? }
end
