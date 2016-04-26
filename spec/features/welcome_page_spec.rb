require 'rails_helper'

RSpec.feature 'About Page', type: :feature do
  before do
    visit root_path
  end

  scenario 'Provides a link to the Home page' do
    expect(page.find_link('Home')).to be_visible
  end

  scenario 'Provides a link to the Sponsor page' do
    expect(page.find_link('Sponsor')).to be_visible
  end

  scenario 'Provides a link to the About page' do
    expect(page.find_link('About')).to be_visible
  end

  scenario 'Provides two buttons to Sign Up' do
    expect(page.all('li a', text: 'Sign Up').count).to eq(2)
  end
end
