require 'dynadot'

require 'rspec'
require 'webmock/rspec'
require 'vcr'
 
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
