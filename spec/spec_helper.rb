require 'ecwid-api'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassetes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<STORE_ID>') { ENV['STORE_ID'] }
  c.filter_sensitive_data('<TOKEN>') { ENV['TOKEN'] }
end