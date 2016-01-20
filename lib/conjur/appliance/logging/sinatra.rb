module Conjur
  module Appliance
    module Logging
      # Don't log requests in the appliance. Nginx does this for us.
      # Do always dump errors to STDERR.
      module Sinatra
        def extended cls
          cls.module_eval do
            enable :logging
            set :dump_errors, true
            
            configure :appliance do
              disable :logging
            end
          end
        end
      end
    end
  end
end
