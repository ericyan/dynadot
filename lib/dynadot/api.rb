require 'httparty'

module Dynadot
  class Api
    include HTTParty
    base_uri 'https://api.dynadot.com/api2.html'
  end
end
