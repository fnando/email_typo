# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "bundler/setup"
require "email_typo"

require "minitest/utils"
require "minitest/autorun"
require "email_data"

Dir["#{__dir__}/support/**/*.rb"].sort.each do |file|
  require file
end
