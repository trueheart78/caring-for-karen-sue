# frozen_string_literal: true

class Site
  class << self
    def title
      'Caring for Karen Sue'
    end

    def website
      'CaringForKarenSue.com'
    end

    def url
      'https://www.caringforkarensue.com'
    end

    def facebook_url
      'https://facebook.com/caringforkarensue'
    end

    def description(iteration:)
      [
        "Come register for the #{iteration} Annual Golf Classic, ",
        'a four man best ball-scramble type tournament.'
      ].join
    end

    def image_url
      File.join url, image
    end

    def image
      'images/gloves.png'
    end
  end
end
