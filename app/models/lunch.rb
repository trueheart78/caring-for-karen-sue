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
          plural = n > 1 ? 'es' : ''
          h[n * 100] = "#{n} lunch#{plural}"
        end
      end
    end
  end
end
