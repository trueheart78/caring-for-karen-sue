# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'About Page' do
  before do
    visit about_path
  end

  it 'Displays founder name, Karen Sue Danielson' do
    expect(page.text).to include('Karen Sue Danielson')
  end
end
