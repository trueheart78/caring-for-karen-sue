# frozen_string_literal: true

class Lunch
  class << self
    def find(value:)
      return unless value.to_i.positive?

      all[value.to_i]
    end

    def all
      {}.tap do |h|
        (1..10).each do |n|
          plural = (n > 1) ? "es" : ""
          h[n * cost] = "#{n} lunch#{plural}"
        end
      end
    end

    def cost
      25
    end

    def qty_from_total(total)
      total / cost
    end
  end
end
