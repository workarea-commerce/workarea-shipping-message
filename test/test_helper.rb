require "simplecov"

SimpleCov.start "rails" do
  add_filter "lib/workarea/shipping_message/version.rb"
  add_filter %r{seeds}
end

ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
require "rails/test_help"
require "workarea/test_help"

Minitest.backtrace_filter = Minitest::BacktraceFilter.new
