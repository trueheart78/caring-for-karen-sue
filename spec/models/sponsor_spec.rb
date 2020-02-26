# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sponsor, type: :model do
  subject(:sponsor) { described_class.new }

  it { respond_to :name }
  it { respond_to :tagline }
  it { respond_to :url }
  it { respond_to :image }
  it { respond_to :active? }
end
