require 'httparty'

module Dynadot
  class Api
    include HTTParty
    base_uri 'https://api.dynadot.com/api2.html'

    def initialize(key = nil)
      raise ArgumentError, 'An API key is required' if key.to_s.empty?
      self.class.default_params key: key.to_s
    end
  end
end
