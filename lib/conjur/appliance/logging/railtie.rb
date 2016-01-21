module Conjur
  module Appliance
    module Logging
      class Railtie < Rails::Railtie
        initializer "conjur.appliance.logging.initializer" do |app|
          if Rails.env.to_sym == :appliance
            # Log to STDOUT at WARN level in the appliance
            app.config.log_level = :warn
            
            major = Rails.version.split('.').first.to_i
            app.config.logger = case major
            when 3
              Logger.new(STDOUT)
            when 4
              ActiveSupport::Logger.new(STDOUT)
            else
              raise "Unsupported Rails version : #{major}"
            end
          end
        end
      end
    end
  end
end
