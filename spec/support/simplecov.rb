# frozen_string_literal: true

require 'simplecov'
require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.minimum_coverage 89
SimpleCov.start 'rails' unless ENV['SKIP_COVERAGE']
