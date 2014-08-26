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

    def search(*domains)
      parameters = Hash[domains.map.with_index { |domain, index| ["domain#{index}" , domain] }]
      results = execute(:search, parameters).map do |result|
        domain, availability = result[1], result[3]

        case availability
        when 'yes' then [domain, true]
        when 'no' then [domain, false]
        when 'offline' then [domain, nil]
        when 'system_busy' then [domain, nil]
        when 'error' then raise "Error processing #{domain}: #{result[4]}"
        end
      end

      return Hash[results]
    end

    def availabile?(domain)
      search(domain)[domain]
    end

    private
      def parse(response)
        data = response.parsed_response.split("\n")
        data.delete_at(1)

        error = data[0, 2] != 'ok' ? data.shift.split(",")[1] : nil
        results = data.map { |line| line.split(",") }

        if error
          raise error
        else
          return results
        end
      end
  end
end
