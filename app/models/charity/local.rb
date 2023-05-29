# frozen_string_literal: true

class Charity::Local
  class << self
    def name
      "local nonprofits"
    end

    def local?
      true
    end

    def url
      nil
    end

    def logo
      nil
    end

    def copy
      nil
    end
  end
end
