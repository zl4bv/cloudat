module Cloudat
  class Configuration
    def action_classes
      action_loader.actions
    end

    def action_loader
      @action_loader ||= Cloudat::Action::Loader.new
    end

    def event_classes
      event_loader.events
    end

    def event_loader
      @event_loader ||= Cloudat::Event::Loader.new
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
