require "conjur/appliance/logging/version"

if defined?(Rails)
  require 'conjur/appliance/logging/railtie'
elsif defined?(Sinatra)
  require 'conjur/appliance/logging/sinatra'
end
