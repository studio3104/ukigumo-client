$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "rspec"
require "webmock/rspec"

require "ukigumo/client"

RSpec.configure do |config|
end
