require 'yaml'
require 'httparty'

require 'paggi/rest/create'
require 'paggi/rest/update'
require 'paggi/rest/get_all'
require 'paggi/util'
require 'paggi/resource'
require 'paggi/card'
require 'paggi/customer'
require 'paggi/charge'
require 'paggi/payment'
require 'paggi/error'
require 'paggi/paginated'
require 'paggi/configuration'

module Paggi
  class << self
    attr_accessor :configuration

    def setup
      self.configuration ||= Paggi::Configuration.new
      yield configuration
    end
  end
end
