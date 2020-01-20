# frozen_string_literal: true

class Sponsor < ApplicationRecord
  default_scope { where active: true }
end
