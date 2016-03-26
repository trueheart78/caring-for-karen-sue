require 'rails_helper'

RSpec.feature 'Dates', type: :feature do
  scenario 'Visit the About page' do
    visit '/about/'
    expect(page.text).to include('seventh')
  end

  scenario 'On the homepage banner' do
    visit '/'
    expect(page.text).to include('7th')
  end
end
