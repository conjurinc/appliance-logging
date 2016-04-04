require 'logger'
require "conjur/appliance/logging/version"

module Conjur
  module Appliance
    module Logging
      log_level = ENV['LOG_LEVEL'] || 'info'
      RAILS_LOG_LEVEL = log_level.to_sym
      LOG_LEVEL = ::Logger.const_get(log_level.upcase)
    end
  end
end

if defined?(Rails)
  require 'conjur/appliance/logging/railtie'
elsif defined?(Sinatra)
  require 'conjur/appliance/logging/sinatra'
end
