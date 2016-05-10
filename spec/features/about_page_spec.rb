require 'rails_helper'

RSpec.feature 'About Page', type: :feature do
  before do
    visit about_path
  end

  scenario 'Provides a valid Shiloh House link' do
    expect(page.find_link('shilohhouse.org')).to be_visible
  end

  scenario 'Displays founder name, Karen Sue Danielson' do
    expect(page.text).to include('Karen Sue Danielson')
  end
end
