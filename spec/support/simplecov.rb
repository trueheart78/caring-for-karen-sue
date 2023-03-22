# frozen_string_literal: true

require "simplecov"

SimpleCov.minimum_coverage 89
SimpleCov.start "rails" unless ENV["SKIP_COVERAGE"]
