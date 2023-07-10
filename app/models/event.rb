# frozen_string_literal: true

class Event
  class << self
    def venue
      "Applewood Golf Course"
    end

    def full_address
      [
        address,
        "#{city}, #{state} #{zip}"
      ]
    end

    def date
      "Saturday, September 16th, 2023"
    end

    def time
      "7:30am Shotgun Start"
    end

    def check_deadline
      "Wednesday, August 30th, 2023"
    end

    def iteration
      "12th"
    end

    def google_maps_url
      "https://maps.google.com/maps?q=Applewood+Golf+Course,+W+32nd+Ave,+Golden,+CO&hl=en&ll=39.76489,-105.156605&spn=0.010177,0.020084&sll=39.762611,-105.157246&sspn=0.010177,0.020084&oq=apple14001+W+32nd+Ave,+Golden,+CO&t=m&z=16&iwloc=A"
    end

    def website
      "https://www.applewoodgc.com/"
    end

    private

    def address
      "14001 W. 32nd Avenue"
    end

    def city
      "Golden"
    end

    def state
      "CO"
    end

    def zip
      "80401"
    end
  end
end
