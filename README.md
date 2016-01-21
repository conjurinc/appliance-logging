# Conjur::Appliance::Logging

Applies standard logging configuration to Conjur appliance (Docker container) services.

In the container, the following design applies to service logging:

1. The [phusion/baseimage](https://github.com/phusion/baseimage-docker) Docker image runs `syslog-ng`, a syslog
daemon which also forwards all messages to `docker logs`.
1. All Conjur services use a `runit` `log/run` script which redirects all service log output from stdout to syslog.
1. All Conjur services log to stdout.
1. Service logging should not be verbose, to avoid emitting sensitive information into the log. The primary source of 
service logging is the `nginx` web server log, which also goes to syslog.
1. Exception stack traces which occur in services *should* be emitted to syslog.
1. Internal messages between services are not logged, unless they go through Nginx.

Design elements (1) and (2) are implemented by the container itself. Elements (3) through (5) are the responsibility of the
services themselves. The purpose of this Ruby gem is to implement the necessary configuration in a uniform way.

Sinatra and Rails are the frameworks supported directly by this gem. 

## Rails

In a Rails application, `require "conjur-appliance-logging"` triggers a [Railtie](/conjurinc/appliance-logging/blob/master/lib/conjur/appliance/logging/railtie.rb) which does the following, *only if Rails.env is "appliance"*:

* Sets `log_level` to `:warn`
* For Rails 3, sets the application logger to `Logger.new(STDOUT)`
* For Rails 4, sets the application logger to `ActiveSupport::Logger.new(STDOUT)`

### Sinatra

In a Sinatra application, first `require "conjur-appliance-logging"`and then extend [Conjur::Appliance::Logging::Sinatra](https://github.com/conjurinc/appliance-logging/blob/master/lib/conjur/appliance/logging/sinatra.rb) in your app.

The extended module does the following:

* Enables `logging` for all environments except for "appliance"
* Enables `dump_errors` for all environments

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conjur-appliance-logging'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conjur-appliance-logging

## Usage

Requiring the gem is all you need to do for Rails applications.

For Sinatra, `extend` the module `Conjur::Appliance::Logging::Sinatra`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/conjurinc/appliance-logging.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

