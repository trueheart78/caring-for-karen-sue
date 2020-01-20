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
]

sponsors.each do |s|
  Sponsor.create s
end
