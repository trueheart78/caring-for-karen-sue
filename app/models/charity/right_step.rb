# frozen_string_literal: true

class Charity::RightStep
  class << self
    def name
      'Right Step'
    end

    def url
      'https://www.therightstepinc.org'
    end

    def logo
      'right-step.jpg'
    end

    def copy
      <<~HTML.strip
        The Right Step is a 501 (C) (3) that's mission is to better the lives of people with disabilities through the healing power of horses. They are a therapeutic riding program where clients of all ages with a range of physical, emotional, behavioral and cognitive disabilities experience freedoms they have never felt before. Visit them online at <a href='#{url}' target='_blank'>therightstepinc.org</a>
      HTML
    end
  end
end
