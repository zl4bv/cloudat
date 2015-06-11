module Cloudat
  class Configuration
    def action_methods
      resource_loader.actions
    end

    def resource_classes
      resource_loader.resources
    end

    def resource_loader
      @resource_loader ||= Cloudat::Resource::Loader.new
    end

    def load_provider(provider)
      require "cloudat/#{provider}"
    end
  end
end
