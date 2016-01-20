module Conjur
  module Appliance
    module Logging
      module Sinatra
        enable :logging
        set :dump_errors, true
        
        configure :appliance do
          disable :logging
        end
      end
    end
  end
end