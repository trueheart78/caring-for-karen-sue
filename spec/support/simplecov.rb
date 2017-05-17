require 'simplecov'
require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.minimum_coverage 90
SimpleCov.start 'rails' unless ENV['SKIP_COVERAGE']
