# frozen_string_literal: true

class HoleSponsor
  class << self
    def find(value:)
      return unless value.to_i.positive?

      all[value.to_i]
    end

    def all
      {
        200 => {name: "Hole",
                description: "1 Hole Sponsor"},
        500 => {name: "Birdie",
                description: "1 Foursome and 1 Hole Sponsor"},
        700 => {name: "Eagle",
                description: "1 Foursome and 2 Hole Sponsors"},
        1_000 => {name: "Hole in One",
                  description: "1 Foursome, 2 Hole Sponsors, Logo on Website and Banner, KOOZIES with your logo for each golf player"},
        1_150 => {name: "Hole in One Upgrade",
                  description: "1 Foursome, 2 Hole Sponsors, Logo on Website and Banner, KOOZIES with your logo for each golf player AND a sleeve of golf balls with your logo on it for each golf player"}
      }
    end
  end
end
