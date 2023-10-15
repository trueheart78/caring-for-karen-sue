# frozen_string_literal: true

require "simplecov"

SimpleCov.minimum_coverage 93
SimpleCov.start "rails" unless ENV["SKIP_COVERAGE"]
