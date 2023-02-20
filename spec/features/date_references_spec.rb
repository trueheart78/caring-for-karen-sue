# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dates' do
  it 'About page has the current iteration' do
    visit about_path
    expect(page.text).to include('eleventh')
  end

  it 'Homepage banner has the current iteration' do
    visit root_path
    banner = page.find_by_id 'banner'
    expect(banner).to be_visible
    expect(banner.text).to include('11th')
  end
end
