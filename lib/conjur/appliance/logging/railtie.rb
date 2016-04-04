module Conjur
  module Appliance
    module Logging
      class Railtie < Rails::Railtie
        # This initializer needs to run before anybody else has
        # initialized the logger.
        initializer "conjur.appliance.logging.initializer", :before => :initialize_logger do |app|
          if Rails.env.to_sym == :appliance
            app.config.log_level = Logging::RAILS_LOG_LEVEL
            
            major = Rails.version.split('.').first.to_i
            app.config.logger = case major
            when 3
              Logger.new(STDOUT)
            when 4
              ActiveSupport::Logger.new(STDOUT)
            else
              raise "Unsupported Rails version : #{major}"
            end
            app.config.logger.level = Logging::LOG_LEVEL
          end
        end
      end
    end
  end
end
