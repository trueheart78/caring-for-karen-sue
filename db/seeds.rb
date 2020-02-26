# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sponsors = [
  {
    name: 'Applewood Golf Course',
    tagline: 'Excellent Golf at the Foothills of the Rockies',
    url: 'https://www.applewoodgc.com',
    image: 'applewood-golf-course.png',
    active: true
  },
  {
    name: 'Vista at Applewood Golf Course',
    tagline: ' ',
    url: 'http://www.vistaapplewood.com',
    image: 'the-vista-at-applewood.png',
    active: true
  },
  {
    name: 'Longmont Ford Dealer',
    tagline: '3rd & Alpine',
    url: 'https://www.longmontford.com/',
    image: 'longmont-ford.png',
    active: true
  },
  {
    name: 'H.W. Houston Construction',
    tagline: 'We live where we build. We build where we live.',
    url: 'https://www.hwhouston.com/',
    image: 'hw-houston.png',
    active: true
  },
  {
    name: 'First Bank',
    tagline: 'Banking for good.',
    url: 'https://www.efirstbank.com/',
    image: 'first-bank.png',
    active: true
  },
  {
    name: 'Davis Partnership Architects',
    tagline: ' ',
    url: 'https://davispartnership.com/',
    image: 'davis-partnership-architects.png',
    active: true
  },
]

Sponsor.unscope(:where).destroy_all
sponsors.each do |s|
  Sponsor.create s
end
