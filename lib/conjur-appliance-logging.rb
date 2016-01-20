require "conjur/appliance/logging/version"

if defined?(Rails)
  require 'conjur/appliance/logging/rails'
elsif defined?(Sinatra)
  require 'conjur/appliance/logging/sinatra'
end
