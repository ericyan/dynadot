require 'httparty'

module Dynadot
  class Api
    include HTTParty
    base_uri 'https://api.dynadot.com/api2.html'

    def initialize(key = nil)
      raise ArgumentError, 'An API key is required' if key.to_s.empty?
      self.class.default_params key: key.to_s
    end

    def execute(command, parameters = {})
      response = self.class.get '', query: { command: command.to_s }.merge(parameters)
      parse(response)
    end

    private
      def parse(response)
        data = response.parsed_response.split("\n")
        data.delete_at(1)

        return {
          error: data[0, 2] != 'ok' ? data.shift.split(",")[1] : nil,
          results: data.map { |line| line.split(",") }
        }
      end
  end
end
