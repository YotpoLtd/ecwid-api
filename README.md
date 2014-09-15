# Ecwid::Api

## Installation

Add this line to your application's Gemfile:

    gem 'ecwid-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ecwid-api

## Usage

Configure:

```ruby
Ecwid.configure do |conf|
  conf.id = 'id'
  conf.secret = 'secret'
end
```

Create a client, and use it to call the Ecwid API:

```ruby
client = Ecwid::Client.new('store_id', 'token')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
