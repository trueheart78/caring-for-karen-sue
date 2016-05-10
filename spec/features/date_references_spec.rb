require 'rails_helper'

RSpec.feature 'Dates', type: :feature do
  scenario 'About page has the current iteration' do
    visit about_path
    expect(page.text).to include('seventh')
  end

  scenario 'Homepage banner has the current iteration' do
    visit root_path
    banner = page.find '#banner'
    expect(banner).to be_visible
    expect(banner.text).to include('7th')
  end
end
