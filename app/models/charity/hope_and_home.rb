# frozen_string_literal: true

class Charity::HopeAndHome
  class << self
    def name
      "Hope & Home"
    end

    def local?
      false
    end

    def url
      "https://www.hopeandhome.org"
    end

    def logo
      "hope-and-home.png"
    end

    def copy
      <<~HTML.strip
        As a nondenominational Christian charity, Hope & Home trains and actively supports foster families all across the Front Range who feel compelled by Christ’s command to take care of “the least of these.”<br>
        <br>
        Abused and neglected children who’ve been removed from their birth homes get a stable and nurturing family to live with until it’s safe to go home again, or — when that safety isn’t possible — a family to give them a “forever home” through adoption.<br>
        <br>
        Visit them online at <a href='#{url}' target='_blank'>hopeandhome.org</a>
      HTML
    end
  end
end
