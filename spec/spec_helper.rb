require 'rspec'
require 'linked_in'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end