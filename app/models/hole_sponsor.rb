# frozen_string_literal: true

class HoleSponsor
  class << self
    def find(value:)
      return unless value.to_i.positive?

      all[value.to_i]
    end

    def first_amount
      all.keys.first
    end

    def all
      {
        300 => {name: "Hole",
                disabled: false,
                description: "1 Hole Sponsor"},
        600 => {name: "Birdie",
                disabled: false,
                description: "1 Foursome and 1 Hole Sponsor"},
        800 => {name: "Eagle",
                disabled: false,
                description: "1 Foursome and 2 Hole Sponsors"},
        1_500 => {name: "Hole in One",
                  disabled: true,
                  display_cost: "1,500+",
                  description: "<b><a href='mailto:#{ENV["ADMIN_EMAIL"]}?subject=Hole%20in%20One%20Sponsor%20Request'>Email Dan to Purchase</a></b>"}
      }
    end
  end
end
