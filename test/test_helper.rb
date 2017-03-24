require 'paggi'
require 'test/unit'
require 'mocha/setup'
require 'shoulda'
require 'webmock/test_unit'
require File.expand_path('../test_mock.rb', __FILE__)

class Test::Unit::TestCase
  include Mocha
  include Paggi::TestMock

  setup do
    Paggi.setup do |config|
      config.api_key = '123'
      config.version = 'v4demo'
      config.host = 'http://online.paggi.com'
    end
  end
end
