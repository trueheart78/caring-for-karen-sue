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
          h[n * 100] = "#{n} player#{plural}"
        end
      end
    end
  end
end
