# frozen_string_literal: true

module Donations::RegistrationsHelper
  def registration_options
    Registration.all.map do |k, v|
      ["#{v} for $#{number_with_delimiter(k, delimiter: ',')} ", k]
    end
  end
end
