# const_cache

Cache slow constant lookups in a static data structure to speed up application launch in RubyMotion apps.

## Installation

Add this line to your application's Gemfile:

    gem 'const_cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install const_cache

## Usage

There is nothing to do except require the gem. It will generate an `app/_const_cache.rb` file at runtime that is compiled on the next build that populates the constant cache on launch.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
