# RBS Formatter

very simple formatter for [ruby/rbs](https://github.com/ruby/rbs)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbs_formatter', git: 'https://github.com/shoma07/rbs_formatter.git'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install specific_install
    $ gem specific_install https://github.com/shoma07/rbs_formatter.git

## Usage

```ruby
$ bundle exec rbs_formatter
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rbs_formatter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
