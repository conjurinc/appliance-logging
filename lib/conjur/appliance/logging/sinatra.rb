module Conjur
  module Appliance
    module Logging
      module Sinatra
        def self.extended cls
          cls.module_eval do

            configure do
              enable :logging
              set :dump_errors, true
            end

            configure :appliance do
              # don't use Sinatra's builtin logging
              disable :logging

              # do use a logger that writes to stdout
              logger = ::Logger.new(STDOUT)
              logger.level = Logging::LOG_LEVEL
              use ::Rack::CommonLogger, logger
            end
          end
        end
      end
    end
  end
end
