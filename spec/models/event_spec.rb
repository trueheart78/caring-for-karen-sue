# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { described_class }

  it 'has the expected venue' do
    expect(event.venue).to eq 'Applewood Golf Course'
  end

  it 'has the expected full_address' do
    expect(event.full_address).to eq ['14001 W. 32nd Avenue',
                                      'Golden, CO 80401']
  end

  it 'has the expected website' do
    expect(event.website).to eq 'https://www.applewoodgc.com/'
  end

  it 'has the expected date' do
    expect(event.date).to eq 'Saturday, September 11th, 2021'
  end

  it 'has the expected time' do
    expect(event.time).to eq '7:30am Shotgun Start'
  end

  it 'has the expected check deadline' do
    expect(event.check_deadline).to eq 'Wednesday, September 1st, 2021'
  end

  it 'has the expected iteration' do
    expect(event.iteration).to eq '11th'
  end

  it 'has the expected google maps url' do
    expect(event.google_maps_url).to eq 'https://maps.google.com/maps?q=Applewood+Golf+Course,+W+32nd+Ave,+Golden,+CO&hl=en&ll=39.76489,-105.156605&spn=0.010177,0.020084&sll=39.762611,-105.157246&sspn=0.010177,0.020084&oq=apple14001+W+32nd+Ave,+Golden,+CO&t=m&z=16&iwloc=A'
  end
end
