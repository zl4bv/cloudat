module Cloudat
  module Resource
    # Register the resource class
    # @param resource_class [Class] resource class to register
    # @param actions [Symbol, ...] one or more actions to be registered
    #   to the specified resource
    def self.register(resource_class, *actions)
      Loader.resources[resource_class] = actions
    end

    def self.load_provider(provider)
      require "cloudat/resource/#{provider}"
    end

    class Loader
      def self.resources
        @resources ||= {}
      end

      # For now we include all resources, but we could change this later
      def resources
        Loader.resources.keys
      end
    end
  end
end

