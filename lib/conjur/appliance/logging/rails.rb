module Conjur
  module Appliance
    module Logging
      class Railtie < Rails::Railtie
        initializer "conjur.appliance.logging.initializer" do |app|
          if Rails.env.to_sym == :appliance
            # Log to STDOUT at WARN level in the appliance
            app.config.log_level = :warn
            app.config.logger = Logger.new(STDOUT)
          end
        end
      end
    end
  end
end
