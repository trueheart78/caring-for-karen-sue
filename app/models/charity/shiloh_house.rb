# frozen_string_literal: true

class Charity::ShilohHouse
  class << self
    def name
      "the Shiloh House"
    end

    def local?
      false
    end

    def url
      "https://www.shilohhouse.org"
    end

    def logo
      "shiloh-house.png"
    end

    def copy
      <<~HTML.strip
        The Shiloh House is a 501 (C) (3) that offers both residential and non-residential treatment for the treatment of male and female youth. They are greatly involved in foster care and they also give back and help the community. Visit them online at <a href='#{url}' target='_blank'>shilohhouse.org</a>
      HTML
    end
  end
end
