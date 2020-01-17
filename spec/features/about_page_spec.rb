# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'About Page', type: :feature do
  before do
    visit about_path
  end

  it 'Provides a valid Shiloh House link' do
    expect(page.find_link('shilohhouse.org')).to be_visible
  end

  it 'Displays founder name, Karen Sue Danielson' do
    expect(page.text).to include('Karen Sue Danielson')
  end
end
