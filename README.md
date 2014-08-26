# Dynadot

A Ruby interface to the [Dynadot's Domain API](https://www.dynadot.com/domain/api2.html).

## Installation

Add this line to your application's Gemfile:

    gem 'dynadot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynadot

## Usage

    require 'dynadot'

    dynadot = Dynadot::Api.new('DYNADOT_API_KEY')

    # Execute a command and get raw results
    dynadot.execute :search, { domain0: "example.com", domain1: "example.net" }
    # => [["domain0", "example.com", "", "no"], ["domain1", "example.net", "", "no"]]

    # A less messy way to do a domain search
    dynadot.search("example.com", "example.net")
    # => {"example.com"=>false, "example.net"=>false }

    # Short-hand for availability check
    dynadot.availabile?("example.com")
    # => false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
