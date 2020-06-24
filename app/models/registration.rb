# frozen_string_literal: true

class Registration
  class << self
    def find(value:)
      return unless value.to_i.positive?

      all[value.to_i]
    end

    def all
      {}.tap do |h|
        (1..10).each do |n|
          plural = n > 1 ? 's' : ''
          h[n * cost] = "#{n} player#{plural}"
        end
      end
    end

    def cost
      100
    end

    def qty_from_total(total)
      total / cost
    end
  end
end
